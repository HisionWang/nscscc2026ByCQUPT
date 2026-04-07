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

void Vsimu_top___024root__trace_chg_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_chg_0_sub_0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
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
        bufp->chgBit(oldp+36,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready));
        bufp->chgBit(oldp+37,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready));
        bufp->chgBit(oldp+38,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid));
        bufp->chgBit(oldp+39,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready));
        bufp->chgIData(oldp+40,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata),32);
        bufp->chgBit(oldp+41,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_in_rvalid));
        bufp->chgBit(oldp+42,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
        bufp->chgBit(oldp+43,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready));
        bufp->chgBit(oldp+44,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid))));
        bufp->chgBit(oldp+45,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))));
        bufp->chgBit(oldp+46,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 3U))));
        bufp->chgBit(oldp+47,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 3U))));
        bufp->chgBit(oldp+48,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 2U))));
        bufp->chgBit(oldp+49,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 2U))));
        bufp->chgBit(oldp+50,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren));
        bufp->chgCData(oldp+51,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen),4);
        bufp->chgBit(oldp+52,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu));
        bufp->chgBit(oldp+53,((((8U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                   & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                      >> 2U))) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                                   >> 2U) 
                                                  & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid)))));
        bufp->chgCData(oldp+54,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt),4);
        bufp->chgBit(oldp+55,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 1U))));
        bufp->chgBit(oldp+56,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 1U))));
        bufp->chgBit(oldp+57,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                     >> 4U))));
        bufp->chgBit(oldp+58,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 4U))));
        bufp->chgIData(oldp+59,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0]),32);
        bufp->chgIData(oldp+60,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1]),32);
        bufp->chgIData(oldp+61,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2]),32);
        bufp->chgIData(oldp+62,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3]),32);
        bufp->chgIData(oldp+63,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4]),32);
        bufp->chgCData(oldp+64,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid),5);
        bufp->chgCData(oldp+65,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready),5);
        bufp->chgBit(oldp+66,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins));
        bufp->chgBit(oldp+67,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty)) 
                               & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
                                  & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast) 
                                     & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready))))));
        bufp->chgBit(oldp+68,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren))));
        bufp->chgBit(oldp+69,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+70,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+71,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+72,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+73,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+74,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
                                     | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                        >> 3U)))));
        bufp->chgBit(oldp+75,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast)) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+76,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+77,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+78,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+79,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+80,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
                               & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid)) 
                                  | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+81,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgBit(oldp+82,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en));
        bufp->chgBit(oldp+83,((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen))));
        bufp->chgBit(oldp+84,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8000U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+85,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8010U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+86,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8020U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+87,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8030U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+88,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8040U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+89,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8050U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+90,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8060U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+91,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0x8070U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+92,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer));
        bufp->chgBit(oldp+93,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0xff00U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+94,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0xff30U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+95,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0xff40U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+96,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid));
        bufp->chgBit(oldp+97,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                               & (0xf020U == (0x0000ffffU 
                                              & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgCData(oldp+98,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state),3);
        bufp->chgSData(oldp+99,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp),16);
        bufp->chgBit(oldp+100,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf030U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+101,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf040U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+102,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                                & (0xf050U == (0x0000ffffU 
                                               & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
        bufp->chgBit(oldp+103,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))));
        bufp->chgBit(oldp+104,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready))));
        bufp->chgBit(oldp+105,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))));
        bufp->chgIData(oldp+106,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rdata),32);
        bufp->chgBit(oldp+107,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid));
        bufp->chgBit(oldp+108,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid))));
        bufp->chgBit(oldp+109,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))));
        bufp->chgBit(oldp+110,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready))));
        bufp->chgBit(oldp+111,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))));
        bufp->chgIData(oldp+112,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rdata),32);
        bufp->chgBit(oldp+113,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid));
        bufp->chgBit(oldp+114,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid))));
        bufp->chgBit(oldp+115,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))));
        bufp->chgBit(oldp+116,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready))));
        bufp->chgBit(oldp+117,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))));
        bufp->chgIData(oldp+118,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rdata),32);
        bufp->chgBit(oldp+119,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid));
        bufp->chgBit(oldp+120,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid))));
        bufp->chgBit(oldp+121,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_arready))));
        bufp->chgBit(oldp+122,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_aw_awready))));
        bufp->chgBit(oldp+123,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))));
        bufp->chgIData(oldp+124,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata),32);
        bufp->chgBit(oldp+125,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid));
        bufp->chgBit(oldp+126,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_in_bvalid))));
        bufp->chgIData(oldp+127,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                             ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rvalid)
                                                 ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_in_rdata
                                                 : 0U)
                                             : 0U)))),32);
        bufp->chgBit(oldp+128,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__io_cpu_if_resp_valid));
        bufp->chgIData(oldp+129,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                             ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rvalid)
                                                 ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_r_in_rdata
                                                 : 0U)
                                             : 0U)))),32);
        bufp->chgBit(oldp+130,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__io_cpu_if_resp_valid));
        bufp->chgIData(oldp+131,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                             ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rvalid)
                                                 ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_r_in_rdata
                                                 : 0U)
                                             : 0U)))),32);
        bufp->chgBit(oldp+132,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__io_cpu_if_resp_valid));
        bufp->chgIData(oldp+133,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                            ? 0U : 
                                           ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                             ? ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rvalid)
                                                 ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache2_r_in_rdata
                                                 : 0U)
                                             : 0U)))),32);
        bufp->chgBit(oldp+134,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__io_cpu_if_resp_valid));
        bufp->chgBit(oldp+135,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready))));
        bufp->chgBit(oldp+136,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en))));
        bufp->chgBit(oldp+137,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push));
        bufp->chgBit(oldp+138,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
        bufp->chgBit(oldp+139,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push));
        bufp->chgBit(oldp+140,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop))));
        bufp->chgBit(oldp+141,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push));
        bufp->chgBit(oldp+142,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                                      | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)))));
        bufp->chgBit(oldp+143,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en));
        bufp->chgBit(oldp+144,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
        bufp->chgBit(oldp+145,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push));
        bufp->chgBit(oldp+146,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
        bufp->chgBit(oldp+147,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop))));
        bufp->chgBit(oldp+148,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push));
        bufp->chgBit(oldp+149,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
                                & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid)) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)))));
        bufp->chgBit(oldp+150,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push));
        bufp->chgBit(oldp+151,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en));
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[2U]))) {
        bufp->chgCData(oldp+152,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid),4);
        bufp->chgCData(oldp+153,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp),2);
        bufp->chgIData(oldp+154,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr),32);
        bufp->chgCData(oldp+155,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arsize),3);
        bufp->chgCData(oldp+156,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_arburst),2);
        bufp->chgBit(oldp+157,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                 ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                                    & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)))
                                 : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                     ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid)
                                     : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                         ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid)
                                         : (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid))))));
        bufp->chgCData(oldp+158,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid),4);
        bufp->chgCData(oldp+159,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp),2);
        bufp->chgBit(oldp+160,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast));
        bufp->chgBit(oldp+161,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                 ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                                    & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                                       & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))))
                                 : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                     ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                                        & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                                           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))))
                                     : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                         ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                                            & ((1U 
                                                != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                                               & (2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))))
                                         : ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                                            & ((1U 
                                                != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                                               & (2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)))))))));
        bufp->chgBit(oldp+162,(vlSelfRef.simu_top__DOT__soc__DOT__m0_awready));
        bufp->chgBit(oldp+163,(vlSelfRef.simu_top__DOT__soc__DOT__m0_wready));
        bufp->chgBit(oldp+164,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid));
        bufp->chgBit(oldp+165,(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready));
        bufp->chgBit(oldp+166,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid));
        bufp->chgBit(oldp+167,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+168,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready));
        bufp->chgCData(oldp+169,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+170,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+171,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))));
        bufp->chgBit(oldp+172,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+173,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid),4);
        bufp->chgBit(oldp+174,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+175,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+176,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
        bufp->chgBit(oldp+177,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready));
        bufp->chgCData(oldp+178,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data),4);
        bufp->chgBit(oldp+179,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
        bufp->chgBit(oldp+180,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 3U))));
        bufp->chgBit(oldp+181,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
        bufp->chgCData(oldp+182,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid),4);
        bufp->chgIData(oldp+183,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg),32);
        bufp->chgBit(oldp+184,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast));
        bufp->chgBit(oldp+185,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid));
        bufp->chgBit(oldp+186,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready));
        bufp->chgBit(oldp+187,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready));
        bufp->chgCData(oldp+188,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id),4);
        bufp->chgBit(oldp+189,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid));
        bufp->chgBit(oldp+190,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 2U))));
        bufp->chgBit(oldp+191,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready));
        bufp->chgCData(oldp+192,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id),4);
        bufp->chgIData(oldp+193,(((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
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
        bufp->chgBit(oldp+194,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast));
        bufp->chgBit(oldp+195,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid));
        bufp->chgIData(oldp+196,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+197,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+198,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgCData(oldp+199,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__uart0_int) 
                                  << 1U)),8);
        bufp->chgBit(oldp+200,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 1U))));
        bufp->chgBit(oldp+201,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))));
        bufp->chgBit(oldp+202,(vlSelfRef.simu_top__DOT__soc__DOT__uart0_int));
        bufp->chgBit(oldp+203,((IData)(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                          >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared)) 
                                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))));
        bufp->chgBit(oldp+204,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)))));
        bufp->chgBit(oldp+205,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                                      ^ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 3U)))));
        bufp->chgBit(oldp+206,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))));
        bufp->chgBit(oldp+207,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack))));
        bufp->chgIData(oldp+208,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao)
                                   : 0U)),32);
        bufp->chgBit(oldp+209,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant));
        bufp->chgBit(oldp+210,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack))));
        bufp->chgBit(oldp+211,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr));
        bufp->chgBit(oldp+212,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu));
        bufp->chgBit(oldp+213,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu));
        bufp->chgIData(oldp+214,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr),20);
        bufp->chgCData(oldp+215,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu),8);
        bufp->chgCData(oldp+216,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao),8);
        bufp->chgBit(oldp+217,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans));
        bufp->chgIData(oldp+218,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr),24);
        bufp->chgBit(oldp+219,((0U == (0x0000003fU 
                                       & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                          >> 0x0000000eU)))));
        bufp->chgBit(oldp+220,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack));
        bufp->chgBit(oldp+221,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
        bufp->chgBit(oldp+222,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel) 
                                & (0U == (0x000fc000U 
                                          & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))));
        bufp->chgIData(oldp+223,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr),20);
        bufp->chgCData(oldp+224,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai),8);
        bufp->chgCData(oldp+225,((0x000000ffU & ((4U 
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
        bufp->chgBit(oldp+226,((0U != (0x0000003fU 
                                       & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                          >> 0x0000000eU)))));
        bufp->chgBit(oldp+227,(((0U != (0x0000003fU 
                                        & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                           >> 0x0000000eU))) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel))));
        bufp->chgBit(oldp+228,(((0U != (0x0000003fU 
                                        & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                           >> 0x0000000eU))) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab))));
        bufp->chgIData(oldp+229,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                     ? (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                        >> 8U) : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr) 
                                   << 8U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai))),32);
        bufp->chgBit(oldp+230,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack));
        bufp->chgBit(oldp+231,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel));
        bufp->chgBit(oldp+232,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab));
        bufp->chgIData(oldp+233,((0x00ffffffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                                  ? 
                                                 (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                                  >> 8U)
                                                  : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr))),24);
        bufp->chgCData(oldp+234,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao),8);
        bufp->chgBit(oldp+235,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))));
        bufp->chgBit(oldp+236,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready));
        bufp->chgBit(oldp+237,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd));
        bufp->chgCData(oldp+238,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm),4);
        bufp->chgCData(oldp+239,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb),4);
        bufp->chgCData(oldp+240,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb),4);
        bufp->chgIData(oldp+241,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32),32);
        bufp->chgIData(oldp+242,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32),32);
        bufp->chgCData(oldp+243,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count),3);
        bufp->chgCData(oldp+244,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size),3);
        bufp->chgCData(oldp+245,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size),3);
        bufp->chgCData(oldp+246,((0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),8);
        bufp->chgBit(oldp+247,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we));
        bufp->chgBit(oldp+248,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re));
        bufp->chgBit(oldp+249,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en));
        bufp->chgBit(oldp+250,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en));
        bufp->chgBit(oldp+251,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode));
        bufp->chgCData(oldp+252,((7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),3);
        bufp->chgBit(oldp+253,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable));
        bufp->chgBit(oldp+254,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad));
        bufp->chgCData(oldp+255,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier),4);
        bufp->chgCData(oldp+256,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir),4);
        bufp->chgCData(oldp+257,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr),2);
        bufp->chgCData(oldp+258,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr),5);
        bufp->chgBit(oldp+259,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared));
        bufp->chgBit(oldp+260,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol));
        bufp->chgCData(oldp+261,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr),8);
        bufp->chgCData(oldp+262,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr),8);
        bufp->chgIData(oldp+263,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl),24);
        bufp->chgBit(oldp+264,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc));
        bufp->chgBit(oldp+265,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d));
        bufp->chgBit(oldp+266,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset));
        bufp->chgSData(oldp+267,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc),16);
        bufp->chgCData(oldp+268,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level),4);
        bufp->chgBit(oldp+269,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset));
        bufp->chgBit(oldp+270,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset));
        bufp->chgBit(oldp+271,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                      >> 7U))));
        bufp->chgBit(oldp+272,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 2U))));
        bufp->chgBit(oldp+273,((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                         >> 2U)))));
        bufp->chgBit(oldp+274,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg));
        bufp->chgBit(oldp+275,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg));
        bufp->chgCData(oldp+276,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg),8);
        bufp->chgCData(oldp+277,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg),8);
        bufp->chgCData(oldp+278,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count),8);
        bufp->chgCData(oldp+279,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg),3);
        bufp->chgBit(oldp+280,((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+281,((1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+282,((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+283,((3U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
        bufp->chgBit(oldp+284,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                                | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                       >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))));
        bufp->chgBit(oldp+285,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 3U))));
        bufp->chgBit(oldp+286,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                      >> 4U))));
        bufp->chgBit(oldp+287,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                      >> 3U))));
        bufp->chgBit(oldp+288,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                      >> 2U))));
        bufp->chgBit(oldp+289,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                      >> 1U))));
        bufp->chgBit(oldp+290,((1U & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0))));
        bufp->chgCData(oldp+291,(((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
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
        bufp->chgBit(oldp+292,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0));
        bufp->chgBit(oldp+293,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
        bufp->chgBit(oldp+294,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2));
        bufp->chgBit(oldp+295,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3));
        bufp->chgBit(oldp+296,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4));
        bufp->chgBit(oldp+297,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5));
        bufp->chgBit(oldp+298,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6));
        bufp->chgBit(oldp+299,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7));
        bufp->chgBit(oldp+300,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r));
        bufp->chgBit(oldp+301,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r));
        bufp->chgBit(oldp+302,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r));
        bufp->chgBit(oldp+303,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r));
        bufp->chgBit(oldp+304,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r));
        bufp->chgBit(oldp+305,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
        bufp->chgBit(oldp+306,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r));
        bufp->chgBit(oldp+307,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r));
        bufp->chgBit(oldp+308,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask));
        bufp->chgBit(oldp+309,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int));
        bufp->chgBit(oldp+310,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int));
        bufp->chgBit(oldp+311,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int));
        bufp->chgBit(oldp+312,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int));
        bufp->chgBit(oldp+313,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int));
        bufp->chgBit(oldp+314,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we));
        bufp->chgBit(oldp+315,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop));
        bufp->chgSData(oldp+316,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out) 
                                   << 3U) | vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                  [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom])),11);
        bufp->chgBit(oldp+317,((0U != (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
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
        bufp->chgCData(oldp+318,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count),5);
        bufp->chgCData(oldp+319,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count),5);
        bufp->chgCData(oldp+320,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate),3);
        bufp->chgCData(oldp+321,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate),4);
        bufp->chgSData(oldp+322,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t),10);
        bufp->chgBit(oldp+323,((1U & (~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt))))));
        bufp->chgCData(oldp+324,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt),8);
        bufp->chgCData(oldp+325,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value),8);
        bufp->chgBit(oldp+326,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)) 
                                      | ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
                                         & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                                            | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0))))))));
        bufp->chgBit(oldp+327,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                   & (2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))))));
        bufp->chgBit(oldp+328,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
        bufp->chgBit(oldp+329,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i));
        bufp->chgBit(oldp+330,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we));
        bufp->chgBit(oldp+331,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
        bufp->chgBit(oldp+332,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read));
        bufp->chgBit(oldp+333,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read));
        bufp->chgBit(oldp+334,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read));
        bufp->chgCData(oldp+335,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals),4);
        bufp->chgBit(oldp+336,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d));
        bufp->chgBit(oldp+337,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d));
        bufp->chgBit(oldp+338,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d));
        bufp->chgBit(oldp+339,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d));
        bufp->chgBit(oldp+340,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d));
        bufp->chgBit(oldp+341,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d));
        bufp->chgBit(oldp+342,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d));
        bufp->chgBit(oldp+343,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d));
        bufp->chgSData(oldp+344,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt),9);
        bufp->chgSData(oldp+345,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next),9);
        bufp->chgBit(oldp+346,((1U & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                                       ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                                      >> 8U))));
        bufp->chgBit(oldp+347,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d));
        bufp->chgBit(oldp+348,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d));
        bufp->chgBit(oldp+349,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d));
        bufp->chgBit(oldp+350,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d));
        bufp->chgBit(oldp+351,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d));
        bufp->chgBit(oldp+352,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int))));
        bufp->chgBit(oldp+353,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int))));
        bufp->chgBit(oldp+354,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int))));
        bufp->chgBit(oldp+355,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int))));
        bufp->chgBit(oldp+356,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int))));
        bufp->chgBit(oldp+357,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd));
        bufp->chgBit(oldp+358,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd));
        bufp->chgBit(oldp+359,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd));
        bufp->chgBit(oldp+360,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd));
        bufp->chgBit(oldp+361,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd));
        bufp->chgBit(oldp+362,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read));
        bufp->chgBit(oldp+363,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0));
        bufp->chgBit(oldp+364,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable));
        bufp->chgCData(oldp+365,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16),4);
        bufp->chgCData(oldp+366,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter),3);
        bufp->chgCData(oldp+367,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift),8);
        bufp->chgBit(oldp+368,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity));
        bufp->chgBit(oldp+369,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error));
        bufp->chgBit(oldp+370,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error));
        bufp->chgBit(oldp+371,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in));
        bufp->chgBit(oldp+372,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor));
        bufp->chgCData(oldp+373,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b),8);
        bufp->chgBit(oldp+374,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q));
        bufp->chgSData(oldp+375,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in),11);
        bufp->chgBit(oldp+376,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
        bufp->chgBit(oldp+377,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b))));
        bufp->chgBit(oldp+378,((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+379,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgBit(oldp+380,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
        bufp->chgCData(oldp+381,((0x0000000fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                                                 - (IData)(1U)))),4);
        bufp->chgSData(oldp+382,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value),10);
        bufp->chgCData(oldp+383,((0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value) 
                                                 >> 2U))),8);
        bufp->chgCData(oldp+384,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out),8);
        bufp->chgCData(oldp+385,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0]),3);
        bufp->chgCData(oldp+386,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1]),3);
        bufp->chgCData(oldp+387,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2]),3);
        bufp->chgCData(oldp+388,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3]),3);
        bufp->chgCData(oldp+389,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4]),3);
        bufp->chgCData(oldp+390,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5]),3);
        bufp->chgCData(oldp+391,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6]),3);
        bufp->chgCData(oldp+392,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7]),3);
        bufp->chgCData(oldp+393,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8]),3);
        bufp->chgCData(oldp+394,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9]),3);
        bufp->chgCData(oldp+395,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[10]),3);
        bufp->chgCData(oldp+396,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[11]),3);
        bufp->chgCData(oldp+397,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[12]),3);
        bufp->chgCData(oldp+398,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[13]),3);
        bufp->chgCData(oldp+399,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[14]),3);
        bufp->chgCData(oldp+400,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[15]),3);
        bufp->chgCData(oldp+401,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top),4);
        bufp->chgCData(oldp+402,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom),4);
        bufp->chgCData(oldp+403,((0x0000000fU & ((IData)(1U) 
                                                 + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)))),4);
        bufp->chgCData(oldp+404,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0U]),3);
        bufp->chgCData(oldp+405,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [1U]),3);
        bufp->chgCData(oldp+406,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [2U]),3);
        bufp->chgCData(oldp+407,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [3U]),3);
        bufp->chgCData(oldp+408,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [4U]),3);
        bufp->chgCData(oldp+409,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [5U]),3);
        bufp->chgCData(oldp+410,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [6U]),3);
        bufp->chgCData(oldp+411,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [7U]),3);
        bufp->chgCData(oldp+412,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [8U]),3);
        bufp->chgCData(oldp+413,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [9U]),3);
        bufp->chgCData(oldp+414,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0aU]),3);
        bufp->chgCData(oldp+415,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0bU]),3);
        bufp->chgCData(oldp+416,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0cU]),3);
        bufp->chgCData(oldp+417,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0dU]),3);
        bufp->chgCData(oldp+418,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0eU]),3);
        bufp->chgCData(oldp+419,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                 [0x0fU]),3);
        bufp->chgCData(oldp+420,((0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in) 
                                                 >> 3U))),8);
        bufp->chgCData(oldp+421,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+422,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+423,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+424,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+425,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+426,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+427,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+428,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+429,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+430,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+431,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+432,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+433,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+434,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+435,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+436,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[15]),8);
        bufp->chgBit(oldp+437,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                                   | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                          >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode))))));
        bufp->chgCData(oldp+438,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter),5);
        bufp->chgCData(oldp+439,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter),3);
        bufp->chgCData(oldp+440,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out),7);
        bufp->chgBit(oldp+441,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
        bufp->chgBit(oldp+442,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor));
        bufp->chgBit(oldp+443,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop));
        bufp->chgBit(oldp+444,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out));
        bufp->chgBit(oldp+445,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error));
        bufp->chgCData(oldp+446,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time),3);
        bufp->chgCData(oldp+447,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out),8);
        bufp->chgBit(oldp+448,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun));
        bufp->chgCData(oldp+449,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak),8);
        bufp->chgCData(oldp+450,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top),4);
        bufp->chgCData(oldp+451,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom),4);
        bufp->chgCData(oldp+452,((0x0000000fU & ((IData)(1U) 
                                                 + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)))),4);
        bufp->chgCData(oldp+453,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[0]),8);
        bufp->chgCData(oldp+454,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[1]),8);
        bufp->chgCData(oldp+455,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[2]),8);
        bufp->chgCData(oldp+456,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[3]),8);
        bufp->chgCData(oldp+457,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[4]),8);
        bufp->chgCData(oldp+458,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[5]),8);
        bufp->chgCData(oldp+459,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[6]),8);
        bufp->chgCData(oldp+460,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[7]),8);
        bufp->chgCData(oldp+461,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[8]),8);
        bufp->chgCData(oldp+462,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[9]),8);
        bufp->chgCData(oldp+463,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[10]),8);
        bufp->chgCData(oldp+464,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[11]),8);
        bufp->chgCData(oldp+465,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[12]),8);
        bufp->chgCData(oldp+466,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[13]),8);
        bufp->chgCData(oldp+467,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[14]),8);
        bufp->chgCData(oldp+468,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[15]),8);
        bufp->chgBit(oldp+469,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 1U))));
        bufp->chgBit(oldp+470,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                      >> 4U))));
        bufp->chgCData(oldp+471,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit),5);
        bufp->chgCData(oldp+472,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit),5);
        bufp->chgCData(oldp+473,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit),5);
        bufp->chgCData(oldp+474,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready),5);
        bufp->chgCData(oldp+475,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready),5);
        bufp->chgCData(oldp+476,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid),5);
        bufp->chgCData(oldp+477,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready),5);
        bufp->chgCData(oldp+478,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast),5);
        bufp->chgCData(oldp+479,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid),5);
        bufp->chgCData(oldp+480,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0]),4);
        bufp->chgCData(oldp+481,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1]),4);
        bufp->chgCData(oldp+482,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2]),4);
        bufp->chgCData(oldp+483,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3]),4);
        bufp->chgCData(oldp+484,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4]),4);
        bufp->chgCData(oldp+485,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0]),4);
        bufp->chgCData(oldp+486,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1]),4);
        bufp->chgCData(oldp+487,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2]),4);
        bufp->chgCData(oldp+488,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3]),4);
        bufp->chgCData(oldp+489,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4]),4);
        bufp->chgCData(oldp+490,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready),5);
        bufp->chgCData(oldp+491,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0),3);
        bufp->chgCData(oldp+492,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1),3);
        bufp->chgCData(oldp+493,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0),3);
        bufp->chgCData(oldp+494,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                                        >> 3U))),3);
        bufp->chgCData(oldp+495,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                                   << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid))),3);
        bufp->chgCData(oldp+496,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                                        >> 3U))),3);
        bufp->chgBit(oldp+497,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty));
        bufp->chgBit(oldp+498,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full));
        bufp->chgBit(oldp+499,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty));
        bufp->chgBit(oldp+500,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full));
        bufp->chgCData(oldp+501,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir),3);
        bufp->chgCData(oldp+502,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel),3);
        bufp->chgBit(oldp+503,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog));
        bufp->chgCData(oldp+504,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg),3);
        bufp->chgCData(oldp+505,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel),3);
        bufp->chgCData(oldp+506,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel),3);
        bufp->chgCData(oldp+507,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir),3);
        bufp->chgCData(oldp+508,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel),3);
        bufp->chgBit(oldp+509,((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
                                         | (0x1fe0U 
                                            == (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_out_araddr 
                                                >> 0x00000010U)))))));
        bufp->chgIData(oldp+510,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int),32);
        bufp->chgCData(oldp+511,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+512,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+513,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+514,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+515,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+516,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+517,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i),32);
        bufp->chgCData(oldp+518,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[0]),3);
        bufp->chgCData(oldp+519,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[1]),3);
        bufp->chgCData(oldp+520,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr),2);
        bufp->chgCData(oldp+521,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr),2);
        bufp->chgBit(oldp+522,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr))));
        bufp->chgBit(oldp+523,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
        bufp->chgIData(oldp+524,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i),32);
        bufp->chgQData(oldp+525,((((QData)((IData)(
                                                   (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst) 
                                                     << 7U) 
                                                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize) 
                                                        << 4U) 
                                                       | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen))))) 
                                   << 0x00000024U) 
                                  | (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                      << 4U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid))))),45);
        bufp->chgIData(oldp+527,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+528,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
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
        bufp->chgIData(oldp+529,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
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
        bufp->chgCData(oldp+530,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+531,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+532,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+533,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+534,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+535,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+536,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+537,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+538,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+539,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data),45);
        bufp->chgQData(oldp+541,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+543,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                          >> 0x0000000dU))),32);
        bufp->chgCData(oldp+544,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+545,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+546,((0x0000000fU & (IData)(
                                                        (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                         >> 4U)))),4);
        bufp->chgCData(oldp+547,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+548,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+549,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+550,((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                   << 0x0000000dU) 
                                  | (QData)((IData)(
                                                    ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst) 
                                                       << 0x0000000bU) 
                                                      | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize) 
                                                         << 8U)) 
                                                     | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                         << 4U) 
                                                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid))))))),45);
        bufp->chgIData(oldp+552,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+553,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
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
        bufp->chgIData(oldp+554,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
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
        bufp->chgCData(oldp+555,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+556,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+557,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+558,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+559,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+560,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+561,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+562,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgBit(oldp+563,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push));
        bufp->chgQData(oldp+564,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+566,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                          >> 0x0000000dU))),32);
        bufp->chgCData(oldp+567,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+568,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+569,((0x0000000fU & (IData)(
                                                        (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                         >> 4U)))),4);
        bufp->chgCData(oldp+570,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+571,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+572,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+573,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgBit(oldp+574,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
        bufp->chgCData(oldp+575,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+576,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgBit(oldp+577,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgBit(oldp+578,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go));
        bufp->chgCData(oldp+579,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgBit(oldp+580,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+581,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid));
        bufp->chgIData(oldp+582,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0),32);
        bufp->chgIData(oldp+583,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1),32);
        bufp->chgIData(oldp+584,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2),32);
        bufp->chgIData(oldp+585,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3),32);
        bufp->chgIData(oldp+586,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4),32);
        bufp->chgIData(oldp+587,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5),32);
        bufp->chgIData(oldp+588,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6),32);
        bufp->chgIData(oldp+589,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7),32);
        bufp->chgIData(oldp+590,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data),32);
        bufp->chgIData(oldp+591,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data),32);
        bufp->chgIData(oldp+592,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data),32);
        bufp->chgIData(oldp+593,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data),32);
        bufp->chgIData(oldp+594,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),32);
        bufp->chgIData(oldp+595,(((2U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                         << 1U)) | 
                                  (1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))))),32);
        bufp->chgCData(oldp+596,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data),8);
        bufp->chgBit(oldp+597,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid));
        bufp->chgIData(oldp+598,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r2),32);
        bufp->chgIData(oldp+599,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__simu_flag),32);
        bufp->chgIData(oldp+600,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__io_simu),32);
        bufp->chgCData(oldp+601,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data),8);
        bufp->chgBit(oldp+602,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace));
        bufp->chgBit(oldp+603,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor));
        bufp->chgBit(oldp+604,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin));
        bufp->chgBit(oldp+605,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1));
        bufp->chgBit(oldp+606,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2));
        bufp->chgBit(oldp+607,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3));
        bufp->chgBit(oldp+608,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1));
        bufp->chgBit(oldp+609,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2));
        bufp->chgIData(oldp+610,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r),32);
        bufp->chgIData(oldp+611,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1),32);
        bufp->chgIData(oldp+612,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2),32);
        bufp->chgIData(oldp+613,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r1),32);
        bufp->chgIData(oldp+614,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer),32);
        bufp->chgCData(oldp+615,((0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata)),8);
        bufp->chgSData(oldp+616,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),16);
        bufp->chgCData(oldp+617,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state),3);
        bufp->chgBit(oldp+618,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag));
        bufp->chgIData(oldp+619,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count),20);
        bufp->chgCData(oldp+620,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count),4);
        bufp->chgBit(oldp+621,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                      >> 0x00000013U))));
        bufp->chgBit(oldp+622,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r));
        bufp->chgBit(oldp+623,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r));
        bufp->chgBit(oldp+624,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag));
        bufp->chgIData(oldp+625,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count),20);
        bufp->chgBit(oldp+626,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
                                      >> 0x00000013U))));
        bufp->chgBit(oldp+627,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag));
        bufp->chgIData(oldp+628,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count),20);
        bufp->chgBit(oldp+629,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
                                      >> 0x00000013U))));
        bufp->chgIData(oldp+630,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count),20);
        bufp->chgCData(oldp+631,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__scan_data),4);
        bufp->chgIData(oldp+632,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                            ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__miss_addr
                                            : 0U))),32);
        bufp->chgCData(oldp+633,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                            ? 2U : 0U))),3);
        bufp->chgCData(oldp+634,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))
                                            ? 1U : 0U))),2);
        bufp->chgBit(oldp+635,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_out_arvalid));
        bufp->chgCData(oldp+636,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                   : 0U)),4);
        bufp->chgCData(oldp+637,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                   : 0U)),2);
        bufp->chgBit(oldp+638,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast))));
        bufp->chgBit(oldp+639,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state)) 
                                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state))))));
        bufp->chgCData(oldp+640,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                   : 0U)),4);
        bufp->chgCData(oldp+641,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                   : 0U)),2);
        bufp->chgIData(oldp+642,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                            ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__miss_addr
                                            : 0U))),32);
        bufp->chgCData(oldp+643,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                            ? 2U : 0U))),3);
        bufp->chgCData(oldp+644,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))
                                            ? 1U : 0U))),2);
        bufp->chgBit(oldp+645,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_dcache_ar_out_arvalid));
        bufp->chgCData(oldp+646,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                   : 0U)),4);
        bufp->chgCData(oldp+647,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                   : 0U)),2);
        bufp->chgBit(oldp+648,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast))));
        bufp->chgBit(oldp+649,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state)) 
                                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state))))));
        bufp->chgCData(oldp+650,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                   : 0U)),4);
        bufp->chgCData(oldp+651,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                   : 0U)),2);
        bufp->chgIData(oldp+652,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                            ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__miss_addr
                                            : 0U))),32);
        bufp->chgCData(oldp+653,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                            ? 2U : 0U))),3);
        bufp->chgCData(oldp+654,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))
                                            ? 1U : 0U))),2);
        bufp->chgBit(oldp+655,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_uncache1_ar_out_arvalid));
        bufp->chgCData(oldp+656,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                   : 0U)),4);
        bufp->chgCData(oldp+657,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                   : 0U)),2);
        bufp->chgBit(oldp+658,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast))));
        bufp->chgBit(oldp+659,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state)) 
                                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state))))));
        bufp->chgCData(oldp+660,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                   : 0U)),4);
        bufp->chgCData(oldp+661,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                   : 0U)),2);
        bufp->chgIData(oldp+662,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                            ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__miss_addr
                                            : 0U))),32);
        bufp->chgCData(oldp+663,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                            ? 2U : 0U))),3);
        bufp->chgCData(oldp+664,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                   ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))
                                            ? 1U : 0U))),2);
        bufp->chgBit(oldp+665,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                                & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)))));
        bufp->chgCData(oldp+666,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                   : 0U)),4);
        bufp->chgCData(oldp+667,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                   : 0U)),2);
        bufp->chgBit(oldp+668,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx)) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast))));
        bufp->chgBit(oldp+669,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state)) 
                                   & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state))))));
        bufp->chgCData(oldp+670,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                   : 0U)),4);
        bufp->chgCData(oldp+671,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx))
                                   ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                   : 0U)),2);
        bufp->chgCData(oldp+672,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__sel_idx),2);
        bufp->chgBit(oldp+673,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag_rd_tag_en_pipe_0));
        bufp->chgIData(oldp+674,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag_rd_tag_addr_pipe_0]),22);
        bufp->chgBit(oldp+675,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid_rd_valid_en_pipe_0));
        bufp->chgBit(oldp+676,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid_rd_valid_addr_pipe_0]));
        bufp->chgBit(oldp+677,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0));
        bufp->chgIData(oldp+678,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0]),32);
        bufp->chgBit(oldp+679,((vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_valid_rd_valid_addr_pipe_0] 
                                & (0U == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__cache_tag_rd_tag_addr_pipe_0]))));
        bufp->chgCData(oldp+680,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__state),2);
        bufp->chgBit(oldp+681,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid));
        bufp->chgQData(oldp+682,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt),64);
        bufp->chgQData(oldp+684,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt),64);
        bufp->chgBit(oldp+686,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag_rd_tag_en_pipe_0));
        bufp->chgIData(oldp+687,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag_rd_tag_addr_pipe_0]),22);
        bufp->chgBit(oldp+688,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid_rd_valid_en_pipe_0));
        bufp->chgBit(oldp+689,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid_rd_valid_addr_pipe_0]));
        bufp->chgBit(oldp+690,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0));
        bufp->chgIData(oldp+691,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0]),32);
        bufp->chgBit(oldp+692,((vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_valid_rd_valid_addr_pipe_0] 
                                & (0U == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__cache_tag_rd_tag_addr_pipe_0]))));
        bufp->chgCData(oldp+693,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__state),2);
        bufp->chgBit(oldp+694,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag_rd_tag_en_pipe_0));
        bufp->chgIData(oldp+695,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag_rd_tag_addr_pipe_0]),22);
        bufp->chgBit(oldp+696,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid_rd_valid_en_pipe_0));
        bufp->chgBit(oldp+697,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid_rd_valid_addr_pipe_0]));
        bufp->chgBit(oldp+698,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0));
        bufp->chgIData(oldp+699,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0]),32);
        bufp->chgBit(oldp+700,((vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_valid_rd_valid_addr_pipe_0] 
                                & (0U == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__cache_tag_rd_tag_addr_pipe_0]))));
        bufp->chgCData(oldp+701,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache1__DOT__state),2);
        bufp->chgBit(oldp+702,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag_rd_tag_en_pipe_0));
        bufp->chgIData(oldp+703,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag_rd_tag_addr_pipe_0]),22);
        bufp->chgBit(oldp+704,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid_rd_valid_en_pipe_0));
        bufp->chgBit(oldp+705,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid_rd_valid_addr_pipe_0]));
        bufp->chgBit(oldp+706,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data_io_cpu_if_resp_data_MPORT_en_pipe_0));
        bufp->chgIData(oldp+707,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data
                                 [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_data_io_cpu_if_resp_data_MPORT_addr_pipe_0]),32);
        bufp->chgBit(oldp+708,((vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_valid_rd_valid_addr_pipe_0] 
                                & (0U == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag
                                   [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__cache_tag_rd_tag_addr_pipe_0]))));
        bufp->chgCData(oldp+709,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__uncache2__DOT__state),2);
        bufp->chgBit(oldp+710,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                      | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable)))));
        bufp->chgBit(oldp+711,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable));
        bufp->chgBit(oldp+712,((1U & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random)));
        bufp->chgBit(oldp+713,((1U & ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable)))));
        bufp->chgBit(oldp+714,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable));
        bufp->chgBit(oldp+715,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                      >> 1U))));
        bufp->chgBit(oldp+716,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                      >> 2U))));
        bufp->chgBit(oldp+717,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay));
        bufp->chgBit(oldp+718,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                      >> 3U))));
        bufp->chgIData(oldp+719,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random),23);
        bufp->chgIData(oldp+720,(((0x007ffffeU & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                  << 1U)) 
                                  | (1U & VL_REDXOR_32(
                                                       (0x00420000U 
                                                        & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random))))),23);
        bufp->chgBit(oldp+721,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay));
        bufp->chgBit(oldp+722,((1U & ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                       >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable)))));
        bufp->chgBit(oldp+723,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable));
        bufp->chgBit(oldp+724,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                      >> 4U))));
        bufp->chgQData(oldp+725,((((QData)((IData)(
                                                   (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst) 
                                                     << 7U) 
                                                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize) 
                                                        << 4U) 
                                                       | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen))))) 
                                   << 0x00000024U) 
                                  | (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                      << 4U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid))))),45);
        bufp->chgIData(oldp+727,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr),32);
        bufp->chgIData(oldp+728,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))),32);
        bufp->chgIData(oldp+729,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
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
        bufp->chgIData(oldp+730,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                  | ((0x0000003cU & 
                                      ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)))),32);
        bufp->chgCData(oldp+731,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst),2);
        bufp->chgBit(oldp+732,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+733,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgBit(oldp+734,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
        bufp->chgCData(oldp+735,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid),4);
        bufp->chgCData(oldp+736,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen),4);
        bufp->chgBit(oldp+737,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
        bufp->chgCData(oldp+738,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize),3);
        bufp->chgBit(oldp+739,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid));
        bufp->chgQData(oldp+740,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas),45);
        bufp->chgIData(oldp+742,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                          >> 0x0000000dU))),32);
        bufp->chgCData(oldp+743,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+744,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas))),4);
        bufp->chgCData(oldp+745,((0x0000000fU & (IData)(
                                                        (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                         >> 4U)))),4);
        bufp->chgCData(oldp+746,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+747,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid));
        bufp->chgCData(oldp+748,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur),4);
        bufp->chgQData(oldp+749,((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                   << 0x0000000dU) 
                                  | (QData)((IData)(
                                                    ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst) 
                                                       << 0x0000000bU) 
                                                      | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize) 
                                                         << 8U)) 
                                                     | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                         << 4U) 
                                                        | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid))))))),45);
        bufp->chgIData(oldp+751,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr),32);
        bufp->chgIData(oldp+752,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                   >> 2U)) 
                                   << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))),32);
        bufp->chgIData(oldp+753,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
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
        bufp->chgIData(oldp+754,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                  | ((0x0000003cU & 
                                      ((((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                         & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                            >> 2U)) 
                                        | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                           & ((IData)(1U) 
                                              + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                 >> 2U)))) 
                                       << 2U)) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
        bufp->chgCData(oldp+755,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst),2);
        bufp->chgBit(oldp+756,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+757,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgBit(oldp+758,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
        bufp->chgCData(oldp+759,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid),4);
        bufp->chgCData(oldp+760,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen),4);
        bufp->chgCData(oldp+761,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize),3);
        bufp->chgBit(oldp+762,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid));
        bufp->chgBit(oldp+763,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push));
        bufp->chgQData(oldp+764,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas),45);
        bufp->chgIData(oldp+766,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                          >> 0x0000000dU))),32);
        bufp->chgCData(oldp+767,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 0x0000000bU)))),2);
        bufp->chgCData(oldp+768,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas))),4);
        bufp->chgCData(oldp+769,((0x0000000fU & (IData)(
                                                        (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                         >> 4U)))),4);
        bufp->chgCData(oldp+770,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                >> 8U)))),3);
        bufp->chgBit(oldp+771,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
        bufp->chgBit(oldp+772,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out));
        bufp->chgBit(oldp+773,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid));
        bufp->chgBit(oldp+774,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
        bufp->chgCData(oldp+775,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas),4);
        bufp->chgBit(oldp+776,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
        bufp->chgBit(oldp+777,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop))));
        bufp->chgBit(oldp+778,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go));
        bufp->chgCData(oldp+779,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb),4);
        bufp->chgIData(oldp+780,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata),32);
        bufp->chgBit(oldp+781,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
        bufp->chgBit(oldp+782,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid));
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[3U]))) {
        bufp->chgSData(oldp+783,(vlSelfRef.NAND_top__DOT__nand_addr_c),14);
        bufp->chgIData(oldp+784,(vlSelfRef.NAND_top__DOT__nand_addr_r),25);
        bufp->chgIData(oldp+785,(vlSelfRef.NAND_top__DOT__nand_op_num),32);
        bufp->chgIData(oldp+786,(vlSelfRef.NAND_top__DOT__nand_parameter),32);
        bufp->chgIData(oldp+787,(vlSelfRef.NAND_top__DOT__nand_ce_map0),32);
        bufp->chgIData(oldp+788,(vlSelfRef.NAND_top__DOT__nand_ce_map1),32);
        bufp->chgIData(oldp+789,(vlSelfRef.NAND_top__DOT__nand_rdy_map0),32);
        bufp->chgIData(oldp+790,(vlSelfRef.NAND_top__DOT__nand_rdy_map1),32);
        bufp->chgIData(oldp+791,(vlSelfRef.NAND_top__DOT__nand_command),32);
        bufp->chgSData(oldp+792,(vlSelfRef.NAND_top__DOT__nand_timing),16);
        bufp->chgQData(oldp+793,(vlSelfRef.NAND_top__DOT__addr_in_die),38);
        bufp->chgCData(oldp+795,(vlSelfRef.NAND_top__DOT__NAND_STATE),5);
        bufp->chgIData(oldp+796,(vlSelfRef.NAND_top__DOT__NAND_OP_NUM),32);
        bufp->chgSData(oldp+797,(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT),14);
        bufp->chgSData(oldp+798,(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT),14);
        bufp->chgBit(oldp+799,(vlSelfRef.NAND_top__DOT__nand_clr_ack));
        bufp->chgBit(oldp+800,(vlSelfRef.NAND_top__DOT__NAND_DONE));
        bufp->chgBit(oldp+801,(vlSelfRef.NAND_top__DOT__NAND_CE_));
        bufp->chgSData(oldp+802,((0x00003fffU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                 >> 0x00000010U))),14);
        bufp->chgCData(oldp+803,((7U & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                        >> 0x0000000cU))),3);
        bufp->chgCData(oldp+804,((0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                                 >> 8U))),4);
        bufp->chgBit(oldp+805,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                      >> 8U))));
        bufp->chgBit(oldp+806,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                      >> 9U))));
        bufp->chgBit(oldp+807,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                      >> 0x0000000dU))));
        bufp->chgBit(oldp+808,(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ));
        bufp->chgBit(oldp+809,(vlSelfRef.NAND_top__DOT__nand_cmd_valid));
        bufp->chgCData(oldp+810,(vlSelfRef.NAND_top__DOT__status),8);
        bufp->chgCData(oldp+811,(vlSelfRef.NAND_top__DOT__nand_number),2);
        bufp->chgQData(oldp+812,(vlSelfRef.NAND_top__DOT__ID_INFORM),48);
        bufp->chgIData(oldp+814,(vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD),32);
        bufp->chgCData(oldp+815,(((((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__) 
                                    << 3U) | ((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__) 
                                              << 2U)) 
                                  | (((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__) 
                                      << 1U) | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)))),4);
        bufp->chgCData(oldp+816,(vlSelfRef.NAND_top__DOT__ADDR_pointer),2);
        bufp->chgCData(oldp+817,(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT),3);
        bufp->chgCData(oldp+818,(vlSelfRef.NAND_top__DOT__WAIT_NUM),8);
        bufp->chgCData(oldp+819,(vlSelfRef.NAND_top__DOT__HOLD_NUM),8);
        bufp->chgCData(oldp+820,(vlSelfRef.NAND_top__DOT__COMMAND),8);
        bufp->chgCData(oldp+821,(vlSelfRef.NAND_top__DOT__PRE_STATE),5);
        bufp->chgCData(oldp+822,(vlSelfRef.NAND_top__DOT__READ_ID_NUM),3);
        bufp->chgSData(oldp+823,(vlSelfRef.NAND_top__DOT__data_count),14);
        bufp->chgQData(oldp+824,(vlSelfRef.NAND_top__DOT__NAND_ADDR),38);
        bufp->chgIData(oldp+826,(vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR),32);
        bufp->chgBit(oldp+827,(vlSelfRef.NAND_top__DOT__NAND_GO));
        bufp->chgBit(oldp+828,(vlSelfRef.NAND_top__DOT__NAND_ACK));
        bufp->chgBit(oldp+829,(vlSelfRef.NAND_top__DOT__DMA_OP_DONE));
        bufp->chgBit(oldp+830,(vlSelfRef.NAND_top__DOT__ERASE_SERIAL));
        bufp->chgBit(oldp+831,(vlSelfRef.NAND_top__DOT__now_up_half));
        bufp->chgBit(oldp+832,(vlSelfRef.NAND_top__DOT__now_oob));
    }
    bufp->chgBit(oldp+833,(vlSelfRef.aclk));
    bufp->chgBit(oldp+834,(vlSelfRef.aresetn));
    bufp->chgBit(oldp+835,(vlSelfRef.enable_delay));
    bufp->chgIData(oldp+836,(vlSelfRef.random_seed),23);
    bufp->chgBit(oldp+837,(vlSelfRef.ram_ren));
    bufp->chgIData(oldp+838,(vlSelfRef.ram_raddr),32);
    bufp->chgIData(oldp+839,(vlSelfRef.ram_rdata),32);
    bufp->chgCData(oldp+840,(vlSelfRef.ram_wen),4);
    bufp->chgIData(oldp+841,(vlSelfRef.ram_waddr),32);
    bufp->chgIData(oldp+842,(vlSelfRef.ram_wdata),32);
    bufp->chgIData(oldp+843,(vlSelfRef.debug0_wb_pc),32);
    bufp->chgBit(oldp+844,(vlSelfRef.debug0_wb_rf_wen));
    bufp->chgCData(oldp+845,(vlSelfRef.debug0_wb_rf_wnum),5);
    bufp->chgIData(oldp+846,(vlSelfRef.debug0_wb_rf_wdata),32);
    bufp->chgIData(oldp+847,(vlSelfRef.num_data),32);
    bufp->chgBit(oldp+848,(vlSelfRef.open_trace));
    bufp->chgBit(oldp+849,(vlSelfRef.num_monitor));
    bufp->chgCData(oldp+850,(vlSelfRef.confreg_uart_data),8);
    bufp->chgBit(oldp+851,(vlSelfRef.write_uart_valid));
    bufp->chgWData(oldp+852,(vlSelfRef.uart_ctr_bus),128);
    bufp->chgBit(oldp+856,(vlSelfRef.uart_rx));
    bufp->chgBit(oldp+857,(vlSelfRef.uart_tx));
    bufp->chgSData(oldp+858,(vlSelfRef.led),16);
    bufp->chgCData(oldp+859,(vlSelfRef.led_rg0),2);
    bufp->chgCData(oldp+860,(vlSelfRef.led_rg1),2);
    bufp->chgCData(oldp+861,(vlSelfRef.num_csn),8);
    bufp->chgCData(oldp+862,(vlSelfRef.num_a_g),7);
    bufp->chgCData(oldp+863,(vlSelfRef.btn_key_col),4);
    bufp->chgCData(oldp+864,(vlSelfRef.btn_key_row),4);
    bufp->chgCData(oldp+865,(vlSelfRef.btn_step),2);
    bufp->chgCData(oldp+866,(vlSelfRef.nand_type),2);
    bufp->chgBit(oldp+867,(vlSelfRef.pclk));
    bufp->chgBit(oldp+868,(vlSelfRef.prst_));
    bufp->chgBit(oldp+869,(vlSelfRef.pwrite));
    bufp->chgBit(oldp+870,(vlSelfRef.psel));
    bufp->chgBit(oldp+871,(vlSelfRef.penable));
    bufp->chgSData(oldp+872,(vlSelfRef.ADDR),11);
    bufp->chgIData(oldp+873,(vlSelfRef.DAT_I),32);
    bufp->chgIData(oldp+874,(vlSelfRef.DAT_O),32);
    bufp->chgCData(oldp+875,(vlSelfRef.NAND_CE_o),4);
    bufp->chgBit(oldp+876,(vlSelfRef.NAND_REQ));
    bufp->chgCData(oldp+877,(vlSelfRef.NAND_I),8);
    bufp->chgCData(oldp+878,(vlSelfRef.NAND_O),8);
    bufp->chgBit(oldp+879,(vlSelfRef.NAND_EN_));
    bufp->chgBit(oldp+880,(vlSelfRef.NAND_ALE));
    bufp->chgBit(oldp+881,(vlSelfRef.NAND_CLE));
    bufp->chgBit(oldp+882,(vlSelfRef.NAND_WR_));
    bufp->chgBit(oldp+883,(vlSelfRef.NAND_RD_));
    bufp->chgCData(oldp+884,(vlSelfRef.NAND_IORDY_i),4);
    bufp->chgBit(oldp+885,(vlSelfRef.nand_int));
    bufp->chgIData(oldp+886,(vlSelfRef.NAND_top__DOT__REG_DAT_T),32);
    bufp->chgBit(oldp+887,(((IData)(vlSelfRef.psel) 
                            & (0x0040U == (IData)(vlSelfRef.ADDR)))));
    bufp->chgBit(oldp+888,(vlSelfRef.NAND_top__DOT__NANDtag));
    bufp->chgBit(oldp+889,(vlSelfRef.NAND_top__DOT__NAND_IORDY));
    bufp->chgBit(oldp+890,(((IData)(vlSelfRef.psel) 
                            & (0x0010U == (IData)(vlSelfRef.ADDR)))));
    bufp->chgBit(oldp+891,(((IData)(vlSelfRef.psel) 
                            & (0x0014U == (IData)(vlSelfRef.ADDR)))));
    bufp->chgCData(oldp+892,(((((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__) 
                                << 3U) | ((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__) 
                                          << 2U)) | 
                              (((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__) 
                                << 1U) | (1U & (IData)(vlSelfRef.NAND_IORDY_i))))),4);
    bufp->chgCData(oldp+893,(vlSelfRef.__SYM__switch),8);
    bufp->chgBit(oldp+894,((1U & (~ (IData)(vlSelfRef.aresetn)))));
    bufp->chgBit(oldp+895,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)
                                   ? ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en)) 
                                      | (IData)(vlSelfRef.uart_tx))
                                   : (IData)(vlSelfRef.uart_rx)))));
    bufp->chgBit(oldp+896,((1U & ((~ (IData)(vlSelfRef.aresetn)) 
                                  | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)))));
    bufp->chgIData(oldp+897,(vlSelfRef.__SYM__switch),32);
    bufp->chgBit(oldp+898,(((~ (0x0000000fU == (IData)(vlSelfRef.btn_key_row))) 
                            & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    bufp->chgBit(oldp+899,(((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                            & (0x0000000fU == (IData)(vlSelfRef.btn_key_row)))));
    bufp->chgBit(oldp+900,(((~ (IData)(vlSelfRef.btn_step)) 
                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r))));
    bufp->chgBit(oldp+901,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                  & (IData)(vlSelfRef.btn_step)))));
    bufp->chgBit(oldp+902,(((~ ((IData)(vlSelfRef.btn_step) 
                                >> 1U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))));
    bufp->chgBit(oldp+903,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                            & ((IData)(vlSelfRef.btn_step) 
                               >> 1U))));
    bufp->chgBit(oldp+904,((1U & ((~ (IData)(vlSelfRef.aresetn)) 
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
