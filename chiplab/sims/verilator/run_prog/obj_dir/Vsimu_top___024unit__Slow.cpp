// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vsimu_top.h for the primary calling header

#include "Vsimu_top__pch.h"

void Vsimu_top___024unit___ctor_var_reset(Vsimu_top___024unit* vlSelf);

void Vsimu_top___024unit::ctor(Vsimu_top__Syms* symsp, const char* namep) {
    vlSymsp = symsp;
    vlNamep = strdup(Verilated::catName(vlSymsp->name(), namep));
    // Reset structure values
    Vsimu_top___024unit___ctor_var_reset(this);
}

void Vsimu_top___024unit::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

void Vsimu_top___024unit::dtor() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}

// Savable
void Vsimu_top___024unit::__Vserialize(VerilatedSerialize& os) {
    uint64_t __Vcheckval = 0xe3b0c44298fc1c14ULL;
    os << __Vcheckval;
    os << vlSymsp->_vm_contextp__;
}
void Vsimu_top___024unit::__Vdeserialize(VerilatedDeserialize& os) {
    uint64_t __Vcheckval = 0xe3b0c44298fc1c14ULL;
    os.readAssert(__Vcheckval);
    os >> vlSymsp->_vm_contextp__;
}
