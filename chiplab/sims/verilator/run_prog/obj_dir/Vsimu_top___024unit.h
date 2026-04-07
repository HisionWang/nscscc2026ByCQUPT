// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vsimu_top.h for the primary calling header

#ifndef VERILATED_VSIMU_TOP___024UNIT_H_
#define VERILATED_VSIMU_TOP___024UNIT_H_  // guard

#include "verilated.h"
#include "verilated_save.h"


class Vsimu_top__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vsimu_top___024unit final {
  public:

    // INTERNAL VARIABLES
    Vsimu_top__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vsimu_top___024unit() = default;
    ~Vsimu_top___024unit() = default;
    void ctor(Vsimu_top__Syms* symsp, const char* namep);
    void dtor();
    VL_UNCOPYABLE(Vsimu_top___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
    void __Vserialize(VerilatedSerialize& os);
    void __Vdeserialize(VerilatedDeserialize& os);
};


#endif  // guard
