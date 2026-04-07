// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"

void Vsimu_top___024root___nba_sequent__TOP__0(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___nba_sequent__TOP__1(Vsimu_top___024root* vlSelf);

void Vsimu_top___024root___eval_nba(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_nba\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
        Vsimu_top___024root___nba_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered[0U])) {
        Vsimu_top___024root___nba_sequent__TOP__1(vlSelf);
        vlSelfRef.__Vm_traceActivity[3U] = 1U;
    }
}

void Vsimu_top___024root___trigger_orInto__act(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___trigger_orInto__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

void Vsimu_top___024root___eval_triggers__act(Vsimu_top___024root* vlSelf);

bool Vsimu_top___024root___eval_phase__act(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__act\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vsimu_top___024root___eval_triggers__act(vlSelf);
    Vsimu_top___024root___trigger_orInto__act(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    return (0U);
}

void Vsimu_top___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vsimu_top___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

bool Vsimu_top___024root___eval_phase__nba(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_phase__nba\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vsimu_top___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        Vsimu_top___024root___eval_nba(vlSelf);
        Vsimu_top___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
bool Vsimu_top___024root___eval_phase__ico(Vsimu_top___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vsimu_top___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

void Vsimu_top___024root___eval(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VicoIterCount = 0U;
    vlSelfRef.__VicoFirstIteration = 1U;
    do {
        if (VL_UNLIKELY(((0x00000064U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vsimu_top___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
            VL_FATAL_MT("../testbench/simu_top.v", 1, "", "Input combinational region did not converge after 100 tries");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
    } while (Vsimu_top___024root___eval_phase__ico(vlSelf));
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00000064U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vsimu_top___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("../testbench/simu_top.v", 1, "", "NBA region did not converge after 100 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00000064U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vsimu_top___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                VL_FATAL_MT("../testbench/simu_top.v", 1, "", "Active region did not converge after 100 tries");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
        } while (Vsimu_top___024root___eval_phase__act(vlSelf));
    } while (Vsimu_top___024root___eval_phase__nba(vlSelf));
}

#ifdef VL_DEBUG
void Vsimu_top___024root___eval_debug_assertions(Vsimu_top___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root___eval_debug_assertions\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.aclk & 0xfeU)))) {
        Verilated::overWidthError("aclk");
    }
    if (VL_UNLIKELY(((vlSelfRef.aresetn & 0xfeU)))) {
        Verilated::overWidthError("aresetn");
    }
    if (VL_UNLIKELY(((vlSelfRef.enable_delay & 0xfeU)))) {
        Verilated::overWidthError("enable_delay");
    }
    if (VL_UNLIKELY(((vlSelfRef.random_seed & 0xff800000U)))) {
        Verilated::overWidthError("random_seed");
    }
    if (VL_UNLIKELY(((vlSelfRef.uart_rx & 0xfeU)))) {
        Verilated::overWidthError("uart_rx");
    }
    if (VL_UNLIKELY(((vlSelfRef.uart_tx & 0xfeU)))) {
        Verilated::overWidthError("uart_tx");
    }
    if (VL_UNLIKELY(((vlSelfRef.btn_key_row & 0xf0U)))) {
        Verilated::overWidthError("btn_key_row");
    }
    if (VL_UNLIKELY(((vlSelfRef.btn_step & 0xfcU)))) {
        Verilated::overWidthError("btn_step");
    }
    if (VL_UNLIKELY(((vlSelfRef.nand_type & 0xfcU)))) {
        Verilated::overWidthError("nand_type");
    }
    if (VL_UNLIKELY(((vlSelfRef.pclk & 0xfeU)))) {
        Verilated::overWidthError("pclk");
    }
    if (VL_UNLIKELY(((vlSelfRef.prst_ & 0xfeU)))) {
        Verilated::overWidthError("prst_");
    }
    if (VL_UNLIKELY(((vlSelfRef.psel & 0xfeU)))) {
        Verilated::overWidthError("psel");
    }
    if (VL_UNLIKELY(((vlSelfRef.penable & 0xfeU)))) {
        Verilated::overWidthError("penable");
    }
    if (VL_UNLIKELY(((vlSelfRef.pwrite & 0xfeU)))) {
        Verilated::overWidthError("pwrite");
    }
    if (VL_UNLIKELY(((vlSelfRef.ADDR & 0xf800U)))) {
        Verilated::overWidthError("ADDR");
    }
    if (VL_UNLIKELY(((vlSelfRef.NAND_IORDY_i & 0xf0U)))) {
        Verilated::overWidthError("NAND_IORDY_i");
    }
}
#endif  // VL_DEBUG
