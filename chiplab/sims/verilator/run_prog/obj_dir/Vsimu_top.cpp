// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vsimu_top__pch.h"
#include "verilated_fst_c.h"

//============================================================
// Constructors

Vsimu_top::Vsimu_top(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vsimu_top__Syms(contextp(), _vcname__, this)}
    , DifftestExcpEvent__02Eclock{vlSymsp->TOP.DifftestExcpEvent__02Eclock}
    , DifftestTrapEvent__02Eclock{vlSymsp->TOP.DifftestTrapEvent__02Eclock}
    , DifftestStoreEvent__02Eclock{vlSymsp->TOP.DifftestStoreEvent__02Eclock}
    , DifftestLoadEvent__02Eclock{vlSymsp->TOP.DifftestLoadEvent__02Eclock}
    , DifftestCSRRegState__02Eclock{vlSymsp->TOP.DifftestCSRRegState__02Eclock}
    , DifftestGRegState__02Eclock{vlSymsp->TOP.DifftestGRegState__02Eclock}
    , pclk{vlSymsp->TOP.pclk}
    , penable{vlSymsp->TOP.penable}
    , pwrite{vlSymsp->TOP.pwrite}
    , aclk{vlSymsp->TOP.aclk}
    , DifftestExcpEvent__02Ecoreid{vlSymsp->TOP.DifftestExcpEvent__02Ecoreid}
    , excp_valid{vlSymsp->TOP.excp_valid}
    , eret{vlSymsp->TOP.eret}
    , DifftestTrapEvent__02Ecoreid{vlSymsp->TOP.DifftestTrapEvent__02Ecoreid}
    , DifftestTrapEvent__02Evalid{vlSymsp->TOP.DifftestTrapEvent__02Evalid}
    , code{vlSymsp->TOP.code}
    , DifftestStoreEvent__02Ecoreid{vlSymsp->TOP.DifftestStoreEvent__02Ecoreid}
    , DifftestStoreEvent__02Eindex{vlSymsp->TOP.DifftestStoreEvent__02Eindex}
    , DifftestStoreEvent__02Evalid{vlSymsp->TOP.DifftestStoreEvent__02Evalid}
    , DifftestLoadEvent__02Ecoreid{vlSymsp->TOP.DifftestLoadEvent__02Ecoreid}
    , DifftestLoadEvent__02Eindex{vlSymsp->TOP.DifftestLoadEvent__02Eindex}
    , DifftestLoadEvent__02Evalid{vlSymsp->TOP.DifftestLoadEvent__02Evalid}
    , DifftestCSRRegState__02Ecoreid{vlSymsp->TOP.DifftestCSRRegState__02Ecoreid}
    , DifftestGRegState__02Ecoreid{vlSymsp->TOP.DifftestGRegState__02Ecoreid}
    , nozero{vlSymsp->TOP.nozero}
    , nand_type{vlSymsp->TOP.nand_type}
    , prst_{vlSymsp->TOP.prst_}
    , psel{vlSymsp->TOP.psel}
    , NAND_CE_o{vlSymsp->TOP.NAND_CE_o}
    , NAND_REQ{vlSymsp->TOP.NAND_REQ}
    , NAND_I{vlSymsp->TOP.NAND_I}
    , NAND_O{vlSymsp->TOP.NAND_O}
    , NAND_EN_{vlSymsp->TOP.NAND_EN_}
    , NAND_ALE{vlSymsp->TOP.NAND_ALE}
    , NAND_CLE{vlSymsp->TOP.NAND_CLE}
    , NAND_WR_{vlSymsp->TOP.NAND_WR_}
    , NAND_RD_{vlSymsp->TOP.NAND_RD_}
    , NAND_IORDY_i{vlSymsp->TOP.NAND_IORDY_i}
    , nand_int{vlSymsp->TOP.nand_int}
    , aresetn{vlSymsp->TOP.aresetn}
    , enable_delay{vlSymsp->TOP.enable_delay}
    , ram_ren{vlSymsp->TOP.ram_ren}
    , ram_wen{vlSymsp->TOP.ram_wen}
    , debug0_wb_rf_wen{vlSymsp->TOP.debug0_wb_rf_wen}
    , debug0_wb_rf_wnum{vlSymsp->TOP.debug0_wb_rf_wnum}
    , open_trace{vlSymsp->TOP.open_trace}
    , num_monitor{vlSymsp->TOP.num_monitor}
    , confreg_uart_data{vlSymsp->TOP.confreg_uart_data}
    , write_uart_valid{vlSymsp->TOP.write_uart_valid}
    , uart_rx{vlSymsp->TOP.uart_rx}
    , uart_tx{vlSymsp->TOP.uart_tx}
    , led_rg0{vlSymsp->TOP.led_rg0}
    , led_rg1{vlSymsp->TOP.led_rg1}
    , num_csn{vlSymsp->TOP.num_csn}
    , num_a_g{vlSymsp->TOP.num_a_g}
    , __SYM__switch{vlSymsp->TOP.__SYM__switch}
    , btn_key_col{vlSymsp->TOP.btn_key_col}
    , btn_key_row{vlSymsp->TOP.btn_key_row}
    , btn_step{vlSymsp->TOP.btn_step}
    , one_valid_16__02Eout_en{vlSymsp->TOP.one_valid_16__02Eout_en}
    , one_valid_32__02Eout_en{vlSymsp->TOP.one_valid_32__02Eout_en}
    , one_valid_n__02Ein{vlSymsp->TOP.one_valid_n__02Ein}
    , out{vlSymsp->TOP.out}
    , ADDR{vlSymsp->TOP.ADDR}
    , led{vlSymsp->TOP.led}
    , one_valid_16__02Ein{vlSymsp->TOP.one_valid_16__02Ein}
    , intrNo{vlSymsp->TOP.intrNo}
    , cause{vlSymsp->TOP.cause}
    , exceptionInst{vlSymsp->TOP.exceptionInst}
    , DAT_I{vlSymsp->TOP.DAT_I}
    , DAT_O{vlSymsp->TOP.DAT_O}
    , random_seed{vlSymsp->TOP.random_seed}
    , ram_raddr{vlSymsp->TOP.ram_raddr}
    , ram_rdata{vlSymsp->TOP.ram_rdata}
    , ram_waddr{vlSymsp->TOP.ram_waddr}
    , ram_wdata{vlSymsp->TOP.ram_wdata}
    , debug0_wb_pc{vlSymsp->TOP.debug0_wb_pc}
    , debug0_wb_rf_wdata{vlSymsp->TOP.debug0_wb_rf_wdata}
    , num_data{vlSymsp->TOP.num_data}
    , uart_ctr_bus{vlSymsp->TOP.uart_ctr_bus}
    , one_valid_32__02Ein{vlSymsp->TOP.one_valid_32__02Ein}
    , exceptionPC{vlSymsp->TOP.exceptionPC}
    , pc{vlSymsp->TOP.pc}
    , cycleCnt{vlSymsp->TOP.cycleCnt}
    , instrCnt{vlSymsp->TOP.instrCnt}
    , storePAddr{vlSymsp->TOP.storePAddr}
    , storeVAddr{vlSymsp->TOP.storeVAddr}
    , storeData{vlSymsp->TOP.storeData}
    , paddr{vlSymsp->TOP.paddr}
    , vaddr{vlSymsp->TOP.vaddr}
    , crmd{vlSymsp->TOP.crmd}
    , prmd{vlSymsp->TOP.prmd}
    , euen{vlSymsp->TOP.euen}
    , ecfg{vlSymsp->TOP.ecfg}
    , estat{vlSymsp->TOP.estat}
    , era{vlSymsp->TOP.era}
    , badv{vlSymsp->TOP.badv}
    , eentry{vlSymsp->TOP.eentry}
    , tlbidx{vlSymsp->TOP.tlbidx}
    , tlbehi{vlSymsp->TOP.tlbehi}
    , tlbelo0{vlSymsp->TOP.tlbelo0}
    , tlbelo1{vlSymsp->TOP.tlbelo1}
    , asid{vlSymsp->TOP.asid}
    , pgdl{vlSymsp->TOP.pgdl}
    , pgdh{vlSymsp->TOP.pgdh}
    , save0{vlSymsp->TOP.save0}
    , save1{vlSymsp->TOP.save1}
    , save2{vlSymsp->TOP.save2}
    , save3{vlSymsp->TOP.save3}
    , tid{vlSymsp->TOP.tid}
    , tcfg{vlSymsp->TOP.tcfg}
    , tval{vlSymsp->TOP.tval}
    , ticlr{vlSymsp->TOP.ticlr}
    , llbctl{vlSymsp->TOP.llbctl}
    , tlbrentry{vlSymsp->TOP.tlbrentry}
    , dmw0{vlSymsp->TOP.dmw0}
    , dmw1{vlSymsp->TOP.dmw1}
    , gpr_0{vlSymsp->TOP.gpr_0}
    , gpr_1{vlSymsp->TOP.gpr_1}
    , gpr_2{vlSymsp->TOP.gpr_2}
    , gpr_3{vlSymsp->TOP.gpr_3}
    , gpr_4{vlSymsp->TOP.gpr_4}
    , gpr_5{vlSymsp->TOP.gpr_5}
    , gpr_6{vlSymsp->TOP.gpr_6}
    , gpr_7{vlSymsp->TOP.gpr_7}
    , gpr_8{vlSymsp->TOP.gpr_8}
    , gpr_9{vlSymsp->TOP.gpr_9}
    , gpr_10{vlSymsp->TOP.gpr_10}
    , gpr_11{vlSymsp->TOP.gpr_11}
    , gpr_12{vlSymsp->TOP.gpr_12}
    , gpr_13{vlSymsp->TOP.gpr_13}
    , gpr_14{vlSymsp->TOP.gpr_14}
    , gpr_15{vlSymsp->TOP.gpr_15}
    , gpr_16{vlSymsp->TOP.gpr_16}
    , gpr_17{vlSymsp->TOP.gpr_17}
    , gpr_18{vlSymsp->TOP.gpr_18}
    , gpr_19{vlSymsp->TOP.gpr_19}
    , gpr_20{vlSymsp->TOP.gpr_20}
    , gpr_21{vlSymsp->TOP.gpr_21}
    , gpr_22{vlSymsp->TOP.gpr_22}
    , gpr_23{vlSymsp->TOP.gpr_23}
    , gpr_24{vlSymsp->TOP.gpr_24}
    , gpr_25{vlSymsp->TOP.gpr_25}
    , gpr_26{vlSymsp->TOP.gpr_26}
    , gpr_27{vlSymsp->TOP.gpr_27}
    , gpr_28{vlSymsp->TOP.gpr_28}
    , gpr_29{vlSymsp->TOP.gpr_29}
    , gpr_30{vlSymsp->TOP.gpr_30}
    , gpr_31{vlSymsp->TOP.gpr_31}
    , __PVT____024unit{vlSymsp->TOP.__PVT____024unit}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vsimu_top::Vsimu_top(const char* _vcname__)
    : Vsimu_top(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vsimu_top::~Vsimu_top() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vsimu_top___024root___eval_debug_assertions(Vsimu_top___024root* vlSelf);
#endif  // VL_DEBUG
void Vsimu_top___024root___eval_static(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___eval_initial(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___eval_settle(Vsimu_top___024root* vlSelf);
void Vsimu_top___024root___eval(Vsimu_top___024root* vlSelf);

void Vsimu_top::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vsimu_top::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vsimu_top___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vsimu_top___024root___eval_static(&(vlSymsp->TOP));
        Vsimu_top___024root___eval_initial(&(vlSymsp->TOP));
        Vsimu_top___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vsimu_top___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vsimu_top::eventsPending() { return false; }

uint64_t Vsimu_top::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vsimu_top::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vsimu_top___024root___eval_final(Vsimu_top___024root* vlSelf);

VL_ATTR_COLD void Vsimu_top::final() {
    Vsimu_top___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vsimu_top::hierName() const { return vlSymsp->name(); }
const char* Vsimu_top::modelName() const { return "Vsimu_top"; }
unsigned Vsimu_top::threads() const { return 1; }
void Vsimu_top::prepareClone() const { contextp()->prepareClone(); }
void Vsimu_top::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vsimu_top::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vsimu_top___024root__trace_decl_types(VerilatedFst* tracep);

void Vsimu_top___024root__trace_init_top(Vsimu_top___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedFst* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vsimu_top___024root__trace_decl_types(tracep);
    Vsimu_top___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vsimu_top___024root__trace_register(Vsimu_top___024root* vlSelf, VerilatedFst* tracep);

VL_ATTR_COLD void Vsimu_top::trace(VerilatedFstC* tfp, int levels, int options) {
    if (tfp->isOpen()) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vsimu_top::trace()' shall not be called after 'VerilatedFstC::open()'.");
    }
    if (false && levels && options) {}  // Prevent unused
    tfp->spTrace()->addModel(this);
    tfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vsimu_top___024root__trace_register(&(vlSymsp->TOP), tfp->spTrace());
}

//============================================================
// Model serialization

VerilatedSerialize& operator<<(VerilatedSerialize& os, Vsimu_top& rhs) {
    Verilated::quiesce();
    rhs.vlSymsp->__Vserialize(os);
    return os;
}

VerilatedDeserialize& operator>>(VerilatedDeserialize& os, Vsimu_top& rhs) {
    Verilated::quiesce();
    rhs.vlSymsp->__Vdeserialize(os);
    return os;
}
