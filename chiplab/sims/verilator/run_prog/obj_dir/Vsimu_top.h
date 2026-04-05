// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary model header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef VERILATED_VSIMU_TOP_H_
#define VERILATED_VSIMU_TOP_H_  // guard

#include "verilated.h"
#include "verilated_save.h"
#include "svdpi.h"

class Vsimu_top__Syms;
class Vsimu_top___024root;
class VerilatedFstC;
class Vsimu_top___024unit;


// This class is the main interface to the Verilated model
class alignas(VL_CACHE_LINE_BYTES) Vsimu_top VL_NOT_FINAL : public VerilatedModel {
  private:
    // Symbol table holding complete model state (owned by this class)
    Vsimu_top__Syms* const vlSymsp;

  public:

    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(&DifftestExcpEvent__02Eclock,0,0);
    VL_IN8(&DifftestTrapEvent__02Eclock,0,0);
    VL_IN8(&DifftestStoreEvent__02Eclock,0,0);
    VL_IN8(&DifftestLoadEvent__02Eclock,0,0);
    VL_IN8(&DifftestCSRRegState__02Eclock,0,0);
    VL_IN8(&DifftestGRegState__02Eclock,0,0);
    VL_IN8(&pclk,0,0);
    VL_IN8(&penable,0,0);
    VL_IN8(&pwrite,0,0);
    VL_IN8(&aclk,0,0);
    VL_IN8(&DifftestExcpEvent__02Ecoreid,7,0);
    VL_IN8(&excp_valid,0,0);
    VL_IN8(&eret,0,0);
    VL_IN8(&DifftestTrapEvent__02Ecoreid,7,0);
    VL_IN8(&DifftestTrapEvent__02Evalid,0,0);
    VL_IN8(&code,2,0);
    VL_IN8(&DifftestStoreEvent__02Ecoreid,7,0);
    VL_IN8(&DifftestStoreEvent__02Eindex,7,0);
    VL_IN8(&DifftestStoreEvent__02Evalid,7,0);
    VL_IN8(&DifftestLoadEvent__02Ecoreid,7,0);
    VL_IN8(&DifftestLoadEvent__02Eindex,7,0);
    VL_IN8(&DifftestLoadEvent__02Evalid,7,0);
    VL_IN8(&DifftestCSRRegState__02Ecoreid,7,0);
    VL_IN8(&DifftestGRegState__02Ecoreid,7,0);
    VL_OUT8(&nozero,0,0);
    VL_IN8(&nand_type,1,0);
    VL_IN8(&prst_,0,0);
    VL_IN8(&psel,0,0);
    VL_OUT8(&NAND_CE_o,3,0);
    VL_OUT8(&NAND_REQ,0,0);
    VL_IN8(&NAND_I,7,0);
    VL_OUT8(&NAND_O,7,0);
    VL_OUT8(&NAND_EN_,0,0);
    VL_OUT8(&NAND_ALE,0,0);
    VL_OUT8(&NAND_CLE,0,0);
    VL_OUT8(&NAND_WR_,0,0);
    VL_OUT8(&NAND_RD_,0,0);
    VL_IN8(&NAND_IORDY_i,3,0);
    VL_OUT8(&nand_int,0,0);
    VL_IN8(&aresetn,0,0);
    VL_IN8(&enable_delay,0,0);
    VL_OUT8(&ram_ren,0,0);
    VL_OUT8(&ram_wen,3,0);
    VL_OUT8(&debug0_wb_rf_wen,0,0);
    VL_OUT8(&debug0_wb_rf_wnum,4,0);
    VL_OUT8(&open_trace,0,0);
    VL_OUT8(&num_monitor,0,0);
    VL_OUT8(&confreg_uart_data,7,0);
    VL_OUT8(&write_uart_valid,0,0);
    VL_INOUT8(&uart_rx,0,0);
    VL_INOUT8(&uart_tx,0,0);
    VL_OUT8(&led_rg0,1,0);
    VL_OUT8(&led_rg1,1,0);
    VL_OUT8(&num_csn,7,0);
    VL_OUT8(&num_a_g,6,0);
    VL_IN8(&__SYM__switch,7,0);
    VL_OUT8(&btn_key_col,3,0);
    VL_IN8(&btn_key_row,3,0);
    VL_IN8(&btn_step,1,0);
    VL_OUT8(&one_valid_16__02Eout_en,3,0);
    VL_OUT8(&one_valid_32__02Eout_en,4,0);
    VL_IN16(&one_valid_n__02Ein,15,0);
    VL_OUT16(&out,15,0);
    VL_IN16(&ADDR,10,0);
    VL_OUT16(&led,15,0);
    VL_IN16(&one_valid_16__02Ein,15,0);
    VL_IN(&intrNo,31,0);
    VL_IN(&cause,31,0);
    VL_IN(&exceptionInst,31,0);
    VL_IN(&DAT_I,31,0);
    VL_OUT(&DAT_O,31,0);
    VL_IN(&random_seed,22,0);
    VL_OUT(&ram_raddr,31,0);
    VL_IN(&ram_rdata,31,0);
    VL_OUT(&ram_waddr,31,0);
    VL_OUT(&ram_wdata,31,0);
    VL_OUT(&debug0_wb_pc,31,0);
    VL_OUT(&debug0_wb_rf_wdata,31,0);
    VL_OUT(&num_data,31,0);
    VL_OUTW(&uart_ctr_bus,127,0,4);
    VL_IN(&one_valid_32__02Ein,31,0);
    VL_IN64(&exceptionPC,63,0);
    VL_IN64(&pc,63,0);
    VL_IN64(&cycleCnt,63,0);
    VL_IN64(&instrCnt,63,0);
    VL_IN64(&storePAddr,63,0);
    VL_IN64(&storeVAddr,63,0);
    VL_IN64(&storeData,63,0);
    VL_IN64(&paddr,63,0);
    VL_IN64(&vaddr,63,0);
    VL_IN64(&crmd,63,0);
    VL_IN64(&prmd,63,0);
    VL_IN64(&euen,63,0);
    VL_IN64(&ecfg,63,0);
    VL_IN64(&estat,63,0);
    VL_IN64(&era,63,0);
    VL_IN64(&badv,63,0);
    VL_IN64(&eentry,63,0);
    VL_IN64(&tlbidx,63,0);
    VL_IN64(&tlbehi,63,0);
    VL_IN64(&tlbelo0,63,0);
    VL_IN64(&tlbelo1,63,0);
    VL_IN64(&asid,63,0);
    VL_IN64(&pgdl,63,0);
    VL_IN64(&pgdh,63,0);
    VL_IN64(&save0,63,0);
    VL_IN64(&save1,63,0);
    VL_IN64(&save2,63,0);
    VL_IN64(&save3,63,0);
    VL_IN64(&tid,63,0);
    VL_IN64(&tcfg,63,0);
    VL_IN64(&tval,63,0);
    VL_IN64(&ticlr,63,0);
    VL_IN64(&llbctl,63,0);
    VL_IN64(&tlbrentry,63,0);
    VL_IN64(&dmw0,63,0);
    VL_IN64(&dmw1,63,0);
    VL_IN64(&gpr_0,63,0);
    VL_IN64(&gpr_1,63,0);
    VL_IN64(&gpr_2,63,0);
    VL_IN64(&gpr_3,63,0);
    VL_IN64(&gpr_4,63,0);
    VL_IN64(&gpr_5,63,0);
    VL_IN64(&gpr_6,63,0);
    VL_IN64(&gpr_7,63,0);
    VL_IN64(&gpr_8,63,0);
    VL_IN64(&gpr_9,63,0);
    VL_IN64(&gpr_10,63,0);
    VL_IN64(&gpr_11,63,0);
    VL_IN64(&gpr_12,63,0);
    VL_IN64(&gpr_13,63,0);
    VL_IN64(&gpr_14,63,0);
    VL_IN64(&gpr_15,63,0);
    VL_IN64(&gpr_16,63,0);
    VL_IN64(&gpr_17,63,0);
    VL_IN64(&gpr_18,63,0);
    VL_IN64(&gpr_19,63,0);
    VL_IN64(&gpr_20,63,0);
    VL_IN64(&gpr_21,63,0);
    VL_IN64(&gpr_22,63,0);
    VL_IN64(&gpr_23,63,0);
    VL_IN64(&gpr_24,63,0);
    VL_IN64(&gpr_25,63,0);
    VL_IN64(&gpr_26,63,0);
    VL_IN64(&gpr_27,63,0);
    VL_IN64(&gpr_28,63,0);
    VL_IN64(&gpr_29,63,0);
    VL_IN64(&gpr_30,63,0);
    VL_IN64(&gpr_31,63,0);

    // CELLS
    // Public to allow access to /* verilator public */ items.
    // Otherwise the application code can consider these internals.
    Vsimu_top___024unit* const __PVT____024unit;

    // Root instance pointer to allow access to model internals,
    // including inlined /* verilator public_flat_* */ items.
    Vsimu_top___024root* const rootp;

    // CONSTRUCTORS
    /// Construct the model; called by application code
    /// If contextp is null, then the model will use the default global context
    /// If name is "", then makes a wrapper with a
    /// single model invisible with respect to DPI scope names.
    explicit Vsimu_top(VerilatedContext* contextp, const char* name = "TOP");
    explicit Vsimu_top(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    virtual ~Vsimu_top();
  private:
    VL_UNCOPYABLE(Vsimu_top);  ///< Copying not allowed

  public:
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    /// Are there scheduled events to handle?
    bool eventsPending();
    /// Returns time at next time slot. Aborts if !eventsPending()
    uint64_t nextTimeSlot();
    /// Trace signals in the model; called by application code
    void trace(VerilatedFstC* tfp, int levels, int options = 0);
    /// Retrieve name of this model instance (as passed to constructor).
    const char* name() const;

    // Serialization functions
    friend VerilatedSerialize& operator<<(VerilatedSerialize& os, Vsimu_top& rhs);
    friend VerilatedDeserialize& operator>>(VerilatedDeserialize& os, Vsimu_top& rhs);

    // Abstract methods from VerilatedModel
    const char* hierName() const override final;
    const char* modelName() const override final;
    unsigned threads() const override final;
    /// Prepare for cloning the model at the process level (e.g. fork in Linux)
    /// Release necessary resources. Called before cloning.
    void prepareClone() const;
    /// Re-init after cloning the model at the process level (e.g. fork in Linux)
    /// Re-allocate necessary resources. Called after cloning.
    void atClone() const;
    std::unique_ptr<VerilatedTraceConfig> traceConfig() const override final;
};

#endif  // guard
