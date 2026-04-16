// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals

#include "verilated_fst_c.h"
#include "Vsimu_top__Syms.h"


VL_ATTR_COLD void Vsimu_top___024root__trace_init_sub__TOP__0(Vsimu_top___024root* vlSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_init_sub__TOP__0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const int c = vlSymsp->__Vm_baseCode;
    tracep->pushPrefix("$rootio", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1305,0,"enable_delay",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1306,0,"random_seed",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 22,0);
    tracep->declBit(c+1307,0,"ram_ren",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1308,0,"ram_raddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1309,0,"ram_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1310,0,"ram_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1311,0,"ram_waddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1312,0,"ram_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1313,0,"debug0_wb_pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1314,0,"debug0_wb_rf_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1315,0,"debug0_wb_rf_wnum",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1316,0,"debug0_wb_rf_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1317,0,"num_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1318,0,"open_trace",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1319,0,"num_monitor",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1320,0,"confreg_uart_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1321,0,"write_uart_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1322,0,"uart_ctr_bus",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 127,0);
    tracep->declBit(c+1326,0,"uart_rx",-1, VerilatedTraceSigDirection::INOUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"uart_tx",-1, VerilatedTraceSigDirection::INOUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1328,0,"led",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+1329,0,"led_rg0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1330,0,"led_rg1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1331,0,"num_csn",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1332,0,"num_a_g",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBus(c+1333,0,"btn_key_col",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1334,0,"btn_key_row",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1335,0,"btn_step",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1336,0,"nand_type",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1337,0,"pclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1338,0,"prst_",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1339,0,"pwrite",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1340,0,"psel",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1341,0,"penable",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1342,0,"ADDR",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBus(c+1343,0,"DAT_I",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1344,0,"DAT_O",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1345,0,"NAND_CE_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1346,0,"NAND_REQ",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1347,0,"NAND_I",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1348,0,"NAND_O",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1349,0,"NAND_EN_",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1350,0,"NAND_ALE",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1351,0,"NAND_CLE",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1352,0,"NAND_WR_",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1353,0,"NAND_RD_",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1354,0,"NAND_IORDY_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1355,0,"nand_int",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("NAND_top", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1336,0,"nand_type",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1337,0,"pclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1338,0,"prst_",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1339,0,"pwrite",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1340,0,"psel",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1341,0,"penable",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1342,0,"ADDR",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBus(c+1343,0,"DAT_I",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1344,0,"DAT_O",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1345,0,"NAND_CE_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1346,0,"NAND_REQ",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1347,0,"NAND_I",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1348,0,"NAND_O",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1349,0,"NAND_EN_",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1350,0,"NAND_ALE",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1351,0,"NAND_CLE",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1352,0,"NAND_WR_",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1353,0,"NAND_RD_",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1354,0,"NAND_IORDY_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1355,0,"nand_int",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1356,0,"REG_DAT_T",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1253,0,"nand_addr_c",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 13,0);
    tracep->declBus(c+1254,0,"nand_addr_r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 24,0);
    tracep->declBus(c+1255,0,"nand_op_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1256,0,"nand_parameter",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1257,0,"nand_ce_map0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1258,0,"nand_ce_map1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1259,0,"nand_rdy_map0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1260,0,"nand_rdy_map1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1261,0,"nand_command",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1262,0,"nand_timing",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declQuad(c+1263,0,"addr_in_die",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 37,0);
    tracep->declBus(c+1265,0,"NAND_STATE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1266,0,"NAND_OP_NUM",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1267,0,"WRITE_MAX_COUNT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 13,0);
    tracep->declBus(c+1268,0,"READ_MAX_COUNT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 13,0);
    tracep->declBit(c+1269,0,"nand_clr_ack",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1270,0,"NAND_DONE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1271,0,"NAND_CE_",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1272,0,"op_scope",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 13,0);
    tracep->declBus(c+1273,0,"nand_id_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1274,0,"nand_size",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1275,0,"main_op",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1276,0,"spare_op",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1277,0,"nand_int_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1357,0,"nand_dma_ack_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1358,0,"NANDtag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1359,0,"NAND_IORDY",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+25,0,"HIT0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+26,0,"HIT1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+27,0,"HIT2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+28,0,"HIT3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1360,0,"HIT4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1361,0,"HIT5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+29,0,"HIT6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+30,0,"HIT7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+31,0,"HIT8",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+32,0,"HIT9",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+33,0,"HIT10",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+34,0,"HIT11",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+35,0,"NAND_HIT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1278,0,"NAND_DMA_REQ",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1279,0,"nand_cmd_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1280,0,"status",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1281,0,"nand_number",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declQuad(c+1282,0,"ID_INFORM",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 47,0);
    tracep->declBus(c+1284,0,"NAND_DAT_O_RD",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1285,0,"NAND_CE_pre_o",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1362,0,"NAND_IORDY_post_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1286,0,"ADDR_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1287,0,"NAND_ADDR_COUNT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1288,0,"WAIT_NUM",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1289,0,"HOLD_NUM",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1290,0,"COMMAND",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1291,0,"PRE_STATE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1292,0,"READ_ID_NUM",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1293,0,"data_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 13,0);
    tracep->declQuad(c+1294,0,"NAND_ADDR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 37,0);
    tracep->declBus(c+1296,0,"NAND_DAT_I_WR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1297,0,"NAND_GO",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1298,0,"NAND_ACK",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1299,0,"DMA_OP_DONE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1300,0,"ERASE_SERIAL",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1301,0,"now_up_half",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1302,0,"now_oob",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1375,0,"NAND_IDLE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1376,0,"COMMAND_IN",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1377,0,"ADDR_4_RD_WR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1378,0,"ADDR_4_ERASE_ID",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1379,0,"READ_START",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1380,0,"READ_WAIT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1381,0,"READ_WAIT_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1382,0,"READ_TRANSFER",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1383,0,"WRITE_START",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1384,0,"WRITE_DATA",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1385,0,"PROGRAM",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1386,0,"PROGRAM_FAIL",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1387,0,"READ_ID",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1388,0,"READ_STATUS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1389,0,"ID_TO_STATUS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1390,0,"ERASE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1391,0,"WAIT_ERASE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1392,0,"ERASE_FAIL",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1393,0,"RESET",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1394,0,"WAIT_RESET",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->popPrefix();
    tracep->pushPrefix("simu_top", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"BUS_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"CPU_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1305,0,"enable_delay",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1306,0,"random_seed",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 22,0);
    tracep->declBit(c+1307,0,"ram_ren",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1308,0,"ram_raddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1309,0,"ram_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1310,0,"ram_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1311,0,"ram_waddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1312,0,"ram_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1313,0,"debug0_wb_pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1314,0,"debug0_wb_rf_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1315,0,"debug0_wb_rf_wnum",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1316,0,"debug0_wb_rf_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1317,0,"num_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1318,0,"open_trace",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1319,0,"num_monitor",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1320,0,"confreg_uart_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1321,0,"write_uart_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1322,0,"uart_ctr_bus",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 127,0);
    tracep->declBit(c+1326,0,"uart_rx",-1, VerilatedTraceSigDirection::INOUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"uart_tx",-1, VerilatedTraceSigDirection::INOUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1328,0,"led",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+1329,0,"led_rg0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1330,0,"led_rg1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1331,0,"num_csn",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1332,0,"num_a_g",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBus(c+1363,0,"switch",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1333,0,"btn_key_col",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1334,0,"btn_key_row",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1335,0,"btn_step",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->pushPrefix("soc", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1395,0,"BUS_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"CPU_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1305,0,"enable_delay",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1306,0,"random_seed",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 22,0);
    tracep->declBus(c+1313,0,"debug0_wb_pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1316,0,"debug0_wb_rf_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1314,0,"debug0_wb_rf_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1315,0,"debug0_wb_rf_wnum",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1328,0,"led",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+1329,0,"led_rg0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1330,0,"led_rg1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1331,0,"num_csn",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1332,0,"num_a_g",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBus(c+1363,0,"switch",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1333,0,"btn_key_col",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1334,0,"btn_key_row",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1335,0,"btn_step",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1308,0,"sram_raddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1309,0,"sram_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1307,0,"sram_ren",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1311,0,"sram_waddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1312,0,"sram_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1310,0,"sram_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1326,0,"UART_RX",-1, VerilatedTraceSigDirection::INOUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"UART_TX",-1, VerilatedTraceSigDirection::INOUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"cpu_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"cpu_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"cpu_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"cpu_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"cpu_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"cpu_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"cpu_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"cpu_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"cpu_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"cpu_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"cpu_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"cpu_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"cpu_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"cpu_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"cpu_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+38,0,"cpu_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"cpu_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+164,0,"cpu_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+39,0,"cpu_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+165,0,"cpu_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"cpu_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"cpu_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"cpu_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"cpu_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"cpu_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"cpu_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"cpu_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"cpu_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+170,0,"cpu_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"cpu_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"cpu_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+41,0,"cpu_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+172,0,"cpu_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+173,0,"cpu_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+42,0,"cpu_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+174,0,"cpu_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"m0_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"m0_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"m0_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"m0_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"m0_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"m0_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m0_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"m0_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"m0_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+175,0,"m0_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"m0_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"m0_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"m0_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"m0_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"m0_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+176,0,"m0_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"m0_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+164,0,"m0_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+177,0,"m0_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+43,0,"m0_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"m0_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"m0_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"m0_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"m0_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"m0_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"m0_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m0_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"m0_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+44,0,"m0_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+178,0,"m0_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"m0_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+41,0,"m0_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+172,0,"m0_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+173,0,"m0_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+179,0,"m0_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+45,0,"m0_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s0_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s0_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s0_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s0_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"s0_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s0_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s0_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s0_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1,0,"s0_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+180,0,"s0_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s0_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s0_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s0_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s0_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"s0_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+181,0,"s0_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+182,0,"s0_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"s0_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+183,0,"s0_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+46,0,"s0_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s0_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"s0_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"s0_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"s0_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"s0_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s0_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s0_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s0_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+47,0,"s0_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+184,0,"s0_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+185,0,"s0_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1309,0,"s0_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"s0_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+186,0,"s0_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+187,0,"s0_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+48,0,"s0_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"conf_s_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"conf_s_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"conf_s_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"conf_s_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"conf_s_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"conf_s_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"conf_s_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"conf_s_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+3,0,"conf_s_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+188,0,"conf_s_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"conf_s_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"conf_s_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"conf_s_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"conf_s_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+4,0,"conf_s_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+189,0,"conf_s_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+190,0,"conf_s_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"conf_s_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+191,0,"conf_s_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"conf_s_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"conf_s_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"conf_s_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"conf_s_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"conf_s_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"conf_s_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"conf_s_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"conf_s_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"conf_s_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+50,0,"conf_s_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+192,0,"conf_s_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+193,0,"conf_s_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+194,0,"conf_s_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"conf_s_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+195,0,"conf_s_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+196,0,"conf_s_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+51,0,"conf_s_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"apb_s_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"apb_s_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"apb_s_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"apb_s_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"apb_s_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"apb_s_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"apb_s_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"apb_s_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+5,0,"apb_s_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+197,0,"apb_s_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"apb_s_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"apb_s_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"apb_s_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"apb_s_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+6,0,"apb_s_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+198,0,"apb_s_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+199,0,"apb_s_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"apb_s_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+200,0,"apb_s_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+52,0,"apb_s_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"apb_s_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"apb_s_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"apb_s_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"apb_s_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"apb_s_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"apb_s_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"apb_s_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"apb_s_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+53,0,"apb_s_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+201,0,"apb_s_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+202,0,"apb_s_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+203,0,"apb_s_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"apb_s_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+204,0,"apb_s_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+205,0,"apb_s_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+54,0,"apb_s_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+206,0,"conf_s_ram_raddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+194,0,"conf_s_ram_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+55,0,"conf_s_ram_ren",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+207,0,"conf_s_ram_waddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+208,0,"conf_s_ram_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+56,0,"conf_s_ram_wen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+209,0,"interrupt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"timer_clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"UART_CTS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+210,0,"UART_RTS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+211,0,"UART_DTR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"UART_DSR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1401,0,"UART_RI",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"UART_DCD",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+212,0,"uart0_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+213,0,"uart0_txd_o",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"uart0_txd_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+214,0,"uart0_txd_oe",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+215,0,"uart0_rxd_o",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1326,0,"uart0_rxd_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+216,0,"uart0_rxd_oe",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+210,0,"uart0_rts_o",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uart0_cts_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uart0_dsr_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uart0_dcd_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+211,0,"uart0_dtr_o",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1401,0,"uart0_ri_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("APB_DEV", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1402,0,"ADDR_APB",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1403,0,"DATA_APB",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1404,0,"L_ADDR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1403,0,"L_ID",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1405,0,"L_DATA",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1406,0,"L_MASK",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_s_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_s_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_s_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_s_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_s_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+5,0,"axi_s_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+197,0,"axi_s_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_s_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_s_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_s_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+6,0,"axi_s_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+198,0,"axi_s_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+199,0,"axi_s_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"axi_s_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+200,0,"axi_s_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+52,0,"axi_s_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"axi_s_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"axi_s_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"axi_s_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"axi_s_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_s_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_s_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+53,0,"axi_s_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+201,0,"axi_s_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+202,0,"axi_s_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+203,0,"axi_s_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"axi_s_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+204,0,"axi_s_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+205,0,"axi_s_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+54,0,"axi_s_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+217,0,"apb_ready_dma",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1407,0,"apb_rw_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1408,0,"apb_psel_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1409,0,"apb_enab_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1410,0,"apb_addr_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+1411,0,"apb_wdata_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+218,0,"apb_rdata_dma",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1412,0,"apb_valid_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+219,0,"dma_grant",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dma_req_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1413,0,"dma_ack_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"uart0_txd_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+213,0,"uart0_txd_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+214,0,"uart0_txd_oe",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1326,0,"uart0_rxd_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+215,0,"uart0_rxd_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+216,0,"uart0_rxd_oe",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+210,0,"uart0_rts_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+211,0,"uart0_dtr_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uart0_cts_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uart0_dsr_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uart0_dcd_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1401,0,"uart0_ri_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+212,0,"uart0_int",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1413,0,"nand_dma_ack_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+220,0,"apb_ready_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+221,0,"apb_rw_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+222,0,"apb_psel_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+223,0,"apb_enab_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+224,0,"apb_addr_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+225,0,"apb_datai_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+226,0,"apb_datao_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1303,0,"apb_clk_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"apb_reset_n_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+227,0,"apb_word_trans_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+57,0,"apb_valid_cpu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1414,0,"apb_high_24b_rd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBus(c+228,0,"apb_high_24b_wr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBit(c+1415,0,"apb_clk_dma",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1416,0,"apb_reset_n_dma",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+229,0,"apb_uart0_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"apb_uart0_ack",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"apb_uart0_rw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"apb_uart0_enab",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+232,0,"apb_uart0_psel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+233,0,"apb_uart0_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+234,0,"apb_uart0_datai",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+235,0,"apb_uart0_datao",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1417,0,"apb_nand_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1418,0,"apb_nand_ack",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1419,0,"apb_nand_rw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1420,0,"apb_nand_enab",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1421,0,"apb_nand_psel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1422,0,"apb_nand_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+1423,0,"apb_nand_datai",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1424,0,"apb_nand_datao",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("AA_apb_mux16", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1402,0,"ADDR_APB",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1403,0,"DATA_APB",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"DATA_APB_32",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+217,0,"apb_ready_dma",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1407,0,"apb_rw_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1408,0,"apb_psel_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1409,0,"apb_enab_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1410,0,"apb_addr_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+1411,0,"apb_wdata_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+218,0,"apb_rdata_dma",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+219,0,"dma_grant",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1412,0,"apb_valid_dma",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+57,0,"apb_valid_cpu",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+220,0,"apb_ack_cpu",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+221,0,"apb_rw_cpu",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+222,0,"apb_psel_cpu",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+223,0,"apb_enab_cpu",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+224,0,"apb_addr_cpu",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+225,0,"apb_datai_cpu",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+226,0,"apb_datao_cpu",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1414,0,"apb_high_24b_rd",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBus(c+228,0,"apb_high_24b_wr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBit(c+227,0,"apb_word_trans_cpu",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+229,0,"apb0_req",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"apb0_ack",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"apb0_rw",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+232,0,"apb0_psel",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"apb0_enab",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+233,0,"apb0_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+234,0,"apb0_datai",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+235,0,"apb0_datao",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+236,0,"apb1_req",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"apb1_ack",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"apb1_rw",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+237,0,"apb1_psel",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+238,0,"apb1_enab",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+233,0,"apb1_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+239,0,"apb1_datai",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"apb1_datao",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+240,0,"apb_ack",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"apb_rw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+241,0,"apb_psel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+242,0,"apb_enab",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+233,0,"apb_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+234,0,"apb_datai",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+243,0,"high_24b_wr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBus(c+1414,0,"high_24b_rd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBus(c+244,0,"apb_datao",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("arb_2_1", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+57,0,"valid0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1412,0,"valid1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+219,0,"dma_grant",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("AA_axi2apb_bridge_cpu", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1402,0,"L_ADDR_APB",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_s_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_s_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_s_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_s_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_s_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+5,0,"axi_s_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+197,0,"axi_s_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_s_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_s_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_s_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+6,0,"axi_s_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+198,0,"axi_s_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+199,0,"axi_s_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"axi_s_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+200,0,"axi_s_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+52,0,"axi_s_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"axi_s_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"axi_s_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"axi_s_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"axi_s_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_s_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_s_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+53,0,"axi_s_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+201,0,"axi_s_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+202,0,"axi_s_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+203,0,"axi_s_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"axi_s_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+204,0,"axi_s_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+205,0,"axi_s_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+54,0,"axi_s_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+227,0,"apb_word_trans",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+245,0,"cpu_grant",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+57,0,"apb_valid_cpu",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1414,0,"apb_high_24b_rd",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBus(c+228,0,"apb_high_24b_wr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBit(c+1303,0,"apb_clk",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"apb_reset_n",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+222,0,"reg_psel",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+223,0,"reg_enable",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+221,0,"reg_rw",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+224,0,"reg_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+225,0,"reg_datai",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+226,0,"reg_datao",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+220,0,"reg_ready_1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+58,0,"csr_rw_send_axi_rsp_done",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+246,0,"reg_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1426,0,"CSR_RW_SM_IDLE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1427,0,"CSR_RW_SM_GET_AXI_ADDR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1428,0,"CSR_RW_SM_SEND_AXI_RSP",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+247,0,"axi_s_sel_rd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+221,0,"axi_s_sel_wr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+248,0,"csr_rw_sm",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+59,0,"csr_rw_sm_nxt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+224,0,"axi_s_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+199,0,"axi_s_w_id",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+202,0,"axi_s_r_id",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+249,0,"axi_s_rstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+250,0,"apb_s_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+251,0,"reg_datai_32",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+252,0,"reg_datao_32",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+253,0,"rd_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+254,0,"apb_rd_size",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+255,0,"apb_wr_size",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->popPrefix();
    tracep->pushPrefix("uart0", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"PCLK",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"PRST_",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+232,0,"PSEL",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"PENABLE",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"PWRITE",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+256,0,"PADDR",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+234,0,"PWDATA",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+235,0,"URT_PRDATA",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+212,0,"INT",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"clk_carrier",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"TXD_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+213,0,"TXD_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+214,0,"TXD_oe",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1326,0,"RXD_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+215,0,"RXD_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+216,0,"RXD_oe",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+210,0,"RTS",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"CTS",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"DSR",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"DCD",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+211,0,"DTR",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1401,0,"RI",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"prst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+257,0,"we",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+258,0,"re",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+259,0,"rx_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+260,0,"tx2rx_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+261,0,"isomode",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("regs", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"rst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"clk_carrier",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+262,0,"addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+234,0,"dat_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+235,0,"dat_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+257,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+258,0,"re",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+213,0,"stx_pad_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1326,0,"srx_pad_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"TXD_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+215,0,"RXD_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1429,0,"modem_inputs",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+210,0,"rts_pad_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+211,0,"dtr_pad_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+212,0,"int_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+261,0,"usart_mode",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+260,0,"tx2rx_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+259,0,"rx_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+263,0,"enable",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+264,0,"srx_pad",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+265,0,"ier",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+266,0,"iir",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+267,0,"fcr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+268,0,"mcr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+269,0,"infrared",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+270,0,"rx_pol",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+271,0,"lcr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+272,0,"msr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+273,0,"dl",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 23,0);
    tracep->declBit(c+274,0,"start_dlc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+275,0,"lsr_mask_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+276,0,"msi_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+277,0,"dlc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+278,0,"trigger_level",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+279,0,"rx_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+280,0,"tx_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+281,0,"dlab",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+282,0,"usart_rx_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+283,0,"usart_tx_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+284,0,"sclk_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+285,0,"sclk_en_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+286,0,"mode_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+287,0,"fi_di_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+288,0,"sclk_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+289,0,"repeat_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+290,0,"usart_normal",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+291,0,"usart_irda",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+292,0,"usart_t0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+293,0,"usart_t1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+294,0,"tx_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+295,0,"sclk_por",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"cts_pad_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dsr_pad_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1401,0,"ri_pad_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dcd_pad_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+296,0,"loopback",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"cts",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"dsr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1430,0,"ri",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"dcd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+297,0,"cts_c",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+298,0,"dsr_c",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+299,0,"ri_c",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+300,0,"dcd_c",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+301,0,"lsr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+302,0,"lsr0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+303,0,"lsr1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+304,0,"lsr2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+305,0,"lsr3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+306,0,"lsr4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+307,0,"lsr5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+308,0,"lsr6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+309,0,"lsr7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+310,0,"lsr0r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+311,0,"lsr1r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+312,0,"lsr2r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+313,0,"lsr3r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+314,0,"lsr4r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+315,0,"lsr5r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+316,0,"lsr6r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+317,0,"lsr7r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+318,0,"lsr_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+319,0,"rls_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+320,0,"rda_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+321,0,"ti_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+322,0,"thre_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+323,0,"ms_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+324,0,"tf_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+325,0,"rf_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+326,0,"rf_data_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBit(c+327,0,"rf_error_bit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+328,0,"rf_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+329,0,"tf_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+330,0,"tstate",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+331,0,"rstate",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+332,0,"counter_t",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declBit(c+333,0,"thre_set_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+334,0,"block_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+335,0,"block_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+336,0,"current_finish",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+337,0,"max_repeat_time",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+338,0,"serial_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"serial_out_modulated",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1365,0,"rcv_pad_i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+339,0,"serial_in",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+303,0,"rf_overrun",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+340,0,"rf_push_pulse",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+341,0,"lsr_mask_condition",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+342,0,"iir_read",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+343,0,"msr_read",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+344,0,"fifo_read",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+324,0,"fifo_write",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+345,0,"delayed_modem_signals",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+346,0,"lsr0_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+347,0,"lsr1_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+348,0,"lsr2_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+349,0,"lsr3_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+350,0,"lsr4_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+351,0,"lsr5_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+352,0,"lsr6_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+353,0,"lsr7_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+354,0,"M_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 8,0);
    tracep->declBus(c+355,0,"M_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 8,0);
    tracep->declBit(c+356,0,"M_toggle",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+357,0,"rls_int_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+358,0,"thre_int_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+359,0,"ms_int_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+360,0,"ti_int_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+361,0,"rda_int_d",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+362,0,"rls_int_rise",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+363,0,"thre_int_rise",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+364,0,"ms_int_rise",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+365,0,"ti_int_rise",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+366,0,"rda_int_rise",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+367,0,"rls_int_pnd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+368,0,"rda_int_pnd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+369,0,"thre_int_pnd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+370,0,"ms_int_pnd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+371,0,"ti_int_pnd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+372,0,"d1_fifo_read",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("i_uart_sync_flops", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1431,0,"Tp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1431,0,"width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1432,0,"init_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBit(c+1364,0,"rst_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"clk_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"stage1_rst_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"stage1_clk_en_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1365,0,"async_dat_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+264,0,"sync_dat_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+373,0,"flop_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->popPrefix();
    tracep->pushPrefix("receiver", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"wb_rst_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+271,0,"lcr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+325,0,"rf_pop",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+339,0,"srx_pad_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+374,0,"enable",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+279,0,"rx_reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+318,0,"lsr_mask",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+332,0,"counter_t",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declBus(c+328,0,"rf_count",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+326,0,"rf_data_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBit(c+303,0,"rf_overrun",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+327,0,"rf_error_bit",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+331,0,"rstate",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+340,0,"rf_push_pulse",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+375,0,"rcounter16",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+376,0,"rbit_counter",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+377,0,"rshift",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+378,0,"rparity",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+379,0,"rparity_error",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+380,0,"rframing_error",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+381,0,"rbit_in",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+382,0,"rparity_xor",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+383,0,"counter_b",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+384,0,"rf_push_q",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+385,0,"rf_data_in",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBit(c+386,0,"rf_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+387,0,"break_error",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+388,0,"rcounter16_eq_7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+389,0,"rcounter16_eq_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+390,0,"rcounter16_eq_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+391,0,"rcounter16_minus_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"sr_idle",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1426,0,"sr_rec_start",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1427,0,"sr_rec_bit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1433,0,"sr_rec_parity",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1434,0,"sr_rec_stop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1435,0,"sr_check_parity",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1436,0,"sr_rec_prepare",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1437,0,"sr_end_bit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1428,0,"sr_ca_lc_parity",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1438,0,"sr_wait1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1439,0,"sr_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+392,0,"toc_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declBus(c+393,0,"brc_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("fifo_rx", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1440,0,"fifo_width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1406,0,"fifo_depth",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1441,0,"fifo_pointer_w",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1442,0,"fifo_counter_w",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"wb_rst_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+340,0,"push",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+325,0,"pop",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+385,0,"data_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBit(c+279,0,"fifo_reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+318,0,"reset_status",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+326,0,"data_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBit(c+303,0,"overrun",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+328,0,"count",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+327,0,"error_bit",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+394,0,"data8_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("fifo", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+395+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 2,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+411,0,"top",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+412,0,"bottom",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+413,0,"top_plus_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+414,0,"word0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+415,0,"word1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+416,0,"word2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+417,0,"word3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+418,0,"word4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+419,0,"word5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+420,0,"word6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+421,0,"word7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+422,0,"word8",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+423,0,"word9",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+424,0,"word10",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+425,0,"word11",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+426,0,"word12",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+427,0,"word13",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+428,0,"word14",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+429,0,"word15",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->pushPrefix("rfifo", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1441,0,"addr_width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1403,0,"data_width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1406,0,"depth",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+340,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+411,0,"a",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+412,0,"dpra",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+430,0,"di",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+394,0,"dpo",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("ram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+431+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("transmitter", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"wb_rst_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+271,0,"lcr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+324,0,"tf_push",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+234,0,"wb_dat_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+447,0,"enable",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+280,0,"tx_reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+318,0,"lsr_mask",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+261,0,"usart_mode",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+292,0,"usart_t0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1327,0,"srx_pad_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+289,0,"repeat_time",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+336,0,"current_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+337,0,"max_repeat_time",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+260,0,"tx2rx_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+338,0,"stx_pad_o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+330,0,"tstate",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+329,0,"tf_count",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+448,0,"counter",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+449,0,"bit_counter",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+450,0,"shift_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBit(c+451,0,"stx_o_tmp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+452,0,"parity_xor",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+453,0,"tf_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+454,0,"bit_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+455,0,"tx_error",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+456,0,"error_time",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+234,0,"tf_data_in",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+457,0,"tf_data_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+458,0,"tf_overrun",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"s_idle",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1443,0,"s_send_start",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1444,0,"s_send_byte",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1445,0,"s_send_parity",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1446,0,"s_send_stop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1447,0,"s_pop_byte",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1448,0,"s_send_guard1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+459,0,"tf_data_bak",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("fifo_tx", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1403,0,"fifo_width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1406,0,"fifo_depth",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1441,0,"fifo_pointer_w",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1442,0,"fifo_counter_w",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"wb_rst_i",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+324,0,"push",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+453,0,"pop",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+234,0,"data_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+280,0,"fifo_reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+318,0,"reset_status",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+457,0,"data_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+458,0,"overrun",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+329,0,"count",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+460,0,"top",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+461,0,"bottom",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+462,0,"top_plus_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->pushPrefix("tfifo", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1441,0,"addr_width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1403,0,"data_width",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1406,0,"depth",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+324,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+460,0,"a",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+461,0,"dpra",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+234,0,"di",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+457,0,"dpo",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("ram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+463+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("AXI_SLAVE_MUX", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1400,0,"spi_boot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"axi_s_aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"axi_s_aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_s_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_s_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_s_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_s_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_s_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_s_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+175,0,"axi_s_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_s_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_s_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_s_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_s_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+176,0,"axi_s_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"axi_s_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+164,0,"axi_s_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+177,0,"axi_s_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+43,0,"axi_s_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_s_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"axi_s_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"axi_s_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"axi_s_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"axi_s_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_s_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_s_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_s_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+44,0,"axi_s_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+178,0,"axi_s_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"axi_s_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+41,0,"axi_s_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+172,0,"axi_s_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+173,0,"axi_s_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+179,0,"axi_s_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+45,0,"axi_s_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s0_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s0_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s0_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s0_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"s0_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s0_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s0_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s0_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1,0,"s0_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+180,0,"s0_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s0_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s0_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s0_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s0_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"s0_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+181,0,"s0_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+182,0,"s0_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"s0_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+183,0,"s0_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+46,0,"s0_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s0_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"s0_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"s0_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"s0_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"s0_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s0_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s0_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s0_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+47,0,"s0_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+184,0,"s0_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+185,0,"s0_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1309,0,"s0_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"s0_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+186,0,"s0_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+187,0,"s0_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+48,0,"s0_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s1_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s1_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s1_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s1_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"s1_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s1_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s1_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s1_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+7,0,"s1_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s1_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s1_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s1_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s1_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s1_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+8,0,"s1_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s1_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1449,0,"s1_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1450,0,"s1_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1400,0,"s1_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+60,0,"s1_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s1_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"s1_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"s1_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"s1_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"s1_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s1_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s1_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s1_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+61,0,"s1_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s1_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1451,0,"s1_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1452,0,"s1_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1453,0,"s1_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1454,0,"s1_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s1_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+62,0,"s1_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s2_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s2_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s2_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s2_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"s2_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s2_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s2_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s2_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+5,0,"s2_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+197,0,"s2_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s2_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s2_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s2_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s2_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+6,0,"s2_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+198,0,"s2_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+199,0,"s2_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"s2_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+200,0,"s2_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+52,0,"s2_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s2_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"s2_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"s2_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"s2_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"s2_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s2_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s2_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s2_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+53,0,"s2_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+201,0,"s2_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+202,0,"s2_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+203,0,"s2_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"s2_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+204,0,"s2_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+205,0,"s2_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+54,0,"s2_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s3_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s3_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s3_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s3_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"s3_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s3_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s3_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s3_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+3,0,"s3_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+188,0,"s3_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s3_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s3_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s3_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s3_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+4,0,"s3_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+189,0,"s3_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+190,0,"s3_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"s3_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+191,0,"s3_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+49,0,"s3_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s3_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"s3_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"s3_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"s3_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"s3_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s3_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s3_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s3_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+50,0,"s3_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+192,0,"s3_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+193,0,"s3_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+194,0,"s3_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"s3_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+195,0,"s3_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+196,0,"s3_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+51,0,"s3_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s4_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s4_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s4_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s4_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"s4_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s4_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s4_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s4_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+9,0,"s4_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s4_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s4_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"s4_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s4_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s4_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+10,0,"s4_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s4_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1455,0,"s4_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1456,0,"s4_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1400,0,"s4_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+63,0,"s4_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s4_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"s4_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+167,0,"s4_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+168,0,"s4_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"s4_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"s4_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s4_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"s4_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+64,0,"s4_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s4_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1457,0,"s4_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1458,0,"s4_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1459,0,"s4_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1460,0,"s4_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"s4_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+65,0,"s4_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+479,0,"wr_data_s_hit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+480,0,"rd_addr_hit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1376,0,"wr_addr_hit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+481,0,"wr_resp_s_hit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+482,0,"s_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+483,0,"s_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+484,0,"s_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+485,0,"s_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+486,0,"s_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+487,0,"s_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->pushPrefix("s_bid", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 5; ++i) {
        tracep->declBus(c+488+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 3,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("s_bresp", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 5; ++i) {
        tracep->declBus(c+11+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 1,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("s_rid", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 5; ++i) {
        tracep->declBus(c+493+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 3,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("s_rdata", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 5; ++i) {
        tracep->declBus(c+66+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("s_rresp", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 5; ++i) {
        tracep->declBus(c+16+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 1,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+21,0,"s_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+22,0,"s_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+71,0,"s_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+72,0,"s_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+73,0,"s_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->pushPrefix("BASE_ADDR", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 5; ++i) {
        tracep->declBus(c+1461+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 4,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+498,0,"wr_sel_group_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+499,0,"wr_sel_group_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+500,0,"bvalid_group_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+501,0,"bvalid_group_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1466,0,"rd_sel_group_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1467,0,"rd_sel_group_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+502,0,"rd_valid_group_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+503,0,"rd_valid_group_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+504,0,"wr_fifo_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+505,0,"wr_fifo_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+506,0,"rd_fifo_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+507,0,"rd_fifo_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"wr_dir_ins",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"wr_dir_del",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+508,0,"wr_data_dir",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+23,0,"wr_addr_dir",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+509,0,"wr_resp_pre_sel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+510,0,"wr_resp_prog",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+511,0,"wr_resp_sel_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+512,0,"wr_resp_sel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1468,0,"axi_s_awready_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"awvlid_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"resp_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"axi_s_resp_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+24,0,"w_addr_dir_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"w_ad_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"axi_s_wready_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"wvalid_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+513,0,"rd_data_sel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+74,0,"rd_dir_ins",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+75,0,"rd_dir_del",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+513,0,"rd_data_dir",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+514,0,"rd_addr_dir",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+515,0,"rd_data_pre_sel",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1468,0,"rd_arready_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"rd_arvalid_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1469,0,"rd_addr_hit_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBit(c+516,0,"rd_addr_hit_temp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+517,0,"rd_addr_dir_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+1468,0,"axi_rd_data_int",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->pushPrefix("rd_fifo", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1470,0,"FIFO_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+506,0,"empty",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+507,0,"full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+74,0,"shift_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+514,0,"data_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+75,0,"shift_out",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+513,0,"data_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->pushPrefix("fifo_ram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 2; ++i) {
        tracep->declBus(c+518+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 2,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+520,0,"wr_ptr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+521,0,"rd_ptr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+522,0,"mem_wr_pos",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+523,0,"mem_rd_pos",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+524,0,"i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("wr_fifo", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1470,0,"FIFO_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+504,0,"empty",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+505,0,"full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"shift_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+23,0,"data_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"shift_out",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+508,0,"data_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->pushPrefix("fifo_ram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 2; ++i) {
        tracep->declBus(c+525+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 2,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+527,0,"wr_ptr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+528,0,"rd_ptr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+529,0,"mem_wr_pos",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+530,0,"mem_rd_pos",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+531,0,"i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("conf_axi_ram", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1395,0,"BUS_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"CPU_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+206,0,"ram_raddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+194,0,"ram_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+55,0,"ram_ren",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+207,0,"ram_waddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+208,0,"ram_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+56,0,"ram_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"m_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"m_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+167,0,"m_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"m_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"m_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+192,0,"m_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+168,0,"m_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+50,0,"m_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"m_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"m_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"m_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"m_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+188,0,"m_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"m_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+3,0,"m_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+190,0,"m_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+49,0,"m_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1399,0,"m_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+191,0,"m_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+194,0,"m_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+193,0,"m_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+195,0,"m_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+51,0,"m_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1399,0,"m_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+196,0,"m_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"m_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"m_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"m_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+189,0,"m_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"m_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+4,0,"m_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1471,0,"ADDR_INCR_BASE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+532,0,"ram_r_a_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+206,0,"ram_r_a_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+206,0,"ram_r_a_data_araddr_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+534,0,"ram_r_a_data_araddr_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+535,0,"ram_r_a_data_araddr_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+76,0,"ram_r_a_data_araddr_update",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+536,0,"ram_r_a_data_araddr_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+537,0,"ram_r_a_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+538,0,"ram_r_a_data_arburst_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+539,0,"ram_r_a_data_arburst_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+540,0,"ram_r_a_data_arburst_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+541,0,"ram_r_a_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+542,0,"ram_r_a_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+543,0,"ram_r_a_data_arlen_last",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+544,0,"ram_r_a_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+77,0,"ram_r_a_data_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+545,0,"ram_r_a_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+78,0,"ram_r_a_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+79,0,"ram_r_a_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+546,0,"ram_r_a_push_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declQuad(c+548,0,"ram_r_a_queue_datas",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+550,0,"ram_r_a_queue_datas_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+551,0,"ram_r_a_queue_datas_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+552,0,"ram_r_a_queue_datas_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+553,0,"ram_r_a_queue_datas_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+554,0,"ram_r_a_queue_datas_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+192,0,"ram_r_a_queue_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+545,0,"ram_r_a_queue_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+80,0,"ram_r_a_queue_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+81,0,"ram_r_a_queue_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+545,0,"ram_r_a_queue_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+555,0,"ram_r_a_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+206,0,"ram_r_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+82,0,"ram_r_allow_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+194,0,"ram_r_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+55,0,"ram_r_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+556,0,"ram_r_rcur",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1366,0,"ram_r_rcur_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+193,0,"ram_r_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+195,0,"ram_r_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+196,0,"ram_r_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+557,0,"ram_w_a_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+207,0,"ram_w_a_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+207,0,"ram_w_a_data_awaddr_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+559,0,"ram_w_a_data_awaddr_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+560,0,"ram_w_a_data_awaddr_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+83,0,"ram_w_a_data_awaddr_update",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+561,0,"ram_w_a_data_awaddr_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+562,0,"ram_w_a_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+563,0,"ram_w_a_data_awburst_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+564,0,"ram_w_a_data_awburst_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+565,0,"ram_w_a_data_awburst_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+566,0,"ram_w_a_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+567,0,"ram_w_a_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+568,0,"ram_w_a_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+84,0,"ram_w_a_data_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+569,0,"ram_w_a_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+85,0,"ram_w_a_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+570,0,"ram_w_a_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1472,0,"ram_w_a_push_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declQuad(c+571,0,"ram_w_a_queue_datas",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+573,0,"ram_w_a_queue_datas_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+574,0,"ram_w_a_queue_datas_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+575,0,"ram_w_a_queue_datas_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+576,0,"ram_w_a_queue_datas_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+577,0,"ram_w_a_queue_datas_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+188,0,"ram_w_a_queue_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+569,0,"ram_w_a_queue_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+86,0,"ram_w_a_queue_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+87,0,"ram_w_a_queue_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+569,0,"ram_w_a_queue_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+578,0,"ram_w_a_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+207,0,"ram_w_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+579,0,"ram_w_allow_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+190,0,"ram_w_b_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+88,0,"ram_w_b_data_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+580,0,"ram_w_b_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+89,0,"ram_w_b_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+85,0,"ram_w_b_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+581,0,"ram_w_b_queue_datas",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+582,0,"ram_w_b_queue_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+580,0,"ram_w_b_queue_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+90,0,"ram_w_b_queue_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+91,0,"ram_w_b_queue_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+580,0,"ram_w_b_queue_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+191,0,"ram_w_b_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"ram_w_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+583,0,"ram_w_go",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+584,0,"ram_w_strb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+208,0,"ram_w_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+585,0,"ram_w_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+584,0,"ram_w_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+586,0,"ram_w_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("confreg", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1474,0,"SIMULATION",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+1395,0,"BUS_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"CPU_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"timer_clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"resetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+55,0,"conf_ren",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+56,0,"conf_wen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+206,0,"conf_raddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+207,0,"conf_waddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+208,0,"conf_wdatain",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+194,0,"conf_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1328,0,"led",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+1329,0,"led_rg0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1330,0,"led_rg1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1331,0,"num_csn",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1332,0,"num_a_g",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 6,0);
    tracep->declBus(c+1363,0,"switch",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1333,0,"btn_key_col",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1334,0,"btn_key_row",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1335,0,"btn_step",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+587,0,"cr0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+588,0,"cr1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+589,0,"cr2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+590,0,"cr3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+591,0,"cr4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+592,0,"cr5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+593,0,"cr6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+594,0,"cr7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+595,0,"led_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+596,0,"led_rg0_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+597,0,"led_rg1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+598,0,"num_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1367,0,"switch_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+36,0,"sw_inter_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+599,0,"btn_key_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+600,0,"btn_step_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+601,0,"confreg_uart_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+602,0,"confreg_uart_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+603,0,"timer_r2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+604,0,"simu_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+605,0,"io_simu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+606,0,"virtual_uart_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+607,0,"open_trace",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+608,0,"num_monitor",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+208,0,"conf_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+194,0,"conf_rdata_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+93,0,"conf_we",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+94,0,"write_cr0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+95,0,"write_cr1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+96,0,"write_cr2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+97,0,"write_cr3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+98,0,"write_cr4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+99,0,"write_cr5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+100,0,"write_cr6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+101,0,"write_cr7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+609,0,"write_timer_begin",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+610,0,"write_timer_begin_r1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+611,0,"write_timer_begin_r2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+612,0,"write_timer_begin_r3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+613,0,"write_timer_end_r1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+614,0,"write_timer_end_r2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+615,0,"conf_wdata_r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+616,0,"conf_wdata_r1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+617,0,"conf_wdata_r2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+618,0,"timer_r1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+619,0,"timer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+102,0,"write_timer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+103,0,"write_io_simu",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+104,0,"write_open_trace",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+105,0,"write_num_monitor",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+620,0,"write_uart_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+106,0,"write_uart_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+107,0,"write_led",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+621,0,"btn_key_r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+622,0,"state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+108,0,"next_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+623,0,"key_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+624,0,"key_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+625,0,"state_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1368,0,"key_start",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1369,0,"key_end",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+626,0,"key_sample",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+109,0,"btn_key_tmp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBit(c+627,0,"btn_step0_r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+628,0,"btn_step1_r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+629,0,"step0_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+630,0,"step0_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBit(c+1370,0,"step0_start",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1371,0,"step0_end",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+631,0,"step0_sample",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+632,0,"step1_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+633,0,"step1_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBit(c+1372,0,"step1_start",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1373,0,"step1_end",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+634,0,"step1_sample",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+110,0,"write_led_rg0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+111,0,"write_led_rg1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+112,0,"write_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+635,0,"count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 19,0);
    tracep->declBus(c+636,0,"scan_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->popPrefix();
    tracep->pushPrefix("cpu", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+209,0,"intrpt",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1396,0,"arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+637,0,"arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+168,0,"arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+170,0,"arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+41,0,"rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+172,0,"rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+173,0,"rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+42,0,"rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+174,0,"rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+38,0,"wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+164,0,"bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+39,0,"bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+165,0,"bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"break_point",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"infor_flag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1375,0,"reg_num",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+1400,0,"ws_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"rf_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1313,0,"debug0_wb_pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1314,0,"debug0_wb_rf_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1315,0,"debug0_wb_rf_wnum",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+1316,0,"debug0_wb_rf_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"debug0_wb_inst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"dcache_axi_master_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"dcache_axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"dcache_axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"dcache_axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"dcache_axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"dcache_axi_master_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"dcache_axi_master_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"dcache_axi_master_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"dcache_axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"dcache_axi_master_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"dcache_axi_master_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"dcache_axi_master_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"dcache_axi_master_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"dcache_axi_master_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"dcache_axi_master_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"dcache_axi_master_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"dcache_axi_master_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"dcache_axi_master_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"dcache_axi_master_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"dcache_axi_master_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"dcache_axi_master_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"dcache_axi_master_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"dcache_axi_master_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"dcache_axi_master_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dcache_axi_master_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+114,0,"dcache_axi_master_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+115,0,"dcache_axi_master_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+116,0,"dcache_axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+117,0,"dcache_axi_master_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+118,0,"dcache_axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+119,0,"dcache_axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dcache_axi_master_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+120,0,"dcache_axi_master_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+121,0,"dcache_axi_master_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+122,0,"dcache_axi_master_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dcache_axi_master_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"dcache_cpu_if_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"dcache_cpu_if_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"dcache_cpu_if_resp_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"dcache_cpu_if_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"uncache1_axi_master_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"uncache1_axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"uncache1_axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"uncache1_axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"uncache1_axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"uncache1_axi_master_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"uncache1_axi_master_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"uncache1_axi_master_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"uncache1_axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"uncache1_axi_master_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"uncache1_axi_master_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"uncache1_axi_master_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"uncache1_axi_master_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"uncache1_axi_master_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"uncache1_axi_master_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"uncache1_axi_master_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"uncache1_axi_master_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"uncache1_axi_master_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"uncache1_axi_master_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"uncache1_axi_master_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"uncache1_axi_master_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"uncache1_axi_master_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"uncache1_axi_master_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"uncache1_axi_master_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uncache1_axi_master_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+123,0,"uncache1_axi_master_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+124,0,"uncache1_axi_master_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+125,0,"uncache1_axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+126,0,"uncache1_axi_master_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+127,0,"uncache1_axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+128,0,"uncache1_axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uncache1_axi_master_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+129,0,"uncache1_axi_master_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+130,0,"uncache1_axi_master_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+131,0,"uncache1_axi_master_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uncache1_axi_master_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"uncache1_cpu_if_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"uncache1_cpu_if_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"uncache1_cpu_if_resp_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"uncache1_cpu_if_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"uncache2_axi_master_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"uncache2_axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"uncache2_axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"uncache2_axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"uncache2_axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"uncache2_axi_master_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"uncache2_axi_master_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"uncache2_axi_master_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"uncache2_axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"uncache2_axi_master_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"uncache2_axi_master_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"uncache2_axi_master_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"uncache2_axi_master_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"uncache2_axi_master_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"uncache2_axi_master_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"uncache2_axi_master_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"uncache2_axi_master_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"uncache2_axi_master_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"uncache2_axi_master_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"uncache2_axi_master_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"uncache2_axi_master_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"uncache2_axi_master_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"uncache2_axi_master_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"uncache2_axi_master_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uncache2_axi_master_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+132,0,"uncache2_axi_master_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+133,0,"uncache2_axi_master_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+134,0,"uncache2_axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+135,0,"uncache2_axi_master_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+136,0,"uncache2_axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+137,0,"uncache2_axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uncache2_axi_master_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+138,0,"uncache2_axi_master_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+139,0,"uncache2_axi_master_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+140,0,"uncache2_axi_master_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"uncache2_axi_master_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"uncache2_cpu_if_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"uncache2_cpu_if_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"uncache2_cpu_if_resp_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"uncache2_cpu_if_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"axi_crossbar_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"axi_crossbar_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+638,0,"axi_crossbar_io_in_icache_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"axi_crossbar_io_in_icache_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"axi_crossbar_io_in_icache_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"axi_crossbar_io_in_icache_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+170,0,"axi_crossbar_io_in_icache_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"axi_crossbar_io_in_icache_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+141,0,"axi_crossbar_io_in_icache_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+142,0,"axi_crossbar_io_in_icache_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+143,0,"axi_crossbar_io_in_icache_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+642,0,"axi_crossbar_io_in_icache_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_dcache_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_dcache_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_in_dcache_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_dcache_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_dcache_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_dcache_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_dcache_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_dcache_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_dcache_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"axi_crossbar_io_in_dcache_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_dcache_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_dcache_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_in_dcache_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_dcache_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_dcache_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_dcache_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_dcache_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_dcache_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_dcache_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_crossbar_io_in_dcache_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_dcache_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_dcache_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_dcache_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_dcache_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_dcache_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+114,0,"axi_crossbar_io_in_dcache_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+115,0,"axi_crossbar_io_in_dcache_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+116,0,"axi_crossbar_io_in_dcache_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+117,0,"axi_crossbar_io_in_dcache_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+118,0,"axi_crossbar_io_in_dcache_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+119,0,"axi_crossbar_io_in_dcache_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_dcache_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+120,0,"axi_crossbar_io_in_dcache_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+121,0,"axi_crossbar_io_in_dcache_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+122,0,"axi_crossbar_io_in_dcache_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_dcache_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache1_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_uncache1_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_in_uncache1_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache1_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache1_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache1_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache1_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache1_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache1_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"axi_crossbar_io_in_uncache1_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache1_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_uncache1_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_in_uncache1_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache1_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache1_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache1_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache1_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache1_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache1_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_crossbar_io_in_uncache1_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache1_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_uncache1_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache1_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache1_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache1_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+123,0,"axi_crossbar_io_in_uncache1_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+124,0,"axi_crossbar_io_in_uncache1_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+125,0,"axi_crossbar_io_in_uncache1_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+126,0,"axi_crossbar_io_in_uncache1_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+127,0,"axi_crossbar_io_in_uncache1_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+128,0,"axi_crossbar_io_in_uncache1_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache1_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+129,0,"axi_crossbar_io_in_uncache1_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+130,0,"axi_crossbar_io_in_uncache1_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+131,0,"axi_crossbar_io_in_uncache1_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache1_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache2_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_uncache2_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_in_uncache2_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache2_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache2_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache2_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache2_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache2_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache2_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"axi_crossbar_io_in_uncache2_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache2_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_uncache2_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_in_uncache2_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache2_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache2_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_in_uncache2_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache2_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_in_uncache2_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache2_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_crossbar_io_in_uncache2_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache2_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_in_uncache2_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_in_uncache2_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache2_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache2_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+132,0,"axi_crossbar_io_in_uncache2_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+133,0,"axi_crossbar_io_in_uncache2_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+134,0,"axi_crossbar_io_in_uncache2_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+135,0,"axi_crossbar_io_in_uncache2_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+136,0,"axi_crossbar_io_in_uncache2_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+137,0,"axi_crossbar_io_in_uncache2_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache2_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+138,0,"axi_crossbar_io_in_uncache2_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+139,0,"axi_crossbar_io_in_uncache2_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+140,0,"axi_crossbar_io_in_uncache2_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_in_uncache2_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_out_ar_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"axi_crossbar_io_out_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+637,0,"axi_crossbar_io_out_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+168,0,"axi_crossbar_io_out_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"axi_crossbar_io_out_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_out_ar_data_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_out_ar_data_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_out_ar_data_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+170,0,"axi_crossbar_io_out_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"axi_crossbar_io_out_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_out_aw_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_out_aw_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"axi_crossbar_io_out_aw_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_out_aw_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_out_aw_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_crossbar_io_out_aw_data_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_out_aw_data_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_crossbar_io_out_aw_data_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_out_aw_data_awvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_crossbar_io_out_aw_awready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_crossbar_io_out_w_data_wid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_crossbar_io_out_w_data_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_crossbar_io_out_w_data_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_crossbar_io_out_w_data_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_crossbar_io_out_w_data_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+38,0,"axi_crossbar_io_out_w_wready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"axi_crossbar_io_out_r_data_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+41,0,"axi_crossbar_io_out_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+172,0,"axi_crossbar_io_out_r_data_rresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+173,0,"axi_crossbar_io_out_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+42,0,"axi_crossbar_io_out_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+174,0,"axi_crossbar_io_out_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"axi_crossbar_io_out_b_data_bid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+164,0,"axi_crossbar_io_out_b_data_bresp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+39,0,"axi_crossbar_io_out_b_data_bvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+165,0,"axi_crossbar_io_out_b_bready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"icache_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"icache_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+643,0,"icache_io_cpu_if_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+644,0,"icache_io_cpu_if_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"icache_io_cpu_if_resp_instrs_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"icache_io_cpu_if_resp_instrs_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"icache_io_cpu_if_resp_instrs_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"icache_io_cpu_if_resp_instrs_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"icache_io_cpu_if_resp_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+650,0,"icache_io_cpu_if_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+638,0,"icache_io_axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"icache_io_axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"icache_io_axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"icache_io_axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+170,0,"icache_io_axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"icache_io_axi_master_ar_arready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+141,0,"icache_io_axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+142,0,"icache_io_axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+143,0,"icache_io_axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+642,0,"icache_io_axi_master_r_rready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"fetch_unit_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"fetch_unit_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+643,0,"fetch_unit_io_icache_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+644,0,"fetch_unit_io_icache_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"fetch_unit_io_icache_resp_instrs_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"fetch_unit_io_icache_resp_instrs_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"fetch_unit_io_icache_resp_instrs_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"fetch_unit_io_icache_resp_instrs_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"fetch_unit_io_icache_resp_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+650,0,"fetch_unit_io_icache_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+651,0,"fetch_unit_io_fetch_packet_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"fetch_unit_io_fetch_packet_bits_instrs_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"fetch_unit_io_fetch_packet_bits_instrs_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"fetch_unit_io_fetch_packet_bits_instrs_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"fetch_unit_io_fetch_packet_bits_instrs_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"fetch_unit_io_fetch_packet_bits_pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"difftest_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"difftest_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+652,0,"difftest_io_inst_valid_diff",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+653,0,"difftest_io_debug0_wb_pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+649,0,"difftest_io_debug0_wb_inst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+653,0,"reg_",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("axi_crossbar", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+638,0,"io_in_icache_ar_data_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"io_in_icache_ar_data_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"io_in_icache_ar_data_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"io_in_icache_ar_data_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+170,0,"io_in_icache_ar_data_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"io_in_icache_ar_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+141,0,"io_in_icache_r_data_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+142,0,"io_in_icache_r_data_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+143,0,"io_in_icache_r_data_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+642,0,"io_in_icache_r_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_dcache_ar_data_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_dcache_ar_data_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_dcache_ar_data_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_dcache_ar_data_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_dcache_ar_data_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_dcache_ar_data_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_dcache_ar_data_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_dcache_ar_data_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_in_dcache_ar_data_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"io_in_dcache_ar_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_dcache_aw_data_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_dcache_aw_data_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_dcache_aw_data_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_dcache_aw_data_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_dcache_aw_data_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_dcache_aw_data_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_dcache_aw_data_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_dcache_aw_data_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_in_dcache_aw_data_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"io_in_dcache_aw_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_dcache_w_data_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_dcache_w_data_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"io_in_dcache_w_data_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"io_in_dcache_w_data_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_dcache_w_data_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+114,0,"io_in_dcache_w_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+115,0,"io_in_dcache_r_data_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+116,0,"io_in_dcache_r_data_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+117,0,"io_in_dcache_r_data_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+118,0,"io_in_dcache_r_data_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+119,0,"io_in_dcache_r_data_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_dcache_r_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+120,0,"io_in_dcache_b_data_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+121,0,"io_in_dcache_b_data_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+122,0,"io_in_dcache_b_data_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_dcache_b_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_uncache1_ar_data_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_uncache1_ar_data_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_uncache1_ar_data_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_uncache1_ar_data_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_uncache1_ar_data_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_uncache1_ar_data_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_uncache1_ar_data_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_uncache1_ar_data_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_in_uncache1_ar_data_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"io_in_uncache1_ar_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_uncache1_aw_data_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_uncache1_aw_data_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_uncache1_aw_data_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_uncache1_aw_data_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_uncache1_aw_data_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_uncache1_aw_data_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_uncache1_aw_data_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_uncache1_aw_data_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_in_uncache1_aw_data_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"io_in_uncache1_aw_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_uncache1_w_data_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_uncache1_w_data_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"io_in_uncache1_w_data_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"io_in_uncache1_w_data_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_uncache1_w_data_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+123,0,"io_in_uncache1_w_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+124,0,"io_in_uncache1_r_data_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+125,0,"io_in_uncache1_r_data_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+126,0,"io_in_uncache1_r_data_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+127,0,"io_in_uncache1_r_data_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+128,0,"io_in_uncache1_r_data_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_uncache1_r_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+129,0,"io_in_uncache1_b_data_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+130,0,"io_in_uncache1_b_data_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+131,0,"io_in_uncache1_b_data_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_uncache1_b_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_uncache2_ar_data_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_uncache2_ar_data_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_uncache2_ar_data_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_uncache2_ar_data_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_uncache2_ar_data_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_uncache2_ar_data_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_uncache2_ar_data_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_uncache2_ar_data_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_in_uncache2_ar_data_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"io_in_uncache2_ar_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_uncache2_aw_data_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_uncache2_aw_data_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_uncache2_aw_data_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_uncache2_aw_data_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_uncache2_aw_data_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_uncache2_aw_data_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_uncache2_aw_data_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_uncache2_aw_data_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_in_uncache2_aw_data_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"io_in_uncache2_aw_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_uncache2_w_data_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_uncache2_w_data_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"io_in_uncache2_w_data_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"io_in_uncache2_w_data_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_uncache2_w_data_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+132,0,"io_in_uncache2_w_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+133,0,"io_in_uncache2_r_data_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+134,0,"io_in_uncache2_r_data_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+135,0,"io_in_uncache2_r_data_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+136,0,"io_in_uncache2_r_data_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+137,0,"io_in_uncache2_r_data_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_uncache2_r_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+138,0,"io_in_uncache2_b_data_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+139,0,"io_in_uncache2_b_data_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+140,0,"io_in_uncache2_b_data_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_uncache2_b_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_out_ar_data_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"io_out_ar_data_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+637,0,"io_out_ar_data_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+168,0,"io_out_ar_data_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"io_out_ar_data_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_out_ar_data_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_out_ar_data_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_out_ar_data_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+170,0,"io_out_ar_data_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"io_out_ar_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_out_aw_data_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_out_aw_data_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_out_aw_data_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_out_aw_data_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_out_aw_data_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_out_aw_data_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_out_aw_data_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_out_aw_data_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"io_out_aw_data_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"io_out_aw_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_out_w_data_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_out_w_data_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"io_out_w_data_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"io_out_w_data_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_out_w_data_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+38,0,"io_out_w_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"io_out_r_data_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+41,0,"io_out_r_data_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+172,0,"io_out_r_data_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+173,0,"io_out_r_data_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+42,0,"io_out_r_data_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+174,0,"io_out_r_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"io_out_b_data_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+164,0,"io_out_b_data_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+39,0,"io_out_b_data_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+165,0,"io_out_b_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"ar_arbiter_io_in_0_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+170,0,"ar_arbiter_io_in_0_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+638,0,"ar_arbiter_io_in_0_bits_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"ar_arbiter_io_in_0_bits_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"ar_arbiter_io_in_0_bits_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"ar_arbiter_io_in_0_bits_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+113,0,"ar_arbiter_io_in_1_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"ar_arbiter_io_in_1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"ar_arbiter_io_in_1_bits_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"ar_arbiter_io_in_1_bits_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"ar_arbiter_io_in_1_bits_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_in_1_bits_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_in_1_bits_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_in_1_bits_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"ar_arbiter_io_in_1_bits_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_in_1_bits_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+113,0,"ar_arbiter_io_in_2_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"ar_arbiter_io_in_2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"ar_arbiter_io_in_2_bits_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"ar_arbiter_io_in_2_bits_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"ar_arbiter_io_in_2_bits_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_in_2_bits_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_in_2_bits_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_in_2_bits_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"ar_arbiter_io_in_2_bits_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_in_2_bits_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+113,0,"ar_arbiter_io_in_3_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"ar_arbiter_io_in_3_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"ar_arbiter_io_in_3_bits_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"ar_arbiter_io_in_3_bits_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"ar_arbiter_io_in_3_bits_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_in_3_bits_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_in_3_bits_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_in_3_bits_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"ar_arbiter_io_in_3_bits_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_in_3_bits_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+40,0,"ar_arbiter_io_out_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+170,0,"ar_arbiter_io_out_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"ar_arbiter_io_out_bits_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"ar_arbiter_io_out_bits_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+637,0,"ar_arbiter_io_out_bits_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+168,0,"ar_arbiter_io_out_bits_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"ar_arbiter_io_out_bits_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"ar_arbiter_io_out_bits_arlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"ar_arbiter_io_out_bits_arcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"ar_arbiter_io_out_bits_arprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"aw_arbiter_io_in_1_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"aw_arbiter_io_in_1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"aw_arbiter_io_in_1_bits_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"aw_arbiter_io_in_1_bits_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"aw_arbiter_io_in_1_bits_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_in_1_bits_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_in_1_bits_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_in_1_bits_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"aw_arbiter_io_in_1_bits_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_in_1_bits_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"aw_arbiter_io_in_2_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"aw_arbiter_io_in_2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"aw_arbiter_io_in_2_bits_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"aw_arbiter_io_in_2_bits_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"aw_arbiter_io_in_2_bits_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_in_2_bits_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_in_2_bits_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_in_2_bits_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"aw_arbiter_io_in_2_bits_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_in_2_bits_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"aw_arbiter_io_in_3_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"aw_arbiter_io_in_3_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"aw_arbiter_io_in_3_bits_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"aw_arbiter_io_in_3_bits_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"aw_arbiter_io_in_3_bits_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_in_3_bits_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_in_3_bits_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_in_3_bits_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"aw_arbiter_io_in_3_bits_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_in_3_bits_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"aw_arbiter_io_out_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"aw_arbiter_io_out_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"aw_arbiter_io_out_bits_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"aw_arbiter_io_out_bits_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"aw_arbiter_io_out_bits_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_out_bits_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_out_bits_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"aw_arbiter_io_out_bits_awlock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"aw_arbiter_io_out_bits_awcache",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"aw_arbiter_io_out_bits_awprot",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1476,0,"aw_arbiter_io_chosen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+655,0,"r_id_route",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+656,0,"aw_master_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1477,0,"aw_master_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+657,0,"b_id_route",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->pushPrefix("ar_arbiter", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+40,0,"io_in_0_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+170,0,"io_in_0_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+638,0,"io_in_0_bits_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"io_in_0_bits_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"io_in_0_bits_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"io_in_0_bits_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+113,0,"io_in_1_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_1_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_1_bits_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_1_bits_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_1_bits_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_1_bits_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_1_bits_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_1_bits_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_1_bits_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_1_bits_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+113,0,"io_in_2_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_2_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_2_bits_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_2_bits_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_2_bits_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_2_bits_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_2_bits_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_2_bits_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_2_bits_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_2_bits_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+113,0,"io_in_3_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_3_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_3_bits_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_3_bits_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_3_bits_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_3_bits_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_3_bits_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_3_bits_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_3_bits_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_3_bits_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+40,0,"io_out_ready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+170,0,"io_out_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_out_bits_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"io_out_bits_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+637,0,"io_out_bits_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+168,0,"io_out_bits_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+169,0,"io_out_bits_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_out_bits_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_out_bits_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_out_bits_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+658,0,"grant_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+658,0,"grant_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+658,0,"grant_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("aw_arbiter", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+37,0,"io_in_1_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_1_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_1_bits_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_1_bits_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_1_bits_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_1_bits_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_1_bits_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_1_bits_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_1_bits_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_1_bits_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"io_in_2_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_2_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_2_bits_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_2_bits_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_2_bits_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_2_bits_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_2_bits_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_2_bits_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_2_bits_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_2_bits_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"io_in_3_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_in_3_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_in_3_bits_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_in_3_bits_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_in_3_bits_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_in_3_bits_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_in_3_bits_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_in_3_bits_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_in_3_bits_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_in_3_bits_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"io_out_ready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"io_out_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"io_out_bits_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"io_out_bits_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1475,0,"io_out_bits_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1398,0,"io_out_bits_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"io_out_bits_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"io_out_bits_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"io_out_bits_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"io_out_bits_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1476,0,"io_chosen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1425,0,"grant_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1425,0,"grant_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("dcache", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_master_ar_data_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_ar_data_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"axi_master_ar_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_aw_data_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_aw_data_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_master_aw_data_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_master_aw_data_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_aw_data_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_master_aw_data_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_master_aw_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_master_w_data_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_w_data_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_w_data_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_master_w_data_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_w_data_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+114,0,"axi_master_w_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+115,0,"axi_master_r_data_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+116,0,"axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+117,0,"axi_master_r_data_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+118,0,"axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+119,0,"axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_r_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+120,0,"axi_master_b_data_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+121,0,"axi_master_b_data_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+122,0,"axi_master_b_data_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_b_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"cpu_if_req_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"cpu_if_req_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"cpu_if_resp_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"cpu_if_resp_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("difftest", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+652,0,"io_inst_valid_diff",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+653,0,"io_debug0_wb_pc",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+649,0,"io_debug0_wb_inst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"difftestInstrCommit_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestInstrCommit_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"difftestInstrCommit_index",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+659,0,"difftestInstrCommit_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+660,0,"difftestInstrCommit_pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+662,0,"difftestInstrCommit_instr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"difftestInstrCommit_skip",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"difftestInstrCommit_is_TLBFILL",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1375,0,"difftestInstrCommit_TLBFILL_index",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+1400,0,"difftestInstrCommit_is_CNTinst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1478,0,"difftestInstrCommit_timer_64_value",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1400,0,"difftestInstrCommit_wen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestInstrCommit_wdest",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"difftestInstrCommit_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1400,0,"difftestInstrCommit_csr_rstat",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1478,0,"difftestInstrCommit_csr_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1303,0,"difftestExcpEvent_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestExcpEvent_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1400,0,"difftestExcpEvent_excp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"difftestExcpEvent_eret",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1480,0,"difftestExcpEvent_intrNo",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 10,0);
    tracep->declBus(c+1481,0,"difftestExcpEvent_cause",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 5,0);
    tracep->declQuad(c+660,0,"difftestExcpEvent_exceptionPC",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+662,0,"difftestExcpEvent_exceptionInst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"difftestTrapEvent_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestTrapEvent_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1400,0,"difftestTrapEvent_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestTrapEvent_code",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+660,0,"difftestTrapEvent_pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+663,0,"difftestTrapEvent_cycleCnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+665,0,"difftestTrapEvent_instrCnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1303,0,"difftestStoreEvent_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestStoreEvent_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"difftestStoreEvent_index",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1400,0,"difftestStoreEvent_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1478,0,"difftestStoreEvent_storePAddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestStoreEvent_storeVAddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestStoreEvent_storeData",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1303,0,"difftestLoadEvent_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestLoadEvent_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"difftestLoadEvent_index",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1400,0,"difftestLoadEvent_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1478,0,"difftestLoadEvent_paddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestLoadEvent_vaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1303,0,"difftestCSRRegState_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestCSRRegState_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_crmd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_prmd",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_euen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_ecfg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_estat",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_era",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_badv",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_eentry",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_tlbidx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_tlbehi",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_tlbelo0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_tlbelo1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_asid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_pgdl",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_pgdh",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_save0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_save1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_save2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_save3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_tid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_tcfg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_tval",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_ticlr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_llbctl",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+1478,0,"difftestCSRRegState_tlbrentry",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_dmw0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"difftestCSRRegState_dmw1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"difftestGRegState_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"difftestGRegState_coreid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_8",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_9",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_10",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_11",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_12",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_13",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_14",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_15",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_16",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_17",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_18",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_19",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_20",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_21",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_22",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_23",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_24",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_25",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_26",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_27",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_28",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_29",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_30",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"difftestGRegState_gpr_31",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+659,0,"cmt_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+660,0,"cmt_pc",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+662,0,"cmt_inst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+663,0,"cycleCnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+665,0,"instrCnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("difftestCSRRegState", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"crmd",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"prmd",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"euen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"ecfg",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"estat",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"era",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"badv",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"eentry",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tlbidx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tlbehi",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tlbelo0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tlbelo1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"asid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"pgdl",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"pgdh",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"save0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"save1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"save2",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"save3",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tcfg",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tval",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"ticlr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"llbctl",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"tlbrentry",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"dmw0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"dmw1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->popPrefix();
    tracep->pushPrefix("difftestExcpEvent", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1400,0,"excp_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"eret",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"intrNo",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1397,0,"cause",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+660,0,"exceptionPC",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+662,0,"exceptionInst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("difftestGRegState", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"gpr_0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_2",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_3",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_4",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_5",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_6",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_7",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_8",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_9",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_10",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_11",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_12",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_13",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_14",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_15",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_16",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_17",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_18",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_19",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_20",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_21",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_22",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_23",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_24",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_25",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_26",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_27",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_28",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_29",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_30",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"gpr_31",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->popPrefix();
    tracep->pushPrefix("difftestInstrCommit", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"index",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+659,0,"valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+660,0,"pc",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+662,0,"instr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"skip",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"is_TLBFILL",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1375,0,"TLBFILL_index",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+1400,0,"is_CNTinst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1478,0,"timer_64_value",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1400,0,"wen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"wdest",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+1400,0,"csr_rstat",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"csr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("difftestLoadEvent", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"index",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"paddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"vaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->popPrefix();
    tracep->pushPrefix("difftestStoreEvent", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"index",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1475,0,"valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+1478,0,"storePAddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"storeVAddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+1478,0,"storeData",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->popPrefix();
    tracep->pushPrefix("difftestTrapEvent", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"coreid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1400,0,"valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"code",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declQuad(c+660,0,"pc",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+663,0,"cycleCnt",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+665,0,"instrCnt",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("fetch_unit", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+643,0,"io_icache_req_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+644,0,"io_icache_req_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"io_icache_resp_instrs_0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"io_icache_resp_instrs_1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"io_icache_resp_instrs_2",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"io_icache_resp_instrs_3",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"io_icache_resp_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+650,0,"io_icache_resp_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+651,0,"io_fetch_packet_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"io_fetch_packet_bits_instrs_0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"io_fetch_packet_bits_instrs_1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"io_fetch_packet_bits_instrs_2",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"io_fetch_packet_bits_instrs_3",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"io_fetch_packet_bits_pc",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+643,0,"pc_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+667,0,"pc_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+668,0,"fetch_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->popPrefix();
    tracep->pushPrefix("icache", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+643,0,"io_cpu_if_req_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+644,0,"io_cpu_if_req_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"io_cpu_if_resp_instrs_0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"io_cpu_if_resp_instrs_1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"io_cpu_if_resp_instrs_2",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"io_cpu_if_resp_instrs_3",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"io_cpu_if_resp_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+650,0,"io_cpu_if_resp_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+638,0,"io_axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"io_axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"io_axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"io_axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+170,0,"io_axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"io_axi_master_ar_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+141,0,"io_axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+142,0,"io_axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+143,0,"io_axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+642,0,"io_axi_master_r_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"mainPipe_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"mainPipe_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+643,0,"mainPipe_io_cpu_req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+644,0,"mainPipe_io_cpu_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"mainPipe_io_cpu_resp_instrs_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"mainPipe_io_cpu_resp_instrs_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"mainPipe_io_cpu_resp_instrs_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"mainPipe_io_cpu_resp_instrs_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"mainPipe_io_cpu_resp_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+650,0,"mainPipe_io_cpu_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+669,0,"mainPipe_io_meta_read_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"mainPipe_io_meta_read_req_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+671,0,"mainPipe_io_meta_read_resp_data_0_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+672,0,"mainPipe_io_meta_read_resp_data_0_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+673,0,"mainPipe_io_meta_read_resp_data_1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+674,0,"mainPipe_io_meta_read_resp_data_1_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+675,0,"mainPipe_io_meta_read_resp_data_2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+676,0,"mainPipe_io_meta_read_resp_data_2_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+677,0,"mainPipe_io_meta_read_resp_data_3_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+678,0,"mainPipe_io_meta_read_resp_data_3_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+669,0,"mainPipe_io_data_read_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"mainPipe_io_data_read_req_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+679,0,"mainPipe_io_data_read_resp_data_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+695,0,"mainPipe_io_data_read_resp_data_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+711,0,"mainPipe_io_data_read_resp_data_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+727,0,"mainPipe_io_data_read_resp_data_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+743,0,"mainPipe_io_miss_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+744,0,"mainPipe_io_miss_req_bits_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+670,0,"mainPipe_io_miss_req_bits_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+745,0,"mainPipe_io_miss_req_bits_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+746,0,"mainPipe_io_miss_req_bits_victim_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+747,0,"mainPipe_io_miss_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+748,0,"mainPipe_io_miss_resp_bits_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+764,0,"mainPipe_io_miss_resp_bits_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+765,0,"mainPipe_io_miss_resp_bits_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+766,0,"mainPipe_io_replacer_touch_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"mainPipe_io_replacer_touch_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+767,0,"mainPipe_io_replacer_touch_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+743,0,"mainPipe_io_replacer_victim_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"mainPipe_io_replacer_victim_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+746,0,"mainPipe_io_replacer_victim_resp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1303,0,"missUnit_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"missUnit_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+743,0,"missUnit_io_req_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+744,0,"missUnit_io_req_bits_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+670,0,"missUnit_io_req_bits_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+745,0,"missUnit_io_req_bits_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+746,0,"missUnit_io_req_bits_victim_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+747,0,"missUnit_io_resp_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+748,0,"missUnit_io_resp_bits_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+764,0,"missUnit_io_resp_bits_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+765,0,"missUnit_io_resp_bits_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+768,0,"missUnit_io_meta_write_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"missUnit_io_meta_write_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"missUnit_io_meta_write_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+771,0,"missUnit_io_meta_write_data_0_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+772,0,"missUnit_io_meta_write_data_0_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+773,0,"missUnit_io_meta_write_data_1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+774,0,"missUnit_io_meta_write_data_1_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+775,0,"missUnit_io_meta_write_data_2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+776,0,"missUnit_io_meta_write_data_2_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+777,0,"missUnit_io_meta_write_data_3_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+778,0,"missUnit_io_meta_write_data_3_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+768,0,"missUnit_io_data_write_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"missUnit_io_data_write_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"missUnit_io_data_write_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declArray(c+779,0,"missUnit_io_data_write_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+638,0,"missUnit_io_axi_ar_out_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"missUnit_io_axi_ar_out_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"missUnit_io_axi_ar_out_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"missUnit_io_axi_ar_out_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+170,0,"missUnit_io_axi_ar_out_arvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"missUnit_io_axi_ar_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+141,0,"missUnit_io_axi_r_in_rdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+142,0,"missUnit_io_axi_r_in_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+143,0,"missUnit_io_axi_r_in_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+642,0,"missUnit_io_axi_r_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"metaArray_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+669,0,"metaArray_io_read_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"metaArray_io_read_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+671,0,"metaArray_io_read_data_0_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+672,0,"metaArray_io_read_data_0_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+673,0,"metaArray_io_read_data_1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+674,0,"metaArray_io_read_data_1_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+675,0,"metaArray_io_read_data_2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+676,0,"metaArray_io_read_data_2_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+677,0,"metaArray_io_read_data_3_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+678,0,"metaArray_io_read_data_3_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+768,0,"metaArray_io_write_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"metaArray_io_write_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"metaArray_io_write_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+771,0,"metaArray_io_write_data_0_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+772,0,"metaArray_io_write_data_0_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+773,0,"metaArray_io_write_data_1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+774,0,"metaArray_io_write_data_1_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+775,0,"metaArray_io_write_data_2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+776,0,"metaArray_io_write_data_2_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+777,0,"metaArray_io_write_data_3_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+778,0,"metaArray_io_write_data_3_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1303,0,"dataArray_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+669,0,"dataArray_io_read_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"dataArray_io_read_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+679,0,"dataArray_io_read_data_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+695,0,"dataArray_io_read_data_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+711,0,"dataArray_io_read_data_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+727,0,"dataArray_io_read_data_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+768,0,"dataArray_io_write_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"dataArray_io_write_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"dataArray_io_write_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declArray(c+779,0,"dataArray_io_write_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+1303,0,"replacer_clock",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"replacer_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+766,0,"replacer_io_touch_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"replacer_io_touch_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+767,0,"replacer_io_touch_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+743,0,"replacer_io_victim_req",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"replacer_io_victim_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+746,0,"replacer_io_victim_resp",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->pushPrefix("dataArray", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+669,0,"io_read_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_read_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+679,0,"io_read_data_0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+695,0,"io_read_data_1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+711,0,"io_read_data_2",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+727,0,"io_read_data_3",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+768,0,"io_write_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"io_write_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"io_write_way",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declArray(c+779,0,"io_write_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+795,0,"dataArray_0_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+796,0,"dataArray_0_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+797,0,"dataArray_0_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+813,0,"dataArray_0_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1482,0,"dataArray_0_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+814,0,"dataArray_0_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+830,0,"dataArray_0_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+769,0,"dataArray_0_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_0_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"dataArray_0_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1483,0,"dataArray_0_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1475,0,"dataArray_0_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_0_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dataArray_0_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+795,0,"dataArray_0_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+796,0,"dataArray_0_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+813,0,"dataArray_0_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1482,0,"dataArray_0_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+846,0,"dataArray_1_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+847,0,"dataArray_1_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+848,0,"dataArray_1_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+864,0,"dataArray_1_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1499,0,"dataArray_1_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+865,0,"dataArray_1_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+881,0,"dataArray_1_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+769,0,"dataArray_1_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_1_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"dataArray_1_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1483,0,"dataArray_1_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1475,0,"dataArray_1_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_1_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dataArray_1_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+846,0,"dataArray_1_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+847,0,"dataArray_1_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+864,0,"dataArray_1_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1499,0,"dataArray_1_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+897,0,"dataArray_2_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+898,0,"dataArray_2_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+899,0,"dataArray_2_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+915,0,"dataArray_2_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1500,0,"dataArray_2_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+916,0,"dataArray_2_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+932,0,"dataArray_2_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+769,0,"dataArray_2_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_2_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"dataArray_2_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1483,0,"dataArray_2_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1475,0,"dataArray_2_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_2_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dataArray_2_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+897,0,"dataArray_2_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+898,0,"dataArray_2_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+915,0,"dataArray_2_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1500,0,"dataArray_2_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+948,0,"dataArray_3_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+949,0,"dataArray_3_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+950,0,"dataArray_3_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+966,0,"dataArray_3_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1501,0,"dataArray_3_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+967,0,"dataArray_3_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+983,0,"dataArray_3_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+769,0,"dataArray_3_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_3_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"dataArray_3_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1483,0,"dataArray_3_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1475,0,"dataArray_3_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"dataArray_3_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"dataArray_3_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+948,0,"dataArray_3_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+949,0,"dataArray_3_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+966,0,"dataArray_3_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1501,0,"dataArray_3_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->popPrefix();
    tracep->pushPrefix("mainPipe", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+643,0,"io_cpu_req_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+644,0,"io_cpu_req_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+645,0,"io_cpu_resp_instrs_0",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+646,0,"io_cpu_resp_instrs_1",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+647,0,"io_cpu_resp_instrs_2",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+648,0,"io_cpu_resp_instrs_3",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+649,0,"io_cpu_resp_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+650,0,"io_cpu_resp_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+669,0,"io_meta_read_req_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_meta_read_req_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+671,0,"io_meta_read_resp_data_0_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+672,0,"io_meta_read_resp_data_0_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+673,0,"io_meta_read_resp_data_1_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+674,0,"io_meta_read_resp_data_1_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+675,0,"io_meta_read_resp_data_2_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+676,0,"io_meta_read_resp_data_2_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+677,0,"io_meta_read_resp_data_3_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+678,0,"io_meta_read_resp_data_3_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+669,0,"io_data_read_req_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_data_read_req_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+679,0,"io_data_read_resp_data_0",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+695,0,"io_data_read_resp_data_1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+711,0,"io_data_read_resp_data_2",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+727,0,"io_data_read_resp_data_3",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+743,0,"io_miss_req_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+744,0,"io_miss_req_bits_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+670,0,"io_miss_req_bits_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+745,0,"io_miss_req_bits_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+746,0,"io_miss_req_bits_victim_way",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+747,0,"io_miss_resp_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+748,0,"io_miss_resp_bits_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+764,0,"io_miss_resp_bits_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+765,0,"io_miss_resp_bits_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+766,0,"io_replacer_touch_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_replacer_touch_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+767,0,"io_replacer_touch_way",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+743,0,"io_replacer_victim_req",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_replacer_victim_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+746,0,"io_replacer_victim_resp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+999,0,"s0_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1000,0,"s0_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1001,0,"s0_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1002,0,"s0_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+669,0,"s1_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+744,0,"s1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+670,0,"s1_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+745,0,"s1_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1003,0,"s2_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1004,0,"s2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1005,0,"s2_hit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+1006,0,"s2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+1022,0,"tag_hits_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1023,0,"tag_hits_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1024,0,"tag_hits_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1025,0,"tag_hits_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1026,0,"s1_hit",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1027,0,"s1_hit_way_hi_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1028,0,"s1_hit_way_lo_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+767,0,"s1_hit_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1029,0,"byte_offset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1029,0,"word_offset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1030,0,"bit_offset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declArray(c+1031,0,"shifted",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1047,0,"word_offset_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1048,0,"bit_offset_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declArray(c+1049,0,"shifted_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1065,0,"word_offset_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1066,0,"bit_offset_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declArray(c+1067,0,"shifted_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+1083,0,"word_offset_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1084,0,"bit_offset_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 9,0);
    tracep->declArray(c+1085,0,"shifted_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->popPrefix();
    tracep->pushPrefix("metaArray", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+669,0,"io_read_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_read_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+671,0,"io_read_data_0_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+672,0,"io_read_data_0_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+673,0,"io_read_data_1_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+674,0,"io_read_data_1_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+675,0,"io_read_data_2_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+676,0,"io_read_data_2_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+677,0,"io_read_data_3_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+678,0,"io_read_data_3_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+768,0,"io_write_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"io_write_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"io_write_way",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+771,0,"io_write_data_0_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+772,0,"io_write_data_0_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+773,0,"io_write_data_1_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+774,0,"io_write_data_1_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+775,0,"io_write_data_2_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+776,0,"io_write_data_2_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+777,0,"io_write_data_3_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+778,0,"io_write_data_3_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1101,0,"metaArray_0_valid_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_0_valid_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1103,0,"metaArray_0_valid_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1104,0,"metaArray_0_valid_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1502,0,"metaArray_0_valid_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1105,0,"metaArray_0_valid_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1106,0,"metaArray_0_valid_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"metaArray_0_valid_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_0_valid_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_0_valid_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_0_valid_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"metaArray_0_valid_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_0_valid_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_0_valid_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1101,0,"metaArray_0_valid_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_0_valid_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1104,0,"metaArray_0_valid_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1502,0,"metaArray_0_valid_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1107,0,"metaArray_0_tag_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_0_tag_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1108,0,"metaArray_0_tag_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1109,0,"metaArray_0_tag_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1503,0,"metaArray_0_tag_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1110,0,"metaArray_0_tag_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1111,0,"metaArray_0_tag_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+769,0,"metaArray_0_tag_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_0_tag_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_0_tag_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1504,0,"metaArray_0_tag_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1475,0,"metaArray_0_tag_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_0_tag_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_0_tag_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1107,0,"metaArray_0_tag_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_0_tag_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1109,0,"metaArray_0_tag_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1503,0,"metaArray_0_tag_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1112,0,"metaArray_1_valid_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_1_valid_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1113,0,"metaArray_1_valid_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1114,0,"metaArray_1_valid_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1505,0,"metaArray_1_valid_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1115,0,"metaArray_1_valid_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1116,0,"metaArray_1_valid_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"metaArray_1_valid_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_1_valid_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_1_valid_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_1_valid_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"metaArray_1_valid_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_1_valid_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_1_valid_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1112,0,"metaArray_1_valid_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_1_valid_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1114,0,"metaArray_1_valid_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1505,0,"metaArray_1_valid_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1117,0,"metaArray_1_tag_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_1_tag_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1118,0,"metaArray_1_tag_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1119,0,"metaArray_1_tag_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1506,0,"metaArray_1_tag_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1120,0,"metaArray_1_tag_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1121,0,"metaArray_1_tag_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+769,0,"metaArray_1_tag_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_1_tag_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_1_tag_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1504,0,"metaArray_1_tag_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1475,0,"metaArray_1_tag_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_1_tag_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_1_tag_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1117,0,"metaArray_1_tag_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_1_tag_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1119,0,"metaArray_1_tag_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1506,0,"metaArray_1_tag_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1122,0,"metaArray_2_valid_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_2_valid_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1123,0,"metaArray_2_valid_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1124,0,"metaArray_2_valid_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1507,0,"metaArray_2_valid_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1125,0,"metaArray_2_valid_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1126,0,"metaArray_2_valid_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"metaArray_2_valid_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_2_valid_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_2_valid_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_2_valid_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"metaArray_2_valid_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_2_valid_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_2_valid_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1122,0,"metaArray_2_valid_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_2_valid_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1124,0,"metaArray_2_valid_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1507,0,"metaArray_2_valid_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1127,0,"metaArray_2_tag_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_2_tag_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1128,0,"metaArray_2_tag_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1129,0,"metaArray_2_tag_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1508,0,"metaArray_2_tag_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1130,0,"metaArray_2_tag_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1131,0,"metaArray_2_tag_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+769,0,"metaArray_2_tag_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_2_tag_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_2_tag_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1504,0,"metaArray_2_tag_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1475,0,"metaArray_2_tag_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_2_tag_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_2_tag_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1127,0,"metaArray_2_tag_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_2_tag_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1129,0,"metaArray_2_tag_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1508,0,"metaArray_2_tag_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1132,0,"metaArray_3_valid_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_3_valid_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1133,0,"metaArray_3_valid_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1134,0,"metaArray_3_valid_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1509,0,"metaArray_3_valid_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1135,0,"metaArray_3_valid_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1136,0,"metaArray_3_valid_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"metaArray_3_valid_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_3_valid_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_3_valid_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_3_valid_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1475,0,"metaArray_3_valid_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_3_valid_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_3_valid_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1132,0,"metaArray_3_valid_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_3_valid_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1134,0,"metaArray_3_valid_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1509,0,"metaArray_3_valid_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1137,0,"metaArray_3_tag_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_3_tag_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1138,0,"metaArray_3_tag_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+1139,0,"metaArray_3_tag_current_data_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1510,0,"metaArray_3_tag_current_data_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1140,0,"metaArray_3_tag_current_data_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1141,0,"metaArray_3_tag_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+769,0,"metaArray_3_tag_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_3_tag_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+768,0,"metaArray_3_tag_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1504,0,"metaArray_3_tag_MPORT_2_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1475,0,"metaArray_3_tag_MPORT_2_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"metaArray_3_tag_MPORT_2_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"metaArray_3_tag_MPORT_2_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1137,0,"metaArray_3_tag_MPORT_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1102,0,"metaArray_3_tag_MPORT_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1139,0,"metaArray_3_tag_current_data_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1510,0,"metaArray_3_tag_current_data_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->popPrefix();
    tracep->pushPrefix("missUnit", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+743,0,"io_req_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+744,0,"io_req_bits_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+670,0,"io_req_bits_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+745,0,"io_req_bits_tag",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+746,0,"io_req_bits_victim_way",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+747,0,"io_resp_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+748,0,"io_resp_bits_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+764,0,"io_resp_bits_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+765,0,"io_resp_bits_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+768,0,"io_meta_write_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"io_meta_write_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"io_meta_write_way",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+771,0,"io_meta_write_data_0_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+772,0,"io_meta_write_data_0_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+773,0,"io_meta_write_data_1_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+774,0,"io_meta_write_data_1_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+775,0,"io_meta_write_data_2_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+776,0,"io_meta_write_data_2_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+777,0,"io_meta_write_data_3_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+778,0,"io_meta_write_data_3_tag",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBit(c+768,0,"io_data_write_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+769,0,"io_data_write_idx",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+770,0,"io_data_write_way",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declArray(c+779,0,"io_data_write_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+638,0,"io_axi_ar_out_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+639,0,"io_axi_ar_out_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+640,0,"io_axi_ar_out_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+641,0,"io_axi_ar_out_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+170,0,"io_axi_ar_out_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+40,0,"io_axi_ar_ready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+141,0,"io_axi_r_in_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+142,0,"io_axi_r_in_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+143,0,"io_axi_r_in_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+642,0,"io_axi_r_ready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1142,0,"state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1143,0,"req_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1144,0,"req_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1145,0,"req_tag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 17,0);
    tracep->declBus(c+1146,0,"req_victim_way",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1147,0,"data_buffer_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1148,0,"data_buffer_1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1149,0,"data_buffer_2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1150,0,"data_buffer_3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1151,0,"data_buffer_4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1152,0,"data_buffer_5",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1153,0,"data_buffer_6",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1154,0,"data_buffer_7",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1155,0,"data_buffer_8",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1156,0,"data_buffer_9",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1157,0,"data_buffer_10",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1158,0,"data_buffer_11",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1159,0,"data_buffer_12",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1160,0,"data_buffer_13",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1161,0,"data_buffer_14",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1162,0,"data_buffer_15",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1163,0,"data_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declArray(c+1164,0,"io_data_write_data_lo",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 255,0);
    tracep->popPrefix();
    tracep->pushPrefix("replacer", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1303,0,"clock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1364,0,"reset",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+766,0,"io_touch_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_touch_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+767,0,"io_touch_way",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+743,0,"io_victim_req",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+670,0,"io_victim_idx",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+746,0,"io_victim_resp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1172,0,"plruTree_currentPLRU_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1173,0,"plruTree_currentPLRU_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1174,0,"plruTree_currentPLRU_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1175,0,"plruTree_currentPLRU_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1176,0,"plruTree_currentPLRU_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+1177,0,"plruTree_currentPLRU_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1178,0,"plruTree_MPORT_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+670,0,"plruTree_MPORT_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"plruTree_MPORT_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+766,0,"plruTree_MPORT_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"plruTree_MPORT_1_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1475,0,"plruTree_MPORT_1_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1425,0,"plruTree_MPORT_1_mask",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"plruTree_MPORT_1_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1172,0,"plruTree_currentPLRU_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1173,0,"plruTree_currentPLRU_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+1175,0,"plruTree_currentPLRU_1_en_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1176,0,"plruTree_currentPLRU_1_addr_pipe_0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+746,0,"victimRespReg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1179,0,"victimRespReg_plru0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1180,0,"victimRespReg_plru1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1181,0,"victimRespReg_plru2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("uncache1", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_master_ar_data_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_ar_data_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"axi_master_ar_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_aw_data_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_aw_data_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_master_aw_data_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_master_aw_data_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_aw_data_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_master_aw_data_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_master_aw_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_master_w_data_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_w_data_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_w_data_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_master_w_data_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_w_data_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+123,0,"axi_master_w_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+124,0,"axi_master_r_data_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+125,0,"axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+126,0,"axi_master_r_data_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+127,0,"axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+128,0,"axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_r_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+129,0,"axi_master_b_data_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+130,0,"axi_master_b_data_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+131,0,"axi_master_b_data_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_b_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"cpu_if_req_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"cpu_if_req_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"cpu_if_resp_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"cpu_if_resp_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("uncache2", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_ar_data_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_ar_data_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_master_ar_data_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_master_ar_data_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_master_ar_data_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_ar_data_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_master_ar_data_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+113,0,"axi_master_ar_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_aw_data_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_aw_data_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+1399,0,"axi_master_aw_data_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1399,0,"axi_master_aw_data_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"axi_master_aw_data_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1398,0,"axi_master_aw_data_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"axi_master_aw_data_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+37,0,"axi_master_aw_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"axi_master_w_data_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1397,0,"axi_master_w_data_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"axi_master_w_data_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"axi_master_w_data_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_w_data_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+132,0,"axi_master_w_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+133,0,"axi_master_r_data_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+134,0,"axi_master_r_data_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+135,0,"axi_master_r_data_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+136,0,"axi_master_r_data_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+137,0,"axi_master_r_data_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_r_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+138,0,"axi_master_b_data_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+139,0,"axi_master_b_data_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+140,0,"axi_master_b_data_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"axi_master_b_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"cpu_if_req_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"cpu_if_req_valid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"cpu_if_resp_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1400,0,"cpu_if_resp_valid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("delay", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1395,0,"BUS_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"CPU_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1305,0,"enable_delay",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1306,0,"random_seed",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 22,0);
    tracep->declBus(c+166,0,"s_araddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"s_arburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s_arcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"s_arid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+167,0,"s_arlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"s_arlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"s_arprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+178,0,"s_arready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+168,0,"s_arsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+44,0,"s_arvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"s_awaddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"s_awburst",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"s_awcache",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"s_awid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"s_awlen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"s_awlock",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"s_awprot",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+175,0,"s_awready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"s_awsize",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"s_awvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"s_bid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+43,0,"s_bready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+164,0,"s_bresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+177,0,"s_bvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+41,0,"s_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+171,0,"s_rid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+173,0,"s_rlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+45,0,"s_rready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+172,0,"s_rresp",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+179,0,"s_rvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"s_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"s_wid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s_wlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+176,0,"s_wready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"s_wstrb",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"s_wvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+166,0,"m_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"m_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+167,0,"m_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"m_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"m_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+40,0,"m_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+168,0,"m_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+170,0,"m_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"m_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"m_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"m_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"m_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+37,0,"m_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"m_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1400,0,"m_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+163,0,"m_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+165,0,"m_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+164,0,"m_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+39,0,"m_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+41,0,"m_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+171,0,"m_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+173,0,"m_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+174,0,"m_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+172,0,"m_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+42,0,"m_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"m_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"m_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"m_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+38,0,"m_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"m_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"m_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1182,0,"mask_ar",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1183,0,"mask_ar_disable",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+144,0,"mask_ar_ok",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1184,0,"mask_ar_raw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1185,0,"mask_aw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1186,0,"mask_aw_disable",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"mask_aw_ok",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1187,0,"mask_aw_raw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1188,0,"mask_b",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1188,0,"mask_b_raw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1189,0,"mask_no_delay",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1190,0,"mask_r",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1190,0,"mask_r_raw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1191,0,"mask_random",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 22,0);
    tracep->declBus(c+1192,0,"mask_random_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 22,0);
    tracep->declBit(c+1364,0,"mask_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1193,0,"mask_short_delay",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1194,0,"mask_w",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1195,0,"mask_w_disable",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1400,0,"mask_w_ok",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1196,0,"mask_w_raw",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->pushPrefix("sram_axi_ram", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+1395,0,"BUS_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1395,0,"CPU_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1303,0,"aclk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1304,0,"aresetn",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1308,0,"ram_raddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1309,0,"ram_rdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1307,0,"ram_ren",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1311,0,"ram_waddr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1312,0,"ram_wdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1310,0,"ram_wen",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+166,0,"m_araddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"m_arburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m_arcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_arid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+167,0,"m_arlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"m_arlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"m_arprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+184,0,"m_arready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+168,0,"m_arsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+47,0,"m_arvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"m_awaddr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1399,0,"m_awburst",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1396,0,"m_awcache",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_awid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1396,0,"m_awlen",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1399,0,"m_awlock",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1398,0,"m_awprot",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+180,0,"m_awready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1398,0,"m_awsize",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+1,0,"m_awvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+182,0,"m_bid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+46,0,"m_bready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1399,0,"m_bresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+183,0,"m_bvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1309,0,"m_rdata",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+185,0,"m_rid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+186,0,"m_rlast",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+48,0,"m_rready",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1399,0,"m_rresp",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+187,0,"m_rvalid",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1397,0,"m_wdata",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1396,0,"m_wid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1400,0,"m_wlast",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+181,0,"m_wready",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1396,0,"m_wstrb",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+2,0,"m_wvalid",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1471,0,"ADDR_INCR_BASE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declQuad(c+1197,0,"ram_r_a_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+1199,0,"ram_r_a_data_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1199,0,"ram_r_a_data_araddr_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1200,0,"ram_r_a_data_araddr_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1201,0,"ram_r_a_data_araddr_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+145,0,"ram_r_a_data_araddr_update",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1202,0,"ram_r_a_data_araddr_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1203,0,"ram_r_a_data_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1204,0,"ram_r_a_data_arburst_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1205,0,"ram_r_a_data_arburst_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1206,0,"ram_r_a_data_arburst_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1207,0,"ram_r_a_data_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1208,0,"ram_r_a_data_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1209,0,"ram_r_a_data_arlen_last",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1210,0,"ram_r_a_data_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+146,0,"ram_r_a_data_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1211,0,"ram_r_a_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+147,0,"ram_r_a_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+148,0,"ram_r_a_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+546,0,"ram_r_a_push_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declQuad(c+1212,0,"ram_r_a_queue_datas",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+1214,0,"ram_r_a_queue_datas_araddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1215,0,"ram_r_a_queue_datas_arburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1216,0,"ram_r_a_queue_datas_arid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1217,0,"ram_r_a_queue_datas_arlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1218,0,"ram_r_a_queue_datas_arsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+184,0,"ram_r_a_queue_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1211,0,"ram_r_a_queue_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+149,0,"ram_r_a_queue_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+150,0,"ram_r_a_queue_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1211,0,"ram_r_a_queue_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1219,0,"ram_r_a_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1199,0,"ram_r_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+151,0,"ram_r_allow_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1309,0,"ram_r_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+152,0,"ram_r_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1220,0,"ram_r_rcur",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1374,0,"ram_r_rcur_reset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+185,0,"ram_r_rid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+186,0,"ram_r_rlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+187,0,"ram_r_rvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1221,0,"ram_w_a_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+1223,0,"ram_w_a_data_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1223,0,"ram_w_a_data_awaddr_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1224,0,"ram_w_a_data_awaddr_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1225,0,"ram_w_a_data_awaddr_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+153,0,"ram_w_a_data_awaddr_update",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1226,0,"ram_w_a_data_awaddr_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1227,0,"ram_w_a_data_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+1228,0,"ram_w_a_data_awburst_fixed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1229,0,"ram_w_a_data_awburst_incr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1230,0,"ram_w_a_data_awburst_wrap",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1231,0,"ram_w_a_data_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1232,0,"ram_w_a_data_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1233,0,"ram_w_a_data_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+154,0,"ram_w_a_data_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1234,0,"ram_w_a_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+155,0,"ram_w_a_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1235,0,"ram_w_a_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+1472,0,"ram_w_a_push_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declQuad(c+1236,0,"ram_w_a_queue_datas",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 44,0);
    tracep->declBus(c+1238,0,"ram_w_a_queue_datas_awaddr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+1239,0,"ram_w_a_queue_datas_awburst",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1240,0,"ram_w_a_queue_datas_awid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1241,0,"ram_w_a_queue_datas_awlen",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1242,0,"ram_w_a_queue_datas_awsize",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+180,0,"ram_w_a_queue_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1234,0,"ram_w_a_queue_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+156,0,"ram_w_a_queue_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+157,0,"ram_w_a_queue_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1234,0,"ram_w_a_queue_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1243,0,"ram_w_a_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1223,0,"ram_w_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1244,0,"ram_w_allow_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+182,0,"ram_w_b_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+158,0,"ram_w_b_data_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1245,0,"ram_w_b_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+159,0,"ram_w_b_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+155,0,"ram_w_b_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1246,0,"ram_w_b_queue_datas",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1247,0,"ram_w_b_queue_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1245,0,"ram_w_b_queue_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+160,0,"ram_w_b_queue_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+161,0,"ram_w_b_queue_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1245,0,"ram_w_b_queue_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+183,0,"ram_w_b_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+162,0,"ram_w_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1248,0,"ram_w_go",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1249,0,"ram_w_strb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1250,0,"ram_w_wdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+1251,0,"ram_w_wlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1249,0,"ram_w_wstrb",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+1252,0,"ram_w_wvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void Vsimu_top___024root__trace_init_top(Vsimu_top___024root* vlSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_init_top\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vsimu_top___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vsimu_top___024root__trace_const_0(void* voidSelf, VerilatedFst::Buffer* bufp);
VL_ATTR_COLD void Vsimu_top___024root__trace_full_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vsimu_top___024root__trace_chg_0(void* voidSelf, VerilatedFst::Buffer* bufp);
void Vsimu_top___024root__trace_cleanup(void* voidSelf, VerilatedFst* /*unused*/);

VL_ATTR_COLD void Vsimu_top___024root__trace_register(Vsimu_top___024root* vlSelf, VerilatedFst* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_register\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&Vsimu_top___024root__trace_const_0, 0, vlSelf);
    tracep->addFullCb(&Vsimu_top___024root__trace_full_0, 0, vlSelf);
    tracep->addChgCb(&Vsimu_top___024root__trace_chg_0, 0, vlSelf);
    tracep->addCleanupCb(&Vsimu_top___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vsimu_top___024root__trace_const_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp);

VL_ATTR_COLD void Vsimu_top___024root__trace_const_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_const_0\n"); );
    // Body
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    Vsimu_top___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

extern const VlWide<16>/*511:0*/ Vsimu_top__ConstPool__CONST_h93e1b771_0;

VL_ATTR_COLD void Vsimu_top___024root__trace_const_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_const_0_sub_0\n"); );
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    bufp->fullCData(oldp+1375,(0U),5);
    bufp->fullCData(oldp+1376,(1U),5);
    bufp->fullCData(oldp+1377,(2U),5);
    bufp->fullCData(oldp+1378,(0x0aU),5);
    bufp->fullCData(oldp+1379,(3U),5);
    bufp->fullCData(oldp+1380,(4U),5);
    bufp->fullCData(oldp+1381,(6U),5);
    bufp->fullCData(oldp+1382,(7U),5);
    bufp->fullCData(oldp+1383,(0x10U),5);
    bufp->fullCData(oldp+1384,(0x11U),5);
    bufp->fullCData(oldp+1385,(0x12U),5);
    bufp->fullCData(oldp+1386,(0x13U),5);
    bufp->fullCData(oldp+1387,(0x14U),5);
    bufp->fullCData(oldp+1388,(0x15U),5);
    bufp->fullCData(oldp+1389,(0x16U),5);
    bufp->fullCData(oldp+1390,(0x17U),5);
    bufp->fullCData(oldp+1391,(0x18U),5);
    bufp->fullCData(oldp+1392,(0x19U),5);
    bufp->fullCData(oldp+1393,(0x1aU),5);
    bufp->fullCData(oldp+1394,(0x1bU),5);
    bufp->fullIData(oldp+1395,(0x00000020U),32);
    bufp->fullCData(oldp+1396,(0U),4);
    bufp->fullIData(oldp+1397,(0U),32);
    bufp->fullCData(oldp+1398,(0U),3);
    bufp->fullCData(oldp+1399,(0U),2);
    bufp->fullBit(oldp+1400,(0U));
    bufp->fullBit(oldp+1401,(vlSelfRef.simu_top__DOT__soc__DOT__UART_RI));
    bufp->fullIData(oldp+1402,(0x00000014U),32);
    bufp->fullIData(oldp+1403,(8U),32);
    bufp->fullIData(oldp+1404,(0x00000040U),32);
    bufp->fullIData(oldp+1405,(0x00000080U),32);
    bufp->fullIData(oldp+1406,(0x00000010U),32);
    bufp->fullBit(oldp+1407,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_rw_dma));
    bufp->fullBit(oldp+1408,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_dma));
    bufp->fullBit(oldp+1409,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_dma));
    bufp->fullIData(oldp+1410,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_addr_dma),20);
    bufp->fullIData(oldp+1411,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma),32);
    bufp->fullBit(oldp+1412,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_valid_dma));
    bufp->fullBit(oldp+1413,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_ack_i));
    bufp->fullIData(oldp+1414,(0U),24);
    bufp->fullBit(oldp+1415,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_clk_dma));
    bufp->fullBit(oldp+1416,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_reset_n_dma));
    bufp->fullBit(oldp+1417,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_req));
    bufp->fullBit(oldp+1418,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_ack));
    bufp->fullBit(oldp+1419,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_rw));
    bufp->fullBit(oldp+1420,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_enab));
    bufp->fullBit(oldp+1421,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_psel));
    bufp->fullIData(oldp+1422,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_addr),20);
    bufp->fullIData(oldp+1423,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_datai),32);
    bufp->fullIData(oldp+1424,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_nand_datao),32);
    bufp->fullBit(oldp+1425,(1U));
    bufp->fullCData(oldp+1426,(1U),4);
    bufp->fullCData(oldp+1427,(2U),4);
    bufp->fullCData(oldp+1428,(8U),4);
    bufp->fullCData(oldp+1429,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__UART_RI) 
                                << 1U)),4);
    bufp->fullBit(oldp+1430,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__UART_RI)))));
    bufp->fullIData(oldp+1431,(1U),32);
    bufp->fullBit(oldp+1432,(1U));
    bufp->fullCData(oldp+1433,(3U),4);
    bufp->fullCData(oldp+1434,(4U),4);
    bufp->fullCData(oldp+1435,(5U),4);
    bufp->fullCData(oldp+1436,(6U),4);
    bufp->fullCData(oldp+1437,(7U),4);
    bufp->fullCData(oldp+1438,(9U),4);
    bufp->fullCData(oldp+1439,(0x0aU),4);
    bufp->fullIData(oldp+1440,(0x0000000bU),32);
    bufp->fullIData(oldp+1441,(4U),32);
    bufp->fullIData(oldp+1442,(5U),32);
    bufp->fullCData(oldp+1443,(1U),3);
    bufp->fullCData(oldp+1444,(2U),3);
    bufp->fullCData(oldp+1445,(3U),3);
    bufp->fullCData(oldp+1446,(4U),3);
    bufp->fullCData(oldp+1447,(5U),3);
    bufp->fullCData(oldp+1448,(6U),3);
    bufp->fullCData(oldp+1449,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bid),4);
    bufp->fullCData(oldp+1450,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_bresp),2);
    bufp->fullCData(oldp+1451,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rid),4);
    bufp->fullIData(oldp+1452,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rdata),32);
    bufp->fullCData(oldp+1453,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rresp),2);
    bufp->fullBit(oldp+1454,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s1_rlast));
    bufp->fullCData(oldp+1455,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bid),4);
    bufp->fullCData(oldp+1456,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_bresp),2);
    bufp->fullCData(oldp+1457,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rid),4);
    bufp->fullIData(oldp+1458,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rdata),32);
    bufp->fullCData(oldp+1459,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rresp),2);
    bufp->fullBit(oldp+1460,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s4_rlast));
    bufp->fullCData(oldp+1461,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[0]),5);
    bufp->fullCData(oldp+1462,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[1]),5);
    bufp->fullCData(oldp+1463,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[2]),5);
    bufp->fullCData(oldp+1464,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[3]),5);
    bufp->fullCData(oldp+1465,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__BASE_ADDR[4]),5);
    bufp->fullCData(oldp+1466,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_sel_group_0),3);
    bufp->fullCData(oldp+1467,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_sel_group_1),3);
    bufp->fullIData(oldp+1468,(5U),32);
    bufp->fullIData(oldp+1469,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit_int),32);
    bufp->fullIData(oldp+1470,(3U),32);
    bufp->fullIData(oldp+1471,(2U),32);
    bufp->fullQData(oldp+1472,(0ULL),45);
    bufp->fullBit(oldp+1474,(0U));
    bufp->fullCData(oldp+1475,(0U),8);
    bufp->fullCData(oldp+1476,(3U),2);
    bufp->fullCData(oldp+1477,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx),2);
    bufp->fullQData(oldp+1478,(0ULL),64);
    bufp->fullSData(oldp+1480,(0U),11);
    bufp->fullCData(oldp+1481,(0U),6);
    bufp->fullCData(oldp+1482,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_addr_pipe_0),8);
    bufp->fullWData(oldp+1483,(Vsimu_top__ConstPool__CONST_h93e1b771_0),512);
    bufp->fullCData(oldp+1499,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1500,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1501,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1502,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1503,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0),8);
    bufp->fullIData(oldp+1504,(0U),18);
    bufp->fullCData(oldp+1505,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1506,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1507,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1508,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1509,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0),8);
    bufp->fullCData(oldp+1510,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0),8);
}

VL_ATTR_COLD void Vsimu_top___024root__trace_full_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp);

VL_ATTR_COLD void Vsimu_top___024root__trace_full_0(void* voidSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_full_0\n"); );
    // Body
    Vsimu_top___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vsimu_top___024root*>(voidSelf);
    Vsimu_top__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    Vsimu_top___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vsimu_top___024root__trace_full_0_sub_0(Vsimu_top___024root* vlSelf, VerilatedFst::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vsimu_top___024root__trace_full_0_sub_0\n"); );
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
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    bufp->fullBit(oldp+1,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid))));
    bufp->fullBit(oldp+2,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid))));
    bufp->fullBit(oldp+3,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                 >> 3U))));
    bufp->fullBit(oldp+4,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                 >> 3U))));
    bufp->fullBit(oldp+5,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                 >> 2U))));
    bufp->fullBit(oldp+6,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                 >> 2U))));
    bufp->fullBit(oldp+7,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                 >> 1U))));
    bufp->fullBit(oldp+8,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                 >> 1U))));
    bufp->fullBit(oldp+9,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid) 
                                 >> 4U))));
    bufp->fullBit(oldp+10,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid) 
                                  >> 4U))));
    bufp->fullCData(oldp+11,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[0]),2);
    bufp->fullCData(oldp+12,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[1]),2);
    bufp->fullCData(oldp+13,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[2]),2);
    bufp->fullCData(oldp+14,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[3]),2);
    bufp->fullCData(oldp+15,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bresp[4]),2);
    bufp->fullCData(oldp+16,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[0]),2);
    bufp->fullCData(oldp+17,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[1]),2);
    bufp->fullCData(oldp+18,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[2]),2);
    bufp->fullCData(oldp+19,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[3]),2);
    bufp->fullCData(oldp+20,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rresp[4]),2);
    bufp->fullCData(oldp+21,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awvalid),5);
    bufp->fullCData(oldp+22,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wvalid),5);
    bufp->fullCData(oldp+23,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_addr_dir),3);
    bufp->fullIData(oldp+24,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__w_addr_dir_int),32);
    bufp->fullBit(oldp+25,(vlSelfRef.NAND_top__DOT__HIT0));
    bufp->fullBit(oldp+26,(vlSelfRef.NAND_top__DOT__HIT1));
    bufp->fullBit(oldp+27,(vlSelfRef.NAND_top__DOT__HIT2));
    bufp->fullBit(oldp+28,(vlSelfRef.NAND_top__DOT__HIT3));
    bufp->fullBit(oldp+29,(vlSelfRef.NAND_top__DOT__HIT6));
    bufp->fullBit(oldp+30,(vlSelfRef.NAND_top__DOT__HIT7));
    bufp->fullBit(oldp+31,(vlSelfRef.NAND_top__DOT__HIT8));
    bufp->fullBit(oldp+32,(vlSelfRef.NAND_top__DOT__HIT9));
    bufp->fullBit(oldp+33,(vlSelfRef.NAND_top__DOT__HIT10));
    bufp->fullBit(oldp+34,(vlSelfRef.NAND_top__DOT__HIT11));
    bufp->fullBit(oldp+35,(vlSelfRef.NAND_top__DOT__NAND_HIT));
    bufp->fullIData(oldp+36,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__sw_inter_data),32);
    bufp->fullBit(oldp+37,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__dcache__DOT__axi_master_aw_awready));
    bufp->fullBit(oldp+38,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready));
    bufp->fullBit(oldp+39,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid));
    bufp->fullBit(oldp+40,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_arready));
    bufp->fullIData(oldp+41,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata),32);
    bufp->fullBit(oldp+42,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid));
    bufp->fullBit(oldp+43,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_bready));
    bufp->fullBit(oldp+44,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid));
    bufp->fullBit(oldp+45,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready));
    bufp->fullBit(oldp+46,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready))));
    bufp->fullBit(oldp+47,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid))));
    bufp->fullBit(oldp+48,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready))));
    bufp->fullBit(oldp+49,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                  >> 3U))));
    bufp->fullBit(oldp+50,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                  >> 3U))));
    bufp->fullBit(oldp+51,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                  >> 3U))));
    bufp->fullBit(oldp+52,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                  >> 2U))));
    bufp->fullBit(oldp+53,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                  >> 2U))));
    bufp->fullBit(oldp+54,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                  >> 2U))));
    bufp->fullBit(oldp+55,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren));
    bufp->fullCData(oldp+56,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen),4);
    bufp->fullBit(oldp+57,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_valid_cpu));
    bufp->fullBit(oldp+58,((((8U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm)) 
                             & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast) 
                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                   >> 2U))) | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                                >> 2U) 
                                               & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid)))));
    bufp->fullCData(oldp+59,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm_nxt),4);
    bufp->fullBit(oldp+60,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                  >> 1U))));
    bufp->fullBit(oldp+61,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                  >> 1U))));
    bufp->fullBit(oldp+62,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                  >> 1U))));
    bufp->fullBit(oldp+63,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready) 
                                  >> 4U))));
    bufp->fullBit(oldp+64,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid) 
                                  >> 4U))));
    bufp->fullBit(oldp+65,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                  >> 4U))));
    bufp->fullIData(oldp+66,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[0]),32);
    bufp->fullIData(oldp+67,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[1]),32);
    bufp->fullIData(oldp+68,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[2]),32);
    bufp->fullIData(oldp+69,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[3]),32);
    bufp->fullIData(oldp+70,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rdata[4]),32);
    bufp->fullCData(oldp+71,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bready),5);
    bufp->fullCData(oldp+72,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arvalid),5);
    bufp->fullCData(oldp+73,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready),5);
    bufp->fullBit(oldp+74,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_dir_ins));
    bufp->fullBit(oldp+75,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty)) 
                            & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid) 
                               & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast) 
                                  & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_rready))))));
    bufp->fullBit(oldp+76,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_ren))));
    bufp->fullBit(oldp+77,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_push));
    bufp->fullBit(oldp+78,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop));
    bufp->fullBit(oldp+79,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push));
    bufp->fullBit(oldp+80,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid) 
                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop))));
    bufp->fullBit(oldp+81,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_push));
    bufp->fullBit(oldp+82,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid)) 
                                  | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready) 
                                     >> 3U)))));
    bufp->fullBit(oldp+83,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast)) 
                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en))));
    bufp->fullBit(oldp+84,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_push));
    bufp->fullBit(oldp+85,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop));
    bufp->fullBit(oldp+86,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid) 
                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop))));
    bufp->fullBit(oldp+87,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_push));
    bufp->fullBit(oldp+88,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_pop) 
                            & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid)) 
                               | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop)))));
    bufp->fullBit(oldp+89,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop));
    bufp->fullBit(oldp+90,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid) 
                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_pop))));
    bufp->fullBit(oldp+91,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_push));
    bufp->fullBit(oldp+92,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_en));
    bufp->fullBit(oldp+93,((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen))));
    bufp->fullBit(oldp+94,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                            & (0x8000U == (0x0000ffffU 
                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+95,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                            & (0x8010U == (0x0000ffffU 
                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+96,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                            & (0x8020U == (0x0000ffffU 
                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+97,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                            & (0x8030U == (0x0000ffffU 
                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+98,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                            & (0x8040U == (0x0000ffffU 
                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+99,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                            & (0x8050U == (0x0000ffffU 
                                           & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+100,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0x8060U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+101,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0x8070U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+102,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer));
    bufp->fullBit(oldp+103,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xff00U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+104,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xff30U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+105,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xff40U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+106,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_uart_valid));
    bufp->fullBit(oldp+107,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xf020U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullCData(oldp+108,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__next_state),3);
    bufp->fullSData(oldp+109,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_tmp),16);
    bufp->fullBit(oldp+110,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xf030U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+111,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xf040U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+112,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wen)) 
                             & (0xf050U == (0x0000ffffU 
                                            & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))));
    bufp->fullBit(oldp+113,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_arready))));
    bufp->fullBit(oldp+114,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                             & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                & ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))))));
    bufp->fullCData(oldp+115,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                             : 0U))
                                : 0U)),4);
    bufp->fullIData(oldp+116,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
                                             : 0U))
                                : 0U)),32);
    bufp->fullCData(oldp+117,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                             : 0U))
                                : 0U)),2);
    bufp->fullBit(oldp+118,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                               & (4U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
                             & (0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                             >> 2U))))));
    bufp->fullBit(oldp+119,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                              & (4U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                             & (0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                             >> 2U))))));
    bufp->fullCData(oldp+120,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                             ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                             : 0U))
                                : 0U)),4);
    bufp->fullCData(oldp+121,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                             ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                             : 0U))
                                : 0U)),2);
    bufp->fullBit(oldp+122,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid) 
                              & (4U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)))) 
                             & (0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                             >> 2U))))));
    bufp->fullBit(oldp+123,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                             & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                   & ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                      & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready)))))));
    bufp->fullCData(oldp+124,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))
                                              ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                              : 0U)))
                                : 0U)),4);
    bufp->fullIData(oldp+125,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))
                                              ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
                                              : 0U)))
                                : 0U)),32);
    bufp->fullCData(oldp+126,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))
                                              ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                              : 0U)))
                                : 0U)),2);
    bufp->fullBit(oldp+127,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                               & (8U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
                             & ((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                              >> 2U))) 
                                & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))))));
    bufp->fullBit(oldp+128,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                              & (8U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                             & ((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                              >> 2U))) 
                                & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))))));
    bufp->fullCData(oldp+129,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U)))
                                              ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                              : 0U)))
                                : 0U)),4);
    bufp->fullCData(oldp+130,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U)))
                                              ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                              : 0U)))
                                : 0U)),2);
    bufp->fullBit(oldp+131,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid) 
                              & (8U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)))) 
                             & ((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                              >> 2U))) 
                                & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U)))))));
    bufp->fullBit(oldp+132,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid) 
                             & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                   & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                      & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_idx)) 
                                         & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_w_wready))))))));
    bufp->fullCData(oldp+133,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))
                                              ? 0U : 
                                             ((3U == 
                                               (3U 
                                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))
                                               ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)
                                               : 0U))))
                                : 0U)),4);
    bufp->fullIData(oldp+134,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))
                                              ? 0U : 
                                             ((3U == 
                                               (3U 
                                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))
                                               ? vlSelfRef.simu_top__DOT__soc__DOT__m0_rdata
                                               : 0U))))
                                : 0U)),32);
    bufp->fullCData(oldp+135,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))
                                              ? 0U : 
                                             ((3U == 
                                               (3U 
                                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                   >> 2U)))
                                               ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp)
                                               : 0U))))
                                : 0U)),2);
    bufp->fullBit(oldp+136,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                               & (0x0cU == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast)) 
                             & (((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U))) 
                                 & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))) 
                                & (2U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))))));
    bufp->fullBit(oldp+137,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                              & (0x0cU == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                             & (((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                               >> 2U))) 
                                 & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                 >> 2U)))) 
                                & (2U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                                >> 2U)))))));
    bufp->fullCData(oldp+138,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U)))
                                              ? 0U : 
                                             ((3U == 
                                               (3U 
                                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                   >> 2U)))
                                               ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)
                                               : 0U))))
                                : 0U)),4);
    bufp->fullCData(oldp+139,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid)
                                ? ((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))
                                    ? 0U : ((1U == 
                                             (3U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U)))
                                             ? 0U : 
                                            ((2U == 
                                              (3U & 
                                               ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U)))
                                              ? 0U : 
                                             ((3U == 
                                               (3U 
                                                & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                   >> 2U)))
                                               ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp)
                                               : 0U))))
                                : 0U)),2);
    bufp->fullBit(oldp+140,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_b_data_bvalid) 
                              & (0x0cU == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid)))) 
                             & (((0U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                               >> 2U))) 
                                 & (1U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                 >> 2U)))) 
                                & (2U != (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                                >> 2U)))))));
    bufp->fullIData(oldp+141,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_data_rdata),32);
    bufp->fullBit(oldp+142,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_r_data_rvalid) 
                              & (0U == (0x0cU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid)))) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast))));
    bufp->fullBit(oldp+143,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_r_data_rvalid));
    bufp->fullBit(oldp+144,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__s_arvalid) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready))));
    bufp->fullBit(oldp+145,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en))));
    bufp->fullBit(oldp+146,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_push));
    bufp->fullBit(oldp+147,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop));
    bufp->fullBit(oldp+148,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_push));
    bufp->fullBit(oldp+149,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop))));
    bufp->fullBit(oldp+150,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_push));
    bufp->fullBit(oldp+151,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid)) 
                                   | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rready)))));
    bufp->fullBit(oldp+152,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_en));
    bufp->fullBit(oldp+153,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en))));
    bufp->fullBit(oldp+154,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_push));
    bufp->fullBit(oldp+155,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop));
    bufp->fullBit(oldp+156,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop))));
    bufp->fullBit(oldp+157,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_push));
    bufp->fullBit(oldp+158,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_pop) 
                             & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid)) 
                                | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop)))));
    bufp->fullBit(oldp+159,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop));
    bufp->fullBit(oldp+160,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_pop))));
    bufp->fullBit(oldp+161,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_push));
    bufp->fullBit(oldp+162,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_en));
    bufp->fullCData(oldp+163,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid),4);
    bufp->fullCData(oldp+164,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bresp),2);
    bufp->fullBit(oldp+165,((0U == (3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                          >> 2U)))));
    bufp->fullIData(oldp+166,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_araddr),32);
    bufp->fullCData(oldp+167,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arlen))),4);
    bufp->fullCData(oldp+168,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arsize),3);
    bufp->fullCData(oldp+169,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arburst),2);
    bufp->fullBit(oldp+170,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid));
    bufp->fullCData(oldp+171,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid),4);
    bufp->fullCData(oldp+172,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rresp),2);
    bufp->fullBit(oldp+173,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rlast));
    bufp->fullBit(oldp+174,((IData)((((0U == (0x0cU 
                                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid))) 
                                      & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))) 
                                     & ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & (1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)))))));
    bufp->fullBit(oldp+175,(vlSelfRef.simu_top__DOT__soc__DOT__m0_awready));
    bufp->fullBit(oldp+176,(vlSelfRef.simu_top__DOT__soc__DOT__m0_wready));
    bufp->fullBit(oldp+177,(vlSelfRef.simu_top__DOT__soc__DOT__m0_bvalid));
    bufp->fullBit(oldp+178,(vlSelfRef.simu_top__DOT__soc__DOT__m0_arready));
    bufp->fullBit(oldp+179,(vlSelfRef.simu_top__DOT__soc__DOT__m0_rvalid));
    bufp->fullBit(oldp+180,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid)))));
    bufp->fullBit(oldp+181,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__m_wready));
    bufp->fullCData(oldp+182,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_data),4);
    bufp->fullBit(oldp+183,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_valid));
    bufp->fullBit(oldp+184,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid)))));
    bufp->fullCData(oldp+185,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rid),4);
    bufp->fullBit(oldp+186,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rlast));
    bufp->fullBit(oldp+187,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid));
    bufp->fullBit(oldp+188,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid)))));
    bufp->fullBit(oldp+189,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__m_wready));
    bufp->fullCData(oldp+190,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_data),4);
    bufp->fullBit(oldp+191,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_valid));
    bufp->fullBit(oldp+192,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid)))));
    bufp->fullCData(oldp+193,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rid),4);
    bufp->fullIData(oldp+194,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_rdata_reg),32);
    bufp->fullBit(oldp+195,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rlast));
    bufp->fullBit(oldp+196,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rvalid));
    bufp->fullBit(oldp+197,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_awready));
    bufp->fullBit(oldp+198,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_wready));
    bufp->fullCData(oldp+199,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_w_id),4);
    bufp->fullBit(oldp+200,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_bvalid));
    bufp->fullBit(oldp+201,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_arready));
    bufp->fullCData(oldp+202,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_r_id),4);
    bufp->fullIData(oldp+203,(((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                ? vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32
                                : ((1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                    ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 8U)
                                    : ((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                        ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x00000010U)
                                        : ((3U == (3U 
                                                   & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb)))
                                            ? VL_SHIFTL_III(32,32,32, vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32, 0x00000018U)
                                            : 0U))))),32);
    bufp->fullBit(oldp+204,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rlast));
    bufp->fullBit(oldp+205,(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid));
    bufp->fullIData(oldp+206,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr),32);
    bufp->fullIData(oldp+207,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr),32);
    bufp->fullIData(oldp+208,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata),32);
    bufp->fullCData(oldp+209,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__uart0_int) 
                               << 1U)),8);
    bufp->fullBit(oldp+210,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                   >> 1U))));
    bufp->fullBit(oldp+211,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr))));
    bufp->fullBit(oldp+212,(vlSelfRef.simu_top__DOT__soc__DOT__uart0_int));
    bufp->fullBit(oldp+213,((IData)(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                       >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared)) 
                                     | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out)))));
    bufp->fullBit(oldp+214,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                             & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en) 
                                | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en)))));
    bufp->fullBit(oldp+215,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg) 
                                   ^ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 3U)))));
    bufp->fullBit(oldp+216,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))));
    bufp->fullBit(oldp+217,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack))));
    bufp->fullIData(oldp+218,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao)
                                : 0U)),32);
    bufp->fullBit(oldp+219,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant));
    bufp->fullBit(oldp+220,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack))));
    bufp->fullBit(oldp+221,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_wr));
    bufp->fullBit(oldp+222,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_psel_cpu));
    bufp->fullBit(oldp+223,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_enab_cpu));
    bufp->fullIData(oldp+224,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_req_addr),20);
    bufp->fullCData(oldp+225,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_datai_cpu),8);
    bufp->fullCData(oldp+226,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao),8);
    bufp->fullBit(oldp+227,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_word_trans));
    bufp->fullIData(oldp+228,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr),24);
    bufp->fullBit(oldp+229,((0U == (0x0000003fU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                   >> 0x0000000eU)))));
    bufp->fullBit(oldp+230,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_ack));
    bufp->fullBit(oldp+231,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_rw));
    bufp->fullBit(oldp+232,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel) 
                             & (0U == (0x000fc000U 
                                       & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)))));
    bufp->fullIData(oldp+233,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr),20);
    bufp->fullCData(oldp+234,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai),8);
    bufp->fullCData(oldp+235,((0x000000ffU & ((4U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)
                                               ? ((2U 
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
                                               : ((2U 
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
    bufp->fullBit(oldp+236,((0U != (0x0000003fU & (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                                   >> 0x0000000eU)))));
    bufp->fullBit(oldp+237,(((0U != (0x0000003fU & 
                                     (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                      >> 0x0000000eU))) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel))));
    bufp->fullBit(oldp+238,(((0U != (0x0000003fU & 
                                     (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr 
                                      >> 0x0000000eU))) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab))));
    bufp->fullIData(oldp+239,(((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                  ? (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                     >> 8U) : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr) 
                                << 8U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_datai))),32);
    bufp->fullBit(oldp+240,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_ack));
    bufp->fullBit(oldp+241,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_psel));
    bufp->fullBit(oldp+242,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_enab));
    bufp->fullIData(oldp+243,((0x00ffffffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)
                                               ? (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_wdata_dma 
                                                  >> 8U)
                                               : vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_high_24b_wr))),24);
    bufp->fullCData(oldp+244,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_apb_mux16__DOT__apb_datao),8);
    bufp->fullBit(oldp+245,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__dma_grant)))));
    bufp->fullBit(oldp+246,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_ready));
    bufp->fullBit(oldp+247,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_sel_rd));
    bufp->fullCData(oldp+248,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__csr_rw_sm),4);
    bufp->fullCData(oldp+249,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__axi_s_rstrb),4);
    bufp->fullCData(oldp+250,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_s_wstrb),4);
    bufp->fullIData(oldp+251,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datai_32),32);
    bufp->fullIData(oldp+252,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__reg_datao_32),32);
    bufp->fullCData(oldp+253,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__rd_count),3);
    bufp->fullCData(oldp+254,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_rd_size),3);
    bufp->fullCData(oldp+255,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__AA_axi2apb_bridge_cpu__DOT__apb_wr_size),3);
    bufp->fullCData(oldp+256,((0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),8);
    bufp->fullBit(oldp+257,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__we));
    bufp->fullBit(oldp+258,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__re));
    bufp->fullBit(oldp+259,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en));
    bufp->fullBit(oldp+260,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__tx2rx_en));
    bufp->fullBit(oldp+261,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode));
    bufp->fullCData(oldp+262,((7U & vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__apb_uart0_addr)),3);
    bufp->fullBit(oldp+263,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable));
    bufp->fullBit(oldp+264,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__srx_pad));
    bufp->fullCData(oldp+265,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ier),4);
    bufp->fullCData(oldp+266,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir),4);
    bufp->fullCData(oldp+267,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fcr),2);
    bufp->fullCData(oldp+268,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr),5);
    bufp->fullBit(oldp+269,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__infrared));
    bufp->fullBit(oldp+270,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_pol));
    bufp->fullCData(oldp+271,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr),8);
    bufp->fullCData(oldp+272,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr),8);
    bufp->fullIData(oldp+273,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dl),24);
    bufp->fullBit(oldp+274,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__start_dlc));
    bufp->fullBit(oldp+275,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_d));
    bufp->fullBit(oldp+276,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msi_reset));
    bufp->fullSData(oldp+277,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__dlc),16);
    bufp->fullCData(oldp+278,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__trigger_level),4);
    bufp->fullBit(oldp+279,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_reset));
    bufp->fullBit(oldp+280,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tx_reset));
    bufp->fullBit(oldp+281,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lcr) 
                                   >> 7U))));
    bufp->fullBit(oldp+282,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                   >> 2U))));
    bufp->fullBit(oldp+283,((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                      >> 2U)))));
    bufp->fullBit(oldp+284,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_reg));
    bufp->fullBit(oldp+285,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_en_reg));
    bufp->fullCData(oldp+286,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg),8);
    bufp->fullCData(oldp+287,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fi_di_reg),8);
    bufp->fullCData(oldp+288,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__sclk_count),8);
    bufp->fullCData(oldp+289,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__repeat_reg),3);
    bufp->fullBit(oldp+290,((0U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
    bufp->fullBit(oldp+291,((1U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
    bufp->fullBit(oldp+292,((2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
    bufp->fullBit(oldp+293,((3U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))));
    bufp->fullBit(oldp+294,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                             | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                    >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)))));
    bufp->fullBit(oldp+295,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                   >> 3U))));
    bufp->fullBit(oldp+296,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mcr) 
                                   >> 4U))));
    bufp->fullBit(oldp+297,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                   >> 3U))));
    bufp->fullBit(oldp+298,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                   >> 2U))));
    bufp->fullBit(oldp+299,((1U & ((IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0) 
                                   >> 1U))));
    bufp->fullBit(oldp+300,((1U & (IData)(vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0))));
    bufp->fullCData(oldp+301,(((((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r) 
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
    bufp->fullBit(oldp+302,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0));
    bufp->fullBit(oldp+303,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_overrun));
    bufp->fullBit(oldp+304,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2));
    bufp->fullBit(oldp+305,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3));
    bufp->fullBit(oldp+306,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4));
    bufp->fullBit(oldp+307,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5));
    bufp->fullBit(oldp+308,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6));
    bufp->fullBit(oldp+309,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7));
    bufp->fullBit(oldp+310,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0r));
    bufp->fullBit(oldp+311,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1r));
    bufp->fullBit(oldp+312,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2r));
    bufp->fullBit(oldp+313,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3r));
    bufp->fullBit(oldp+314,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4r));
    bufp->fullBit(oldp+315,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5r));
    bufp->fullBit(oldp+316,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6r));
    bufp->fullBit(oldp+317,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7r));
    bufp->fullBit(oldp+318,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__lsr_mask));
    bufp->fullBit(oldp+319,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int));
    bufp->fullBit(oldp+320,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int));
    bufp->fullBit(oldp+321,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int));
    bufp->fullBit(oldp+322,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int));
    bufp->fullBit(oldp+323,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int));
    bufp->fullBit(oldp+324,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__we));
    bufp->fullBit(oldp+325,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_pop));
    bufp->fullSData(oldp+326,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out) 
                                << 3U) | vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                               [vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom])),11);
    bufp->fullBit(oldp+327,((0U != (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                    [0U] | (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                            [1U] | 
                                            (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                                             [2U] | 
                                             (vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
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
    bufp->fullCData(oldp+328,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rf_count),5);
    bufp->fullCData(oldp+329,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tf_count),5);
    bufp->fullCData(oldp+330,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate),3);
    bufp->fullCData(oldp+331,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rstate),4);
    bufp->fullSData(oldp+332,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__counter_t),10);
    bufp->fullBit(oldp+333,((1U & (~ (0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt))))));
    bufp->fullCData(oldp+334,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_cnt),8);
    bufp->fullCData(oldp+335,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__block_value),8);
    bufp->fullBit(oldp+336,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)) 
                                   | ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__tstate)) 
                                      & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error)) 
                                         | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error) 
                                            & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0))))))));
    bufp->fullBit(oldp+337,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT____VdfgRegularize_h6d58cdb3_0_0) 
                             & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode) 
                                & (2U == (3U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg)))))));
    bufp->fullBit(oldp+338,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__serial_out));
    bufp->fullBit(oldp+339,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__srx_pad_i));
    bufp->fullBit(oldp+340,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__we));
    bufp->fullBit(oldp+341,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr_mask_condition));
    bufp->fullBit(oldp+342,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__iir_read));
    bufp->fullBit(oldp+343,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__msr_read));
    bufp->fullBit(oldp+344,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__fifo_read));
    bufp->fullCData(oldp+345,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__delayed_modem_signals),4);
    bufp->fullBit(oldp+346,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr0_d));
    bufp->fullBit(oldp+347,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr1_d));
    bufp->fullBit(oldp+348,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr2_d));
    bufp->fullBit(oldp+349,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr3_d));
    bufp->fullBit(oldp+350,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr4_d));
    bufp->fullBit(oldp+351,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr5_d));
    bufp->fullBit(oldp+352,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr6_d));
    bufp->fullBit(oldp+353,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__lsr7_d));
    bufp->fullSData(oldp+354,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt),9);
    bufp->fullSData(oldp+355,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next),9);
    bufp->fullBit(oldp+356,((1U & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_cnt) 
                                    ^ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__M_next)) 
                                   >> 8U))));
    bufp->fullBit(oldp+357,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d));
    bufp->fullBit(oldp+358,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d));
    bufp->fullBit(oldp+359,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d));
    bufp->fullBit(oldp+360,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d));
    bufp->fullBit(oldp+361,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d));
    bufp->fullBit(oldp+362,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_d)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int))));
    bufp->fullBit(oldp+363,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_d)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int))));
    bufp->fullBit(oldp+364,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_d)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int))));
    bufp->fullBit(oldp+365,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_d)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int))));
    bufp->fullBit(oldp+366,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_d)) 
                             & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int))));
    bufp->fullBit(oldp+367,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rls_int_pnd));
    bufp->fullBit(oldp+368,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rda_int_pnd));
    bufp->fullBit(oldp+369,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__thre_int_pnd));
    bufp->fullBit(oldp+370,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ms_int_pnd));
    bufp->fullBit(oldp+371,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__ti_int_pnd));
    bufp->fullBit(oldp+372,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__d1_fifo_read));
    bufp->fullBit(oldp+373,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__i_uart_sync_flops__DOT__flop_0));
    bufp->fullBit(oldp+374,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____Vcellinp__receiver__enable));
    bufp->fullCData(oldp+375,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16),4);
    bufp->fullCData(oldp+376,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_counter),3);
    bufp->fullCData(oldp+377,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rshift),8);
    bufp->fullBit(oldp+378,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity));
    bufp->fullBit(oldp+379,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_error));
    bufp->fullBit(oldp+380,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rframing_error));
    bufp->fullBit(oldp+381,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rbit_in));
    bufp->fullBit(oldp+382,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rparity_xor));
    bufp->fullCData(oldp+383,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b),8);
    bufp->fullBit(oldp+384,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push_q));
    bufp->fullSData(oldp+385,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in),11);
    bufp->fullBit(oldp+386,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_push));
    bufp->fullBit(oldp+387,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__counter_b))));
    bufp->fullBit(oldp+388,((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
    bufp->fullBit(oldp+389,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
    bufp->fullBit(oldp+390,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16))));
    bufp->fullCData(oldp+391,((0x0000000fU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rcounter16) 
                                              - (IData)(1U)))),4);
    bufp->fullSData(oldp+392,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value),10);
    bufp->fullCData(oldp+393,((0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__toc_value) 
                                              >> 2U))),8);
    bufp->fullCData(oldp+394,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__data8_out),8);
    bufp->fullCData(oldp+395,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[0]),3);
    bufp->fullCData(oldp+396,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[1]),3);
    bufp->fullCData(oldp+397,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[2]),3);
    bufp->fullCData(oldp+398,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[3]),3);
    bufp->fullCData(oldp+399,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[4]),3);
    bufp->fullCData(oldp+400,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[5]),3);
    bufp->fullCData(oldp+401,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[6]),3);
    bufp->fullCData(oldp+402,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[7]),3);
    bufp->fullCData(oldp+403,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[8]),3);
    bufp->fullCData(oldp+404,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[9]),3);
    bufp->fullCData(oldp+405,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[10]),3);
    bufp->fullCData(oldp+406,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[11]),3);
    bufp->fullCData(oldp+407,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[12]),3);
    bufp->fullCData(oldp+408,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[13]),3);
    bufp->fullCData(oldp+409,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[14]),3);
    bufp->fullCData(oldp+410,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo[15]),3);
    bufp->fullCData(oldp+411,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top),4);
    bufp->fullCData(oldp+412,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__bottom),4);
    bufp->fullCData(oldp+413,((0x0000000fU & ((IData)(1U) 
                                              + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__top)))),4);
    bufp->fullCData(oldp+414,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0U]),3);
    bufp->fullCData(oldp+415,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [1U]),3);
    bufp->fullCData(oldp+416,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [2U]),3);
    bufp->fullCData(oldp+417,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [3U]),3);
    bufp->fullCData(oldp+418,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [4U]),3);
    bufp->fullCData(oldp+419,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [5U]),3);
    bufp->fullCData(oldp+420,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [6U]),3);
    bufp->fullCData(oldp+421,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [7U]),3);
    bufp->fullCData(oldp+422,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [8U]),3);
    bufp->fullCData(oldp+423,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [9U]),3);
    bufp->fullCData(oldp+424,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0x0aU]),3);
    bufp->fullCData(oldp+425,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0x0bU]),3);
    bufp->fullCData(oldp+426,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0x0cU]),3);
    bufp->fullCData(oldp+427,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0x0dU]),3);
    bufp->fullCData(oldp+428,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0x0eU]),3);
    bufp->fullCData(oldp+429,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__fifo
                              [0x0fU]),3);
    bufp->fullCData(oldp+430,((0x000000ffU & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__rf_data_in) 
                                              >> 3U))),8);
    bufp->fullCData(oldp+431,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[0]),8);
    bufp->fullCData(oldp+432,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[1]),8);
    bufp->fullCData(oldp+433,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[2]),8);
    bufp->fullCData(oldp+434,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[3]),8);
    bufp->fullCData(oldp+435,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[4]),8);
    bufp->fullCData(oldp+436,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[5]),8);
    bufp->fullCData(oldp+437,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[6]),8);
    bufp->fullCData(oldp+438,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[7]),8);
    bufp->fullCData(oldp+439,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[8]),8);
    bufp->fullCData(oldp+440,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[9]),8);
    bufp->fullCData(oldp+441,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[10]),8);
    bufp->fullCData(oldp+442,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[11]),8);
    bufp->fullCData(oldp+443,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[12]),8);
    bufp->fullCData(oldp+444,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[13]),8);
    bufp->fullCData(oldp+445,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[14]),8);
    bufp->fullCData(oldp+446,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__receiver__DOT__fifo_rx__DOT__rfifo__DOT__ram[15]),8);
    bufp->fullBit(oldp+447,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__enable) 
                             & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT____VdfgRegularize_hf5566834_0_0) 
                                | ((~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__mode_reg) 
                                       >> 2U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode))))));
    bufp->fullCData(oldp+448,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__counter),5);
    bufp->fullCData(oldp+449,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_counter),3);
    bufp->fullCData(oldp+450,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__shift_out),7);
    bufp->fullBit(oldp+451,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__stx_o_tmp));
    bufp->fullBit(oldp+452,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__parity_xor));
    bufp->fullBit(oldp+453,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_pop));
    bufp->fullBit(oldp+454,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__bit_out));
    bufp->fullBit(oldp+455,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tx_error));
    bufp->fullCData(oldp+456,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__error_time),3);
    bufp->fullCData(oldp+457,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_out),8);
    bufp->fullBit(oldp+458,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_overrun));
    bufp->fullCData(oldp+459,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__tf_data_bak),8);
    bufp->fullCData(oldp+460,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top),4);
    bufp->fullCData(oldp+461,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__bottom),4);
    bufp->fullCData(oldp+462,((0x0000000fU & ((IData)(1U) 
                                              + (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__top)))),4);
    bufp->fullCData(oldp+463,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[0]),8);
    bufp->fullCData(oldp+464,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[1]),8);
    bufp->fullCData(oldp+465,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[2]),8);
    bufp->fullCData(oldp+466,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[3]),8);
    bufp->fullCData(oldp+467,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[4]),8);
    bufp->fullCData(oldp+468,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[5]),8);
    bufp->fullCData(oldp+469,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[6]),8);
    bufp->fullCData(oldp+470,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[7]),8);
    bufp->fullCData(oldp+471,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[8]),8);
    bufp->fullCData(oldp+472,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[9]),8);
    bufp->fullCData(oldp+473,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[10]),8);
    bufp->fullCData(oldp+474,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[11]),8);
    bufp->fullCData(oldp+475,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[12]),8);
    bufp->fullCData(oldp+476,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[13]),8);
    bufp->fullCData(oldp+477,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[14]),8);
    bufp->fullCData(oldp+478,(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__transmitter__DOT__fifo_tx__DOT__tfifo__DOT__ram[15]),8);
    bufp->fullCData(oldp+479,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_s_hit),5);
    bufp->fullCData(oldp+480,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_hit),5);
    bufp->fullCData(oldp+481,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_s_hit),5);
    bufp->fullCData(oldp+482,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_awready),5);
    bufp->fullCData(oldp+483,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_wready),5);
    bufp->fullCData(oldp+484,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid),5);
    bufp->fullCData(oldp+485,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_arready),5);
    bufp->fullCData(oldp+486,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rlast),5);
    bufp->fullCData(oldp+487,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid),5);
    bufp->fullCData(oldp+488,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[0]),4);
    bufp->fullCData(oldp+489,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[1]),4);
    bufp->fullCData(oldp+490,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[2]),4);
    bufp->fullCData(oldp+491,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[3]),4);
    bufp->fullCData(oldp+492,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bid[4]),4);
    bufp->fullCData(oldp+493,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[0]),4);
    bufp->fullCData(oldp+494,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[1]),4);
    bufp->fullCData(oldp+495,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[2]),4);
    bufp->fullCData(oldp+496,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[3]),4);
    bufp->fullCData(oldp+497,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rid[4]),4);
    bufp->fullCData(oldp+498,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_0),3);
    bufp->fullCData(oldp+499,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_sel_group_1),3);
    bufp->fullCData(oldp+500,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__bvalid_group_0),3);
    bufp->fullCData(oldp+501,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_bvalid) 
                                     >> 3U))),3);
    bufp->fullCData(oldp+502,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__apb_s_rvalid) 
                                << 2U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rvalid))),3);
    bufp->fullCData(oldp+503,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__s_rvalid) 
                                     >> 3U))),3);
    bufp->fullBit(oldp+504,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_empty));
    bufp->fullBit(oldp+505,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo_full));
    bufp->fullBit(oldp+506,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_empty));
    bufp->fullBit(oldp+507,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo_full));
    bufp->fullCData(oldp+508,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_data_dir),3);
    bufp->fullCData(oldp+509,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_pre_sel),3);
    bufp->fullBit(oldp+510,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_prog));
    bufp->fullCData(oldp+511,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel_reg),3);
    bufp->fullCData(oldp+512,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_resp_sel),3);
    bufp->fullCData(oldp+513,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_sel),3);
    bufp->fullCData(oldp+514,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir),3);
    bufp->fullCData(oldp+515,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_data_pre_sel),3);
    bufp->fullBit(oldp+516,((1U & (~ ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT____VdfgRegularize_h9b44d7d4_0_3) 
                                      | (0x1fe0U == 
                                         (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_araddr 
                                          >> 0x00000010U)))))));
    bufp->fullIData(oldp+517,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_addr_dir_int),32);
    bufp->fullCData(oldp+518,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[0]),3);
    bufp->fullCData(oldp+519,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__fifo_ram[1]),3);
    bufp->fullCData(oldp+520,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr),2);
    bufp->fullCData(oldp+521,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr),2);
    bufp->fullBit(oldp+522,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__wr_ptr))));
    bufp->fullBit(oldp+523,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__rd_ptr))));
    bufp->fullIData(oldp+524,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__rd_fifo__DOT__i),32);
    bufp->fullCData(oldp+525,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[0]),3);
    bufp->fullCData(oldp+526,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__fifo_ram[1]),3);
    bufp->fullCData(oldp+527,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr),2);
    bufp->fullCData(oldp+528,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr),2);
    bufp->fullBit(oldp+529,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__wr_ptr))));
    bufp->fullBit(oldp+530,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__rd_ptr))));
    bufp->fullIData(oldp+531,(vlSelfRef.simu_top__DOT__soc__DOT__AXI_SLAVE_MUX__DOT__wr_fifo__DOT__i),32);
    bufp->fullQData(oldp+532,((((QData)((IData)((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst) 
                                                  << 7U) 
                                                 | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize) 
                                                     << 4U) 
                                                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen))))) 
                                << 0x00000024U) | (
                                                   ((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)) 
                                                    << 4U) 
                                                   | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid))))),45);
    bufp->fullIData(oldp+534,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                >> 2U)) 
                                << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))),32);
    bufp->fullIData(oldp+535,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                               | (((- (IData)((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                   & ((((IData)(1U) 
                                        + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                           >> 2U)) 
                                       << 2U) | (3U 
                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))) 
                                  | ((- (IData)((2U 
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
                                           | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr))))))),32);
    bufp->fullIData(oldp+536,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr) 
                               | ((0x0000003cU & ((
                                                   ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                    & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                       >> 2U)) 
                                                   | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen) 
                                                      & ((IData)(1U) 
                                                         + 
                                                         (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr 
                                                          >> 2U)))) 
                                                  << 2U)) 
                                  | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_araddr)))),32);
    bufp->fullCData(oldp+537,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst),2);
    bufp->fullBit(oldp+538,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
    bufp->fullBit(oldp+539,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
    bufp->fullBit(oldp+540,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arburst))));
    bufp->fullCData(oldp+541,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arid),4);
    bufp->fullCData(oldp+542,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen),4);
    bufp->fullBit(oldp+543,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arlen_last));
    bufp->fullCData(oldp+544,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_data_arsize),3);
    bufp->fullBit(oldp+545,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_valid));
    bufp->fullQData(oldp+546,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_push_data),45);
    bufp->fullQData(oldp+548,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas),45);
    bufp->fullIData(oldp+550,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                       >> 0x0000000dU))),32);
    bufp->fullCData(oldp+551,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                             >> 0x0000000bU)))),2);
    bufp->fullCData(oldp+552,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas))),4);
    bufp->fullCData(oldp+553,((0x0000000fU & (IData)(
                                                     (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                                      >> 4U)))),4);
    bufp->fullCData(oldp+554,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_queue_datas 
                                             >> 8U)))),3);
    bufp->fullBit(oldp+555,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_valid));
    bufp->fullCData(oldp+556,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_rcur),4);
    bufp->fullQData(oldp+557,((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                << 0x0000000dU) | (QData)((IData)(
                                                                  ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst) 
                                                                     << 0x0000000bU) 
                                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize) 
                                                                       << 8U)) 
                                                                   | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                                       << 4U) 
                                                                      | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid))))))),45);
    bufp->fullIData(oldp+559,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                >> 2U)) 
                                << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))),32);
    bufp->fullIData(oldp+560,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                               | (((- (IData)((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                   & ((((IData)(1U) 
                                        + (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                           >> 2U)) 
                                       << 2U) | (3U 
                                                 & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))) 
                                  | ((- (IData)((2U 
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
                                           | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr))))))),32);
    bufp->fullIData(oldp+561,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr) 
                               | ((0x0000003cU & ((
                                                   ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                    & (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                       >> 2U)) 
                                                   | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen) 
                                                      & ((IData)(1U) 
                                                         + 
                                                         (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr 
                                                          >> 2U)))) 
                                                  << 2U)) 
                                  | (3U & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
    bufp->fullCData(oldp+562,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst),2);
    bufp->fullBit(oldp+563,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
    bufp->fullBit(oldp+564,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
    bufp->fullBit(oldp+565,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awburst))));
    bufp->fullCData(oldp+566,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awid),4);
    bufp->fullCData(oldp+567,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awlen),4);
    bufp->fullCData(oldp+568,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_data_awsize),3);
    bufp->fullBit(oldp+569,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_valid));
    bufp->fullBit(oldp+570,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_push));
    bufp->fullQData(oldp+571,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas),45);
    bufp->fullIData(oldp+573,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                       >> 0x0000000dU))),32);
    bufp->fullCData(oldp+574,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                             >> 0x0000000bU)))),2);
    bufp->fullCData(oldp+575,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas))),4);
    bufp->fullCData(oldp+576,((0x0000000fU & (IData)(
                                                     (vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                                      >> 4U)))),4);
    bufp->fullCData(oldp+577,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_queue_datas 
                                             >> 8U)))),3);
    bufp->fullBit(oldp+578,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_a_valid));
    bufp->fullBit(oldp+579,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_allow_out));
    bufp->fullBit(oldp+580,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid));
    bufp->fullCData(oldp+581,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_datas),4);
    bufp->fullBit(oldp+582,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_b_queue_valid)))));
    bufp->fullBit(oldp+583,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_go));
    bufp->fullCData(oldp+584,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wstrb),4);
    bufp->fullBit(oldp+585,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wlast));
    bufp->fullBit(oldp+586,(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wvalid));
    bufp->fullIData(oldp+587,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr0),32);
    bufp->fullIData(oldp+588,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr1),32);
    bufp->fullIData(oldp+589,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr2),32);
    bufp->fullIData(oldp+590,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr3),32);
    bufp->fullIData(oldp+591,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr4),32);
    bufp->fullIData(oldp+592,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr5),32);
    bufp->fullIData(oldp+593,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr6),32);
    bufp->fullIData(oldp+594,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__cr7),32);
    bufp->fullIData(oldp+595,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_data),32);
    bufp->fullIData(oldp+596,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg0_data),32);
    bufp->fullIData(oldp+597,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__led_rg1_data),32);
    bufp->fullIData(oldp+598,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_data),32);
    bufp->fullIData(oldp+599,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),32);
    bufp->fullIData(oldp+600,(((2U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                      << 1U)) | (1U 
                                                 & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))))),32);
    bufp->fullCData(oldp+601,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_data),8);
    bufp->fullBit(oldp+602,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__confreg_uart_valid));
    bufp->fullIData(oldp+603,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r2),32);
    bufp->fullIData(oldp+604,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__simu_flag),32);
    bufp->fullIData(oldp+605,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__io_simu),32);
    bufp->fullCData(oldp+606,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__virtual_uart_data),8);
    bufp->fullBit(oldp+607,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__open_trace));
    bufp->fullBit(oldp+608,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__num_monitor));
    bufp->fullBit(oldp+609,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin));
    bufp->fullBit(oldp+610,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r1));
    bufp->fullBit(oldp+611,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r2));
    bufp->fullBit(oldp+612,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_begin_r3));
    bufp->fullBit(oldp+613,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r1));
    bufp->fullBit(oldp+614,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__write_timer_end_r2));
    bufp->fullIData(oldp+615,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r),32);
    bufp->fullIData(oldp+616,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r1),32);
    bufp->fullIData(oldp+617,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__conf_wdata_r2),32);
    bufp->fullIData(oldp+618,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer_r1),32);
    bufp->fullIData(oldp+619,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__timer),32);
    bufp->fullCData(oldp+620,((0x000000ffU & vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_w_wdata)),8);
    bufp->fullSData(oldp+621,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_key_r),16);
    bufp->fullCData(oldp+622,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state),3);
    bufp->fullBit(oldp+623,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_flag));
    bufp->fullIData(oldp+624,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count),20);
    bufp->fullCData(oldp+625,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state_count),4);
    bufp->fullBit(oldp+626,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__key_count 
                                   >> 0x00000013U))));
    bufp->fullBit(oldp+627,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r));
    bufp->fullBit(oldp+628,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r));
    bufp->fullBit(oldp+629,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_flag));
    bufp->fullIData(oldp+630,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count),20);
    bufp->fullBit(oldp+631,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step0_count 
                                   >> 0x00000013U))));
    bufp->fullBit(oldp+632,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_flag));
    bufp->fullIData(oldp+633,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count),20);
    bufp->fullBit(oldp+634,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__step1_count 
                                   >> 0x00000013U))));
    bufp->fullIData(oldp+635,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__count),20);
    bufp->fullCData(oldp+636,(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__scan_data),4);
    bufp->fullCData(oldp+637,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_out_ar_data_arlen),8);
    bufp->fullIData(oldp+638,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr
                                         : 0U))),32);
    bufp->fullCData(oldp+639,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0x0fU : 0U))),8);
    bufp->fullCData(oldp+640,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 2U : 0U))),3);
    bufp->fullCData(oldp+641,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid),2);
    bufp->fullBit(oldp+642,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                             & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))))));
    bufp->fullIData(oldp+643,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg),32);
    bufp->fullBit(oldp+644,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_req_valid));
    VL_SHIFTR_WWI(512,512,10, __Vtemp_1, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                  (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                               (0x0000000fU 
                                                & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U)), 5U)));
    bufp->fullIData(oldp+645,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                ? __Vtemp_1[0U] : 0U)),32);
    VL_SHIFTR_WWI(512,512,10, __Vtemp_2, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                  (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                               (0x0000000fU 
                                                & ((IData)(1U) 
                                                   + 
                                                   (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                    >> 2U))), 5U)));
    bufp->fullIData(oldp+646,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                ? __Vtemp_2[0U] : 0U)),32);
    VL_SHIFTR_WWI(512,512,10, __Vtemp_3, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                  (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                               (0x0000000fU 
                                                & ((IData)(2U) 
                                                   + 
                                                   (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                    >> 2U))), 5U)));
    bufp->fullIData(oldp+647,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                ? __Vtemp_3[0U] : 0U)),32);
    VL_SHIFTR_WWI(512,512,10, __Vtemp_4, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                  (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                               (0x0000000fU 
                                                & ((IData)(3U) 
                                                   + 
                                                   (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                    >> 2U))), 5U)));
    bufp->fullIData(oldp+648,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                ? __Vtemp_4[0U] : 0U)),32);
    bufp->fullIData(oldp+649,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid)
                                ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr
                                : 0U)),32);
    bufp->fullBit(oldp+650,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid));
    bufp->fullBit(oldp+651,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__io_icache_resp_valid) 
                             & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state)))));
    bufp->fullBit(oldp+652,((0x0000000000000324ULL 
                             == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__reg_)));
    bufp->fullQData(oldp+653,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__reg_),64);
    bufp->fullCData(oldp+655,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_rid) 
                                     >> 2U))),2);
    bufp->fullBit(oldp+656,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__aw_master_valid));
    bufp->fullCData(oldp+657,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__m0_bid) 
                                     >> 2U))),2);
    bufp->fullBit(oldp+658,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__axi_crossbar__DOT__io_in_icache_ar_data_arvalid)))));
    bufp->fullBit(oldp+659,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_valid));
    bufp->fullQData(oldp+660,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_pc),64);
    bufp->fullIData(oldp+662,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cmt_inst),32);
    bufp->fullQData(oldp+663,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__cycleCnt),64);
    bufp->fullQData(oldp+665,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__difftest__DOT__instrCnt),64);
    bufp->fullBit(oldp+667,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_valid));
    bufp->fullCData(oldp+668,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__fetch_state),2);
    bufp->fullBit(oldp+669,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid));
    bufp->fullCData(oldp+670,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_idx),8);
    bufp->fullBit(oldp+671,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                             & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
    bufp->fullIData(oldp+672,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                : 0U)),18);
    bufp->fullBit(oldp+673,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                             & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
    bufp->fullIData(oldp+674,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                : 0U)),18);
    bufp->fullBit(oldp+675,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                             & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
    bufp->fullIData(oldp+676,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                : 0U)),18);
    bufp->fullBit(oldp+677,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                             & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0])));
    bufp->fullIData(oldp+678,(((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
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
    bufp->fullWData(oldp+679,(__Vtemp_5),512);
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
    bufp->fullWData(oldp+695,(__Vtemp_6),512);
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
    bufp->fullWData(oldp+711,(__Vtemp_7),512);
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
    bufp->fullWData(oldp+727,(__Vtemp_8),512);
    bufp->fullBit(oldp+743,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_req_valid));
    bufp->fullIData(oldp+744,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_addr),32);
    bufp->fullIData(oldp+745,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag),18);
    bufp->fullCData(oldp+746,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__victimRespReg),2);
    bufp->fullBit(oldp+747,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_miss_resp_valid));
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
    bufp->fullWData(oldp+748,(__Vtemp_18),512);
    bufp->fullCData(oldp+764,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0U : ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                    ? (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx)
                                                    : 0U)))))),8);
    bufp->fullIData(oldp+765,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0U : ((2U 
                                                  == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                  ? 0U
                                                  : 
                                                 ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)))))),18);
    bufp->fullBit(oldp+766,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_valid));
    bufp->fullCData(oldp+767,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way),2);
    bufp->fullBit(oldp+768,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_valid));
    bufp->fullCData(oldp+769,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_idx),8);
    bufp->fullCData(oldp+770,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way),2);
    bufp->fullBit(oldp+771,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                             & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
    bufp->fullIData(oldp+772,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0U : ((2U 
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
                                                   : 0U))))),18);
    bufp->fullBit(oldp+773,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                             & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
    bufp->fullIData(oldp+774,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0U : ((2U 
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
                                                   : 0U))))),18);
    bufp->fullBit(oldp+775,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                             & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
    bufp->fullIData(oldp+776,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0U : ((2U 
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
                                                   : 0U))))),18);
    bufp->fullBit(oldp+777,(((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                             & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                   & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                      & (3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))));
    bufp->fullIData(oldp+778,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                         ? 0U : ((2U 
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
                                                   : 0U))))),18);
    bufp->fullWData(oldp+779,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_data_write_data),512);
    bufp->fullBit(oldp+795,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_en_pipe_0));
    bufp->fullCData(oldp+796,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0),8);
    bufp->fullWData(oldp+797,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_MPORT_addr_pipe_0]),512);
    bufp->fullBit(oldp+813,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0_current_data_en_pipe_0));
    bufp->fullWData(oldp+814,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_0
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
    bufp->fullWData(oldp+830,(__Vtemp_20),512);
    bufp->fullBit(oldp+846,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_en_pipe_0));
    bufp->fullCData(oldp+847,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0),8);
    bufp->fullWData(oldp+848,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_MPORT_addr_pipe_0]),512);
    bufp->fullBit(oldp+864,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1_current_data_en_pipe_0));
    bufp->fullWData(oldp+865,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_1
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
    bufp->fullWData(oldp+881,(__Vtemp_22),512);
    bufp->fullBit(oldp+897,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_en_pipe_0));
    bufp->fullCData(oldp+898,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0),8);
    bufp->fullWData(oldp+899,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_MPORT_addr_pipe_0]),512);
    bufp->fullBit(oldp+915,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2_current_data_en_pipe_0));
    bufp->fullWData(oldp+916,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_2
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
    bufp->fullWData(oldp+932,(__Vtemp_24),512);
    bufp->fullBit(oldp+948,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_en_pipe_0));
    bufp->fullCData(oldp+949,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0),8);
    bufp->fullWData(oldp+950,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_MPORT_addr_pipe_0]),512);
    bufp->fullBit(oldp+966,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3_current_data_en_pipe_0));
    bufp->fullWData(oldp+967,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__dataArray__DOT__dataArray_3
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
    bufp->fullWData(oldp+983,(__Vtemp_26),512);
    bufp->fullBit(oldp+999,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_valid));
    bufp->fullIData(oldp+1000,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s0_addr),32);
    bufp->fullCData(oldp+1001,((0x000000ffU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg 
                                               >> 6U))),8);
    bufp->fullIData(oldp+1002,((vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__fetch_unit__DOT__pc_reg 
                                >> 0x0000000eU)),18);
    bufp->fullBit(oldp+1003,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_valid));
    bufp->fullIData(oldp+1004,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr),32);
    bufp->fullBit(oldp+1005,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_hit));
    bufp->fullWData(oldp+1006,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data),512);
    bufp->fullBit(oldp+1022,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                               & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                              & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
    bufp->fullBit(oldp+1023,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                               & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                              & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
    bufp->fullBit(oldp+1024,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                               & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                              & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
    bufp->fullBit(oldp+1025,((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid) 
                               & vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]) 
                              & (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_valid)
                                   ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                  [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]
                                   : 0U) == vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_tag))));
    bufp->fullBit(oldp+1026,((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T))));
    bufp->fullCData(oldp+1027,((3U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT___s1_hit_T) 
                                      >> 2U))),2);
    bufp->fullCData(oldp+1028,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s1_hit_way_lo_1),2);
    bufp->fullCData(oldp+1029,((0x0000000fU & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                               >> 2U))),4);
    bufp->fullSData(oldp+1030,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                                            (0x0000000fU 
                                                             & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                                >> 2U)), 5U))),10);
    VL_SHIFTR_WWI(512,512,10, __Vtemp_27, vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_data, 
                  (0x000003ffU & VL_SHIFTL_III(10,10,32, 
                                               (0x0000000fU 
                                                & (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                   >> 2U)), 5U)));
    bufp->fullWData(oldp+1031,(__Vtemp_27),512);
    bufp->fullCData(oldp+1047,((0x0000000fU & ((IData)(1U) 
                                               + (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                  >> 2U)))),4);
    bufp->fullSData(oldp+1048,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
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
    bufp->fullWData(oldp+1049,(__Vtemp_28),512);
    bufp->fullCData(oldp+1065,((0x0000000fU & ((IData)(2U) 
                                               + (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                  >> 2U)))),4);
    bufp->fullSData(oldp+1066,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
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
    bufp->fullWData(oldp+1067,(__Vtemp_29),512);
    bufp->fullCData(oldp+1083,((0x0000000fU & ((IData)(3U) 
                                               + (vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe__DOT__s2_addr 
                                                  >> 2U)))),4);
    bufp->fullSData(oldp+1084,((0x000003ffU & VL_SHIFTL_III(10,10,32, 
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
    bufp->fullWData(oldp+1085,(__Vtemp_30),512);
    bufp->fullBit(oldp+1101,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_en_pipe_0));
    bufp->fullCData(oldp+1102,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0),8);
    bufp->fullBit(oldp+1103,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
    bufp->fullBit(oldp+1104,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_en_pipe_0));
    bufp->fullBit(oldp+1105,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0]));
    bufp->fullBit(oldp+1106,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                               ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                  & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                               : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_current_data_addr_pipe_0])));
    bufp->fullBit(oldp+1107,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_MPORT_en_pipe_0));
    bufp->fullIData(oldp+1108,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
    bufp->fullBit(oldp+1109,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_en_pipe_0));
    bufp->fullIData(oldp+1110,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0]),18);
    bufp->fullIData(oldp+1111,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                 ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                     ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                 : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_tag_current_data_addr_pipe_0])),18);
    bufp->fullBit(oldp+1112,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_MPORT_en_pipe_0));
    bufp->fullBit(oldp+1113,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
    bufp->fullBit(oldp+1114,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_en_pipe_0));
    bufp->fullBit(oldp+1115,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0]));
    bufp->fullBit(oldp+1116,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                               ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                  & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & (1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                               : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_valid_current_data_addr_pipe_0])));
    bufp->fullBit(oldp+1117,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_MPORT_en_pipe_0));
    bufp->fullIData(oldp+1118,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
    bufp->fullBit(oldp+1119,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_en_pipe_0));
    bufp->fullIData(oldp+1120,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0]),18);
    bufp->fullIData(oldp+1121,(((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                 ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                     ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((1U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                 : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_1_tag_current_data_addr_pipe_0])),18);
    bufp->fullBit(oldp+1122,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_MPORT_en_pipe_0));
    bufp->fullBit(oldp+1123,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
    bufp->fullBit(oldp+1124,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_en_pipe_0));
    bufp->fullBit(oldp+1125,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0]));
    bufp->fullBit(oldp+1126,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                               ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                  & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & (2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                               : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_valid_current_data_addr_pipe_0])));
    bufp->fullBit(oldp+1127,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_MPORT_en_pipe_0));
    bufp->fullIData(oldp+1128,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
    bufp->fullBit(oldp+1129,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_en_pipe_0));
    bufp->fullIData(oldp+1130,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0]),18);
    bufp->fullIData(oldp+1131,(((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                 ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                     ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((2U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                 : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_2_tag_current_data_addr_pipe_0])),18);
    bufp->fullBit(oldp+1132,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_MPORT_en_pipe_0));
    bufp->fullBit(oldp+1133,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]));
    bufp->fullBit(oldp+1134,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_en_pipe_0));
    bufp->fullBit(oldp+1135,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                             [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0]));
    bufp->fullBit(oldp+1136,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                               ? ((0U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                  & ((1U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                     & ((2U != (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                        & ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state)) 
                                           & (3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))))))
                               : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid
                              [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_valid_current_data_addr_pipe_0])));
    bufp->fullBit(oldp+1137,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_MPORT_en_pipe_0));
    bufp->fullIData(oldp+1138,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_0_valid_MPORT_addr_pipe_0]),18);
    bufp->fullBit(oldp+1139,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_en_pipe_0));
    bufp->fullIData(oldp+1140,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                               [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0]),18);
    bufp->fullIData(oldp+1141,(((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit_io_meta_write_way))
                                 ? ((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                     ? 0U : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                              ? 0U : 
                                             ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state))
                                                   ? 
                                                  ((3U 
                                                    == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way))
                                                    ? vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag
                                                    : 0U)
                                                   : 0U))))
                                 : vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag
                                [vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__metaArray__DOT__metaArray_3_tag_current_data_addr_pipe_0])),18);
    bufp->fullCData(oldp+1142,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__state),3);
    bufp->fullIData(oldp+1143,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_addr),32);
    bufp->fullCData(oldp+1144,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_idx),8);
    bufp->fullIData(oldp+1145,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_tag),18);
    bufp->fullCData(oldp+1146,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__req_victim_way),2);
    bufp->fullIData(oldp+1147,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0),32);
    bufp->fullIData(oldp+1148,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1),32);
    bufp->fullIData(oldp+1149,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2),32);
    bufp->fullIData(oldp+1150,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3),32);
    bufp->fullIData(oldp+1151,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4),32);
    bufp->fullIData(oldp+1152,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5),32);
    bufp->fullIData(oldp+1153,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6),32);
    bufp->fullIData(oldp+1154,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7),32);
    bufp->fullIData(oldp+1155,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_8),32);
    bufp->fullIData(oldp+1156,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_9),32);
    bufp->fullIData(oldp+1157,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_10),32);
    bufp->fullIData(oldp+1158,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_11),32);
    bufp->fullIData(oldp+1159,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_12),32);
    bufp->fullIData(oldp+1160,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_13),32);
    bufp->fullIData(oldp+1161,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_14),32);
    bufp->fullIData(oldp+1162,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_15),32);
    bufp->fullCData(oldp+1163,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_count),5);
    __Vtemp_36[0U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_0;
    __Vtemp_36[1U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_1;
    __Vtemp_36[2U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_2;
    __Vtemp_36[3U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_3;
    __Vtemp_36[4U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_4;
    __Vtemp_36[5U] = vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_5;
    __Vtemp_36[6U] = (IData)((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7)) 
                               << 0x00000020U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6))));
    __Vtemp_36[7U] = (IData)(((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_7)) 
                                << 0x00000020U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__missUnit__DOT__data_buffer_6))) 
                              >> 0x00000020U));
    bufp->fullWData(oldp+1164,(__Vtemp_36),256);
    bufp->fullBit(oldp+1172,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_en_pipe_0));
    bufp->fullCData(oldp+1173,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_addr_pipe_0),8);
    bufp->fullCData(oldp+1174,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data),3);
    bufp->fullBit(oldp+1175,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_en_pipe_0));
    bufp->fullCData(oldp+1176,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_addr_pipe_0),8);
    bufp->fullCData(oldp+1177,(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data),3);
    bufp->fullCData(oldp+1178,(((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                 ? (6U | (1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data) 
                                                >> 2U)))
                                 : ((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                     ? (4U | (1U & 
                                              ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data) 
                                               >> 2U)))
                                     : ((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                         ? (1U | (2U 
                                                  & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data)))
                                         : ((3U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__mainPipe_io_replacer_touch_way))
                                             ? (2U 
                                                & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_data))
                                             : 0U))))),3);
    bufp->fullBit(oldp+1179,((1U & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data))));
    bufp->fullBit(oldp+1180,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data) 
                                    >> 1U))));
    bufp->fullBit(oldp+1181,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__cpu__DOT__icache__DOT__replacer__DOT__plruTree_currentPLRU_1_data) 
                                    >> 2U))));
    bufp->fullBit(oldp+1182,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable)))));
    bufp->fullBit(oldp+1183,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_ar_disable));
    bufp->fullBit(oldp+1184,((1U & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random)));
    bufp->fullBit(oldp+1185,((1U & ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                     >> 1U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable)))));
    bufp->fullBit(oldp+1186,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_aw_disable));
    bufp->fullBit(oldp+1187,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                    >> 1U))));
    bufp->fullBit(oldp+1188,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                    >> 2U))));
    bufp->fullBit(oldp+1189,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_no_delay));
    bufp->fullBit(oldp+1190,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                    >> 3U))));
    bufp->fullIData(oldp+1191,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random),23);
    bufp->fullIData(oldp+1192,(((0x007ffffeU & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                                << 1U)) 
                                | (1U & VL_REDXOR_32(
                                                     (0x00420000U 
                                                      & vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random))))),23);
    bufp->fullBit(oldp+1193,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_short_delay));
    bufp->fullBit(oldp+1194,((1U & ((vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                     >> 4U) | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable)))));
    bufp->fullBit(oldp+1195,(vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_w_disable));
    bufp->fullBit(oldp+1196,((1U & (vlSelfRef.simu_top__DOT__soc__DOT__delay__DOT__mask_random 
                                    >> 4U))));
    bufp->fullQData(oldp+1197,((((QData)((IData)((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst) 
                                                   << 7U) 
                                                  | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize) 
                                                      << 4U) 
                                                     | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen))))) 
                                 << 0x00000024U) | 
                                (((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)) 
                                  << 4U) | (QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid))))),45);
    bufp->fullIData(oldp+1199,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr),32);
    bufp->fullIData(oldp+1200,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                 >> 2U)) 
                                 << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))),32);
    bufp->fullIData(oldp+1201,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                 & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                | (((- (IData)((1U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst)))) 
                                    & ((((IData)(1U) 
                                         + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                            >> 2U)) 
                                        << 2U) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))) 
                                   | ((- (IData)((2U 
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
                                            | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr))))))),32);
    bufp->fullIData(oldp+1202,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr) 
                                | ((0x0000003cU & (
                                                   (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen)) 
                                                     & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                        >> 2U)) 
                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen) 
                                                       & ((IData)(1U) 
                                                          + 
                                                          (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr 
                                                           >> 2U)))) 
                                                   << 2U)) 
                                   | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_araddr)))),32);
    bufp->fullCData(oldp+1203,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst),2);
    bufp->fullBit(oldp+1204,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
    bufp->fullBit(oldp+1205,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
    bufp->fullBit(oldp+1206,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arburst))));
    bufp->fullCData(oldp+1207,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arid),4);
    bufp->fullCData(oldp+1208,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen),4);
    bufp->fullBit(oldp+1209,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arlen_last));
    bufp->fullCData(oldp+1210,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_data_arsize),3);
    bufp->fullBit(oldp+1211,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_valid));
    bufp->fullQData(oldp+1212,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas),45);
    bufp->fullIData(oldp+1214,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                        >> 0x0000000dU))),32);
    bufp->fullCData(oldp+1215,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                              >> 0x0000000bU)))),2);
    bufp->fullCData(oldp+1216,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas))),4);
    bufp->fullCData(oldp+1217,((0x0000000fU & (IData)(
                                                      (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                                       >> 4U)))),4);
    bufp->fullCData(oldp+1218,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_queue_datas 
                                              >> 8U)))),3);
    bufp->fullBit(oldp+1219,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_valid));
    bufp->fullCData(oldp+1220,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_rcur),4);
    bufp->fullQData(oldp+1221,((((QData)((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)) 
                                 << 0x0000000dU) | (QData)((IData)(
                                                                   ((((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst) 
                                                                      << 0x0000000bU) 
                                                                     | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize) 
                                                                        << 8U)) 
                                                                    | (((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                                        << 4U) 
                                                                       | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid))))))),45);
    bufp->fullIData(oldp+1223,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr),32);
    bufp->fullIData(oldp+1224,(((((IData)(1U) + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                 >> 2U)) 
                                 << 2U) | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))),32);
    bufp->fullIData(oldp+1225,((((- (IData)((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                 & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                | (((- (IData)((1U 
                                                == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst)))) 
                                    & ((((IData)(1U) 
                                         + (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                            >> 2U)) 
                                        << 2U) | (3U 
                                                  & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))) 
                                   | ((- (IData)((2U 
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
                                            | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr))))))),32);
    bufp->fullIData(oldp+1226,(((0xffffffc0U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr) 
                                | ((0x0000003cU & (
                                                   (((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen)) 
                                                     & (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                        >> 2U)) 
                                                    | ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen) 
                                                       & ((IData)(1U) 
                                                          + 
                                                          (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr 
                                                           >> 2U)))) 
                                                   << 2U)) 
                                   | (3U & vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awaddr)))),32);
    bufp->fullCData(oldp+1227,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst),2);
    bufp->fullBit(oldp+1228,((0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
    bufp->fullBit(oldp+1229,((1U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
    bufp->fullBit(oldp+1230,((2U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awburst))));
    bufp->fullCData(oldp+1231,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awid),4);
    bufp->fullCData(oldp+1232,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awlen),4);
    bufp->fullCData(oldp+1233,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_data_awsize),3);
    bufp->fullBit(oldp+1234,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_valid));
    bufp->fullBit(oldp+1235,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_push));
    bufp->fullQData(oldp+1236,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas),45);
    bufp->fullIData(oldp+1238,((IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                        >> 0x0000000dU))),32);
    bufp->fullCData(oldp+1239,((3U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                              >> 0x0000000bU)))),2);
    bufp->fullCData(oldp+1240,((0x0000000fU & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas))),4);
    bufp->fullCData(oldp+1241,((0x0000000fU & (IData)(
                                                      (vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                                       >> 4U)))),4);
    bufp->fullCData(oldp+1242,((7U & (IData)((vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_queue_datas 
                                              >> 8U)))),3);
    bufp->fullBit(oldp+1243,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_a_valid));
    bufp->fullBit(oldp+1244,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_allow_out));
    bufp->fullBit(oldp+1245,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid));
    bufp->fullCData(oldp+1246,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_datas),4);
    bufp->fullBit(oldp+1247,((1U & (~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_b_queue_valid)))));
    bufp->fullBit(oldp+1248,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_go));
    bufp->fullCData(oldp+1249,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wstrb),4);
    bufp->fullIData(oldp+1250,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wdata),32);
    bufp->fullBit(oldp+1251,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wlast));
    bufp->fullBit(oldp+1252,(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_w_wvalid));
    bufp->fullSData(oldp+1253,(vlSelfRef.NAND_top__DOT__nand_addr_c),14);
    bufp->fullIData(oldp+1254,(vlSelfRef.NAND_top__DOT__nand_addr_r),25);
    bufp->fullIData(oldp+1255,(vlSelfRef.NAND_top__DOT__nand_op_num),32);
    bufp->fullIData(oldp+1256,(vlSelfRef.NAND_top__DOT__nand_parameter),32);
    bufp->fullIData(oldp+1257,(vlSelfRef.NAND_top__DOT__nand_ce_map0),32);
    bufp->fullIData(oldp+1258,(vlSelfRef.NAND_top__DOT__nand_ce_map1),32);
    bufp->fullIData(oldp+1259,(vlSelfRef.NAND_top__DOT__nand_rdy_map0),32);
    bufp->fullIData(oldp+1260,(vlSelfRef.NAND_top__DOT__nand_rdy_map1),32);
    bufp->fullIData(oldp+1261,(vlSelfRef.NAND_top__DOT__nand_command),32);
    bufp->fullSData(oldp+1262,(vlSelfRef.NAND_top__DOT__nand_timing),16);
    bufp->fullQData(oldp+1263,(vlSelfRef.NAND_top__DOT__addr_in_die),38);
    bufp->fullCData(oldp+1265,(vlSelfRef.NAND_top__DOT__NAND_STATE),5);
    bufp->fullIData(oldp+1266,(vlSelfRef.NAND_top__DOT__NAND_OP_NUM),32);
    bufp->fullSData(oldp+1267,(vlSelfRef.NAND_top__DOT__WRITE_MAX_COUNT),14);
    bufp->fullSData(oldp+1268,(vlSelfRef.NAND_top__DOT__READ_MAX_COUNT),14);
    bufp->fullBit(oldp+1269,(vlSelfRef.NAND_top__DOT__nand_clr_ack));
    bufp->fullBit(oldp+1270,(vlSelfRef.NAND_top__DOT__NAND_DONE));
    bufp->fullBit(oldp+1271,(vlSelfRef.NAND_top__DOT__NAND_CE_));
    bufp->fullSData(oldp+1272,((0x00003fffU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                               >> 0x00000010U))),14);
    bufp->fullCData(oldp+1273,((7U & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                      >> 0x0000000cU))),3);
    bufp->fullCData(oldp+1274,((0x0000000fU & (vlSelfRef.NAND_top__DOT__nand_parameter 
                                               >> 8U))),4);
    bufp->fullBit(oldp+1275,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                    >> 8U))));
    bufp->fullBit(oldp+1276,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                    >> 9U))));
    bufp->fullBit(oldp+1277,((1U & (vlSelfRef.NAND_top__DOT__nand_command 
                                    >> 0x0000000dU))));
    bufp->fullBit(oldp+1278,(vlSelfRef.NAND_top__DOT__NAND_DMA_REQ));
    bufp->fullBit(oldp+1279,(vlSelfRef.NAND_top__DOT__nand_cmd_valid));
    bufp->fullCData(oldp+1280,(vlSelfRef.NAND_top__DOT__status),8);
    bufp->fullCData(oldp+1281,(vlSelfRef.NAND_top__DOT__nand_number),2);
    bufp->fullQData(oldp+1282,(vlSelfRef.NAND_top__DOT__ID_INFORM),48);
    bufp->fullIData(oldp+1284,(vlSelfRef.NAND_top__DOT__NAND_DAT_O_RD),32);
    bufp->fullCData(oldp+1285,(((((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__3__KET__) 
                                  << 3U) | ((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__2__KET__) 
                                            << 2U)) 
                                | (((IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__1__KET__) 
                                    << 1U) | (IData)(vlSelfRef.NAND_top__DOT__NAND_CE_pre_o__BRA__0__KET__)))),4);
    bufp->fullCData(oldp+1286,(vlSelfRef.NAND_top__DOT__ADDR_pointer),2);
    bufp->fullCData(oldp+1287,(vlSelfRef.NAND_top__DOT__NAND_ADDR_COUNT),3);
    bufp->fullCData(oldp+1288,(vlSelfRef.NAND_top__DOT__WAIT_NUM),8);
    bufp->fullCData(oldp+1289,(vlSelfRef.NAND_top__DOT__HOLD_NUM),8);
    bufp->fullCData(oldp+1290,(vlSelfRef.NAND_top__DOT__COMMAND),8);
    bufp->fullCData(oldp+1291,(vlSelfRef.NAND_top__DOT__PRE_STATE),5);
    bufp->fullCData(oldp+1292,(vlSelfRef.NAND_top__DOT__READ_ID_NUM),3);
    bufp->fullSData(oldp+1293,(vlSelfRef.NAND_top__DOT__data_count),14);
    bufp->fullQData(oldp+1294,(vlSelfRef.NAND_top__DOT__NAND_ADDR),38);
    bufp->fullIData(oldp+1296,(vlSelfRef.NAND_top__DOT__NAND_DAT_I_WR),32);
    bufp->fullBit(oldp+1297,(vlSelfRef.NAND_top__DOT__NAND_GO));
    bufp->fullBit(oldp+1298,(vlSelfRef.NAND_top__DOT__NAND_ACK));
    bufp->fullBit(oldp+1299,(vlSelfRef.NAND_top__DOT__DMA_OP_DONE));
    bufp->fullBit(oldp+1300,(vlSelfRef.NAND_top__DOT__ERASE_SERIAL));
    bufp->fullBit(oldp+1301,(vlSelfRef.NAND_top__DOT__now_up_half));
    bufp->fullBit(oldp+1302,(vlSelfRef.NAND_top__DOT__now_oob));
    bufp->fullBit(oldp+1303,(vlSelfRef.aclk));
    bufp->fullBit(oldp+1304,(vlSelfRef.aresetn));
    bufp->fullBit(oldp+1305,(vlSelfRef.enable_delay));
    bufp->fullIData(oldp+1306,(vlSelfRef.random_seed),23);
    bufp->fullBit(oldp+1307,(vlSelfRef.ram_ren));
    bufp->fullIData(oldp+1308,(vlSelfRef.ram_raddr),32);
    bufp->fullIData(oldp+1309,(vlSelfRef.ram_rdata),32);
    bufp->fullCData(oldp+1310,(vlSelfRef.ram_wen),4);
    bufp->fullIData(oldp+1311,(vlSelfRef.ram_waddr),32);
    bufp->fullIData(oldp+1312,(vlSelfRef.ram_wdata),32);
    bufp->fullIData(oldp+1313,(vlSelfRef.debug0_wb_pc),32);
    bufp->fullBit(oldp+1314,(vlSelfRef.debug0_wb_rf_wen));
    bufp->fullCData(oldp+1315,(vlSelfRef.debug0_wb_rf_wnum),5);
    bufp->fullIData(oldp+1316,(vlSelfRef.debug0_wb_rf_wdata),32);
    bufp->fullIData(oldp+1317,(vlSelfRef.num_data),32);
    bufp->fullBit(oldp+1318,(vlSelfRef.open_trace));
    bufp->fullBit(oldp+1319,(vlSelfRef.num_monitor));
    bufp->fullCData(oldp+1320,(vlSelfRef.confreg_uart_data),8);
    bufp->fullBit(oldp+1321,(vlSelfRef.write_uart_valid));
    bufp->fullWData(oldp+1322,(vlSelfRef.uart_ctr_bus),128);
    bufp->fullBit(oldp+1326,(vlSelfRef.uart_rx));
    bufp->fullBit(oldp+1327,(vlSelfRef.uart_tx));
    bufp->fullSData(oldp+1328,(vlSelfRef.led),16);
    bufp->fullCData(oldp+1329,(vlSelfRef.led_rg0),2);
    bufp->fullCData(oldp+1330,(vlSelfRef.led_rg1),2);
    bufp->fullCData(oldp+1331,(vlSelfRef.num_csn),8);
    bufp->fullCData(oldp+1332,(vlSelfRef.num_a_g),7);
    bufp->fullCData(oldp+1333,(vlSelfRef.btn_key_col),4);
    bufp->fullCData(oldp+1334,(vlSelfRef.btn_key_row),4);
    bufp->fullCData(oldp+1335,(vlSelfRef.btn_step),2);
    bufp->fullCData(oldp+1336,(vlSelfRef.nand_type),2);
    bufp->fullBit(oldp+1337,(vlSelfRef.pclk));
    bufp->fullBit(oldp+1338,(vlSelfRef.prst_));
    bufp->fullBit(oldp+1339,(vlSelfRef.pwrite));
    bufp->fullBit(oldp+1340,(vlSelfRef.psel));
    bufp->fullBit(oldp+1341,(vlSelfRef.penable));
    bufp->fullSData(oldp+1342,(vlSelfRef.ADDR),11);
    bufp->fullIData(oldp+1343,(vlSelfRef.DAT_I),32);
    bufp->fullIData(oldp+1344,(vlSelfRef.DAT_O),32);
    bufp->fullCData(oldp+1345,(vlSelfRef.NAND_CE_o),4);
    bufp->fullBit(oldp+1346,(vlSelfRef.NAND_REQ));
    bufp->fullCData(oldp+1347,(vlSelfRef.NAND_I),8);
    bufp->fullCData(oldp+1348,(vlSelfRef.NAND_O),8);
    bufp->fullBit(oldp+1349,(vlSelfRef.NAND_EN_));
    bufp->fullBit(oldp+1350,(vlSelfRef.NAND_ALE));
    bufp->fullBit(oldp+1351,(vlSelfRef.NAND_CLE));
    bufp->fullBit(oldp+1352,(vlSelfRef.NAND_WR_));
    bufp->fullBit(oldp+1353,(vlSelfRef.NAND_RD_));
    bufp->fullCData(oldp+1354,(vlSelfRef.NAND_IORDY_i),4);
    bufp->fullBit(oldp+1355,(vlSelfRef.nand_int));
    bufp->fullIData(oldp+1356,(vlSelfRef.NAND_top__DOT__REG_DAT_T),32);
    bufp->fullBit(oldp+1357,(((IData)(vlSelfRef.psel) 
                              & (0x0040U == (IData)(vlSelfRef.ADDR)))));
    bufp->fullBit(oldp+1358,(vlSelfRef.NAND_top__DOT__NANDtag));
    bufp->fullBit(oldp+1359,(vlSelfRef.NAND_top__DOT__NAND_IORDY));
    bufp->fullBit(oldp+1360,(((IData)(vlSelfRef.psel) 
                              & (0x0010U == (IData)(vlSelfRef.ADDR)))));
    bufp->fullBit(oldp+1361,(((IData)(vlSelfRef.psel) 
                              & (0x0014U == (IData)(vlSelfRef.ADDR)))));
    bufp->fullCData(oldp+1362,(((((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__3__KET__) 
                                  << 3U) | ((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__2__KET__) 
                                            << 2U)) 
                                | (((IData)(vlSelfRef.NAND_top__DOT__NAND_IORDY_post_i__BRA__1__KET__) 
                                    << 1U) | (1U & (IData)(vlSelfRef.NAND_IORDY_i))))),4);
    bufp->fullCData(oldp+1363,(vlSelfRef.__SYM__switch),8);
    bufp->fullBit(oldp+1364,((1U & (~ (IData)(vlSelfRef.aresetn)))));
    bufp->fullBit(oldp+1365,((1U & ((IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__usart_mode)
                                     ? ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__APB_DEV__DOT__uart0__DOT__regs__DOT__rx_en)) 
                                        | (IData)(vlSelfRef.uart_tx))
                                     : (IData)(vlSelfRef.uart_rx)))));
    bufp->fullBit(oldp+1366,((1U & ((~ (IData)(vlSelfRef.aresetn)) 
                                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__conf_axi_ram__DOT__ram_r_a_pop)))));
    bufp->fullIData(oldp+1367,(vlSelfRef.__SYM__switch),32);
    bufp->fullBit(oldp+1368,(((~ (0x0000000fU == (IData)(vlSelfRef.btn_key_row))) 
                              & (0U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)))));
    bufp->fullBit(oldp+1369,(((7U == (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__state)) 
                              & (0x0000000fU == (IData)(vlSelfRef.btn_key_row)))));
    bufp->fullBit(oldp+1370,(((~ (IData)(vlSelfRef.btn_step)) 
                              & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r))));
    bufp->fullBit(oldp+1371,((1U & ((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step0_r)) 
                                    & (IData)(vlSelfRef.btn_step)))));
    bufp->fullBit(oldp+1372,(((~ ((IData)(vlSelfRef.btn_step) 
                                  >> 1U)) & (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r))));
    bufp->fullBit(oldp+1373,(((~ (IData)(vlSelfRef.simu_top__DOT__soc__DOT__confreg__DOT__btn_step1_r)) 
                              & ((IData)(vlSelfRef.btn_step) 
                                 >> 1U))));
    bufp->fullBit(oldp+1374,((1U & ((~ (IData)(vlSelfRef.aresetn)) 
                                    | (IData)(vlSelfRef.simu_top__DOT__soc__DOT__sram_axi_ram__DOT__ram_r_a_pop)))));
}
