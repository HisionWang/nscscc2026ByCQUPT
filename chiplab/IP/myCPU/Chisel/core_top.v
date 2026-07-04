module core_top(
  input         aclk, // @[\\src\\main\\scala\\myCPU_top.scala 22:19]
  input         aresetn, // @[\\src\\main\\scala\\myCPU_top.scala 23:19]
  input  [7:0]  intrpt, // @[\\src\\main\\scala\\myCPU_top.scala 26:18]
  output [3:0]  arid, // @[\\src\\main\\scala\\myCPU_top.scala 29:19]
  output [31:0] araddr, // @[\\src\\main\\scala\\myCPU_top.scala 30:19]
  output [7:0]  arlen, // @[\\src\\main\\scala\\myCPU_top.scala 31:19]
  output [2:0]  arsize, // @[\\src\\main\\scala\\myCPU_top.scala 32:19]
  output [1:0]  arburst, // @[\\src\\main\\scala\\myCPU_top.scala 33:19]
  output [1:0]  arlock, // @[\\src\\main\\scala\\myCPU_top.scala 34:19]
  output [3:0]  arcache, // @[\\src\\main\\scala\\myCPU_top.scala 35:19]
  output [2:0]  arprot, // @[\\src\\main\\scala\\myCPU_top.scala 36:19]
  output        arvalid, // @[\\src\\main\\scala\\myCPU_top.scala 37:19]
  input         arready, // @[\\src\\main\\scala\\myCPU_top.scala 38:19]
  input  [3:0]  rid, // @[\\src\\main\\scala\\myCPU_top.scala 41:18]
  input  [31:0] rdata, // @[\\src\\main\\scala\\myCPU_top.scala 42:18]
  input  [1:0]  rresp, // @[\\src\\main\\scala\\myCPU_top.scala 43:18]
  input         rlast, // @[\\src\\main\\scala\\myCPU_top.scala 44:18]
  input         rvalid, // @[\\src\\main\\scala\\myCPU_top.scala 45:18]
  output        rready, // @[\\src\\main\\scala\\myCPU_top.scala 46:18]
  output [3:0]  awid, // @[\\src\\main\\scala\\myCPU_top.scala 49:19]
  output [31:0] awaddr, // @[\\src\\main\\scala\\myCPU_top.scala 50:19]
  output [7:0]  awlen, // @[\\src\\main\\scala\\myCPU_top.scala 51:19]
  output [2:0]  awsize, // @[\\src\\main\\scala\\myCPU_top.scala 52:19]
  output [1:0]  awburst, // @[\\src\\main\\scala\\myCPU_top.scala 53:19]
  output [1:0]  awlock, // @[\\src\\main\\scala\\myCPU_top.scala 54:19]
  output [3:0]  awcache, // @[\\src\\main\\scala\\myCPU_top.scala 55:19]
  output [2:0]  awprot, // @[\\src\\main\\scala\\myCPU_top.scala 56:19]
  output        awvalid, // @[\\src\\main\\scala\\myCPU_top.scala 57:19]
  input         awready, // @[\\src\\main\\scala\\myCPU_top.scala 58:19]
  output [3:0]  wid, // @[\\src\\main\\scala\\myCPU_top.scala 61:18]
  output [31:0] wdata, // @[\\src\\main\\scala\\myCPU_top.scala 62:18]
  output [3:0]  wstrb, // @[\\src\\main\\scala\\myCPU_top.scala 63:18]
  output        wlast, // @[\\src\\main\\scala\\myCPU_top.scala 64:18]
  output        wvalid, // @[\\src\\main\\scala\\myCPU_top.scala 65:18]
  input         wready, // @[\\src\\main\\scala\\myCPU_top.scala 66:18]
  input  [3:0]  bid, // @[\\src\\main\\scala\\myCPU_top.scala 69:18]
  input  [1:0]  bresp, // @[\\src\\main\\scala\\myCPU_top.scala 70:18]
  input         bvalid, // @[\\src\\main\\scala\\myCPU_top.scala 71:18]
  output        bready, // @[\\src\\main\\scala\\myCPU_top.scala 72:18]
  input         break_point, // @[\\src\\main\\scala\\myCPU_top.scala 75:29]
  input         infor_flag, // @[\\src\\main\\scala\\myCPU_top.scala 76:29]
  input  [4:0]  reg_num, // @[\\src\\main\\scala\\myCPU_top.scala 77:29]
  output        ws_valid, // @[\\src\\main\\scala\\myCPU_top.scala 78:29]
  output [31:0] rf_rdata, // @[\\src\\main\\scala\\myCPU_top.scala 79:29]
  output [31:0] debug0_wb_pc, // @[\\src\\main\\scala\\myCPU_top.scala 80:29]
  output        debug0_wb_rf_wen, // @[\\src\\main\\scala\\myCPU_top.scala 81:29]
  output [4:0]  debug0_wb_rf_wnum, // @[\\src\\main\\scala\\myCPU_top.scala 82:29]
  output [31:0] debug0_wb_rf_wdata, // @[\\src\\main\\scala\\myCPU_top.scala 83:29]
  output [31:0] debug0_wb_inst // @[\\src\\main\\scala\\myCPU_top.scala 84:29]
);
  wire  frontend_clock; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_reset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_0_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_0_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_0_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [2:0] frontend_io_out_0_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_0_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_0_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_1_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_1_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_1_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [2:0] frontend_io_out_1_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_1_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_1_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_ready; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_2_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_2_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_out_2_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [2:0] frontend_io_out_2_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_out_2_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_out_2_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_toMmu_ready; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_toMmu_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_mmu_toMmu_bits_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_fromMmu_valid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_mmu_fromMmu_bits_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_fromMmu_bits_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_mmu_fromMmu_bits_error_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [3:0] frontend_io_axi_master_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_axi_master_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [7:0] frontend_io_axi_master_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [2:0] frontend_io_axi_master_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [1:0] frontend_io_axi_master_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_axi_master_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_axi_master_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [3:0] frontend_io_axi_master_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire [31:0] frontend_io_axi_master_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_axi_master_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_axi_master_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  frontend_io_axi_master_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
  wire  backend_clock; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_reset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_0_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_0_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_0_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_in_0_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_0_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_0_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_1_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_1_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_1_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_in_1_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_1_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_1_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_2_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_2_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_in_2_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_in_2_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_in_2_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_in_2_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_extInt; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_req_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_lsEnq_req_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_req_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_req_bits_isLoad; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_req_bits_isStore; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_lsEnq_req_bits_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_req_bits_sqIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_lsEnq_req_bits_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_req_bits_lqIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_inst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_lsEnq_toLsqData_ctrl_aluOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_bruOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_csrOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_mulOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_divOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_src1Type; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_lsEnq_toLsqData_ctrl_src2Type; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_lsEnq_toLsqData_ctrl_immType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_memWrite; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_csrWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_isBranch; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_isJump; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_ctrl_isPriv; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [9:0] backend_io_lsEnq_toLsqData_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_imm; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [13:0] backend_io_lsEnq_toLsqData_csrAddress; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_lsEnq_toLsqData_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_lsEnq_toLsqData_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_lsEnq_toLsqData_ldst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_lsEnq_toLsqData_lrs1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_lsEnq_toLsqData_lrs2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_lsEnq_toLsqData_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_lsEnq_toLsqData_prs1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_lsEnq_toLsqData_prs2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_lsEnq_toLsqData_oldPdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_rs1Valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_rs2Valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_rdValid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_lsEnq_toLsqData_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_toLsqData_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_lqFull; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_lsEnq_sqFull; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_inst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_ctrl_aluOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_bruOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_csrOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_mulOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_divOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_src1Type; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_ctrl_src2Type; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_ctrl_immType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_memWrite; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_csrWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_isBranch; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_isJump; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_ctrl_isPriv; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [9:0] backend_io_toMemResult_0_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_imm; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [13:0] backend_io_toMemResult_0_bits_uop_csrAddress; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_toMemResult_0_bits_uop_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_ldst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_lrs1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_0_bits_uop_lrs2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_prs1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_prs2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_0_bits_uop_oldPdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_rs1Valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_rs2Valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_rdValid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_toMemResult_0_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_toMemResult_0_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_lqIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_0_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_sqIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_0_bits_uop_issueQueue; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_prs1Busy; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_prs2Busy; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_uop_isStd; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_toMemResult_0_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_memValid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_0_bits_memWrite; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_0_bits_memStoreData; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_inst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_ctrl_aluOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_bruOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_csrOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_mulOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_divOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_src1Type; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_ctrl_src2Type; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_ctrl_immType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_memWrite; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_csrWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_isBranch; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_isJump; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_ctrl_isPriv; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [9:0] backend_io_toMemResult_1_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_imm; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [13:0] backend_io_toMemResult_1_bits_uop_csrAddress; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_toMemResult_1_bits_uop_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [1:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_ldst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_lrs1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_io_toMemResult_1_bits_uop_lrs2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_prs1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_prs2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_toMemResult_1_bits_uop_oldPdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_rs1Valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_rs2Valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_rdValid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_toMemResult_1_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_toMemResult_1_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_lqIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_toMemResult_1_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_sqIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [2:0] backend_io_toMemResult_1_bits_uop_issueQueue; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_prs1Busy; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_prs2Busy; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_uop_isStd; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_toMemResult_1_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_memValid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_toMemResult_1_bits_memWrite; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_toMemResult_1_bits_memStoreData; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_0_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_uop_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [9:0] backend_io_fromMemResult_0_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_fromMemResult_0_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_uop_rdValid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_fromMemResult_0_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_fromMemResult_0_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_0_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_0_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_fromMemResult_0_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_0_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_0_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_0_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_1_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [9:0] backend_io_fromMemResult_1_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [6:0] backend_io_fromMemResult_1_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_fromMemResult_1_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_fromMemResult_1_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_fromMemResult_1_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_io_fromMemResult_1_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_fromMemResult_1_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_1_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_1_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_io_fromMemResult_1_bits_memStoreData; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_io_commitToSq_valid_0; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [3:0] backend_io_commitToSq_bits_0_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_pc; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_instr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [4:0] backend_difftest_commit_0_wdest; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_isCntInst; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_csrRstat; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_csrData; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_excpFlush; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_ertnFlush; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [5:0] backend_difftest_commit_0_csrEcode; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_trap; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_load_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_load_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_load_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  backend_difftest_commit_0_store_valid; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_store_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_store_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_commit_0_store_data; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_0; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_1; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_2; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_3; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_4; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_5; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_6; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_7; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_8; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_9; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_10; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_11; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_12; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_13; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_14; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_15; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_16; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_17; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_18; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_19; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_20; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_21; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_22; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_23; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_24; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_25; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_26; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_27; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_28; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_29; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_30; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire [31:0] backend_difftest_regs_31; // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
  wire  memory_clock; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_reset; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_req_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_lsEnq_req_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_req_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_req_bits_isLoad; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_req_bits_isStore; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_lsEnq_req_bits_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_lsEnq_req_bits_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_lsEnq_toLsqData_pc; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_lsEnq_toLsqData_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_lsEnq_toLsqData_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_toLsqData_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [6:0] memory_io_lsEnq_toLsqData_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_lqFull; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_lsEnq_sqFull; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeMmuResult_ready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeMmuResult_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeMmuResult_bits_exeRes_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_fromExeMmuResult_bits_exeRes_data; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_fromExeMmuResult_bits_mmuRes_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeMmuResult_bits_mmuRes_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeResult_ready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeResult_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_fromExeResult_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_fromExeResult_bits_uop_isStd; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_fromExeResult_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_0_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_uop_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [9:0] memory_io_toWbResult_0_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [6:0] memory_io_toWbResult_0_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_uop_rdValid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_toWbResult_0_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_toWbResult_0_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_0_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_0_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_toWbResult_0_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_0_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_0_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_0_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_1_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [9:0] memory_io_toWbResult_1_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [6:0] memory_io_toWbResult_1_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_toWbResult_1_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_toWbResult_1_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_toWbResult_1_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [5:0] memory_io_toWbResult_1_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_toWbResult_1_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_1_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_1_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_toWbResult_1_bits_memStoreData; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_robCommit_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_robCommit_0_sqIdx; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_axi_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_axi_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [7:0] memory_io_axi_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [2:0] memory_io_axi_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [1:0] memory_io_axi_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_axi_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_axi_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [7:0] memory_io_axi_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [2:0] memory_io_axi_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [1:0] memory_io_axi_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_axi_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_axi_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_axi_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_w_wready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_axi_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [31:0] memory_io_axi_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire [3:0] memory_io_axi_b_data_bid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_b_data_bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memory_io_axi_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
  wire  memaddrtrans_clock; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_reset; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_ready; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_valid; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_bits_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_in_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_in_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_in_bits_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_in_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_valid; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_exeRes_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_out_bits_exeRes_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [3:0] memaddrtrans_io_out_bits_exeRes_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_exeRes_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_out_bits_exeRes_data; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_out_bits_mmuRes_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_out_bits_mmuRes_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuReq_valid; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_mmuReq_bits_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_valid; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire [31:0] memaddrtrans_io_mmuResp_bits_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  memaddrtrans_io_mmuResp_bits_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
  wire  simMMU_clock; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire  simMMU_reset; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire  simMMU_io_mmuReq_valid; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire [31:0] simMMU_io_mmuReq_bits_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire  simMMU_io_mmuResp_valid; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire [31:0] simMMU_io_mmuResp_bits_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire  simMMU_io_mmuResp_bits_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
  wire  mmu_clock; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_reset; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_fromIcache_ready; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_fromIcache_valid; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire [31:0] mmu_io_fromIcache_bits_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_ready; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_valid; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire [31:0] mmu_io_toIcache_bits_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_bits_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_bits_hasError; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_bits_error_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_bits_error_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_bits_error_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  mmu_io_toIcache_bits_error_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
  wire  csr_clock; // @[\\src\\main\\scala\\myCPU_top.scala 180:19]
  wire  csr_reset; // @[\\src\\main\\scala\\myCPU_top.scala 180:19]
  wire [7:0] csr_io_irqBus; // @[\\src\\main\\scala\\myCPU_top.scala 180:19]
  wire [31:0] csr_difftest_estat; // @[\\src\\main\\scala\\myCPU_top.scala 180:19]
  wire [63:0] csr_difftest_timer64; // @[\\src\\main\\scala\\myCPU_top.scala 180:19]
  wire [3:0] uncache1_axi_master_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [31:0] uncache1_axi_master_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [7:0] uncache1_axi_master_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [2:0] uncache1_axi_master_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [1:0] uncache1_axi_master_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [1:0] uncache1_axi_master_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [2:0] uncache1_axi_master_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [31:0] uncache1_axi_master_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [7:0] uncache1_axi_master_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [2:0] uncache1_axi_master_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [1:0] uncache1_axi_master_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [1:0] uncache1_axi_master_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [2:0] uncache1_axi_master_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [31:0] uncache1_axi_master_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_w_wready; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [31:0] uncache1_axi_master_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [1:0] uncache1_axi_master_r_data_rresp; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache1_axi_master_b_data_bid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [1:0] uncache1_axi_master_b_data_bresp; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_b_data_bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_axi_master_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [31:0] uncache1_cpu_if_req_addr; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_cpu_if_req_valid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [31:0] uncache1_cpu_if_resp_data; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire  uncache1_cpu_if_resp_valid; // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
  wire [3:0] uncache2_axi_master_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [31:0] uncache2_axi_master_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [7:0] uncache2_axi_master_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [2:0] uncache2_axi_master_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [1:0] uncache2_axi_master_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [1:0] uncache2_axi_master_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [2:0] uncache2_axi_master_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [31:0] uncache2_axi_master_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [7:0] uncache2_axi_master_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [2:0] uncache2_axi_master_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [1:0] uncache2_axi_master_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [1:0] uncache2_axi_master_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [2:0] uncache2_axi_master_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [31:0] uncache2_axi_master_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_w_wready; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [31:0] uncache2_axi_master_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [1:0] uncache2_axi_master_r_data_rresp; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [3:0] uncache2_axi_master_b_data_bid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [1:0] uncache2_axi_master_b_data_bresp; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_b_data_bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_axi_master_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [31:0] uncache2_cpu_if_req_addr; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_cpu_if_req_valid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire [31:0] uncache2_cpu_if_resp_data; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  uncache2_cpu_if_resp_valid; // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
  wire  axi_crossbar_clock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_reset; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_icache_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_icache_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_icache_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_icache_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_icache_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_icache_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_icache_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_icache_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_icache_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_icache_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_icache_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_icache_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_dcache_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_dcache_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_dcache_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_dcache_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_dcache_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_dcache_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_dcache_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_dcache_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_dcache_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_dcache_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_dcache_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_dcache_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_w_wready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_dcache_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_dcache_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_dcache_b_data_bid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_b_data_bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_dcache_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_uncache1_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_uncache1_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache1_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache1_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache1_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache1_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache1_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_uncache1_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_uncache1_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache1_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache1_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache1_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache1_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache1_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache1_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache1_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_uncache2_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_uncache2_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache2_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache2_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache2_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache2_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache2_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_in_uncache2_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_in_uncache2_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_in_uncache2_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_in_uncache2_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_in_uncache2_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache2_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache2_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache2_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_in_uncache2_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_out_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_out_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_out_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_out_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_out_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_out_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [7:0] axi_crossbar_io_out_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_out_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [1:0] axi_crossbar_io_out_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [2:0] axi_crossbar_io_out_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_out_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_w_wready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [31:0] axi_crossbar_io_out_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire [3:0] axi_crossbar_io_out_b_data_bid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_b_data_bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  axi_crossbar_io_out_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
  wire  difftest_clock; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_reset; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_pc; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_instr; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [4:0] difftest_io_commit_0_wdest; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_isCntInst; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_csrRstat; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_csrData; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_excpFlush; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_ertnFlush; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [5:0] difftest_io_commit_0_csrEcode; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_trap; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_load_valid; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_load_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_load_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire  difftest_io_commit_0_store_valid; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_store_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_store_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_commit_0_store_data; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_1; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_2; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_3; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_4; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_5; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_6; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_7; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_8; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_9; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_10; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_11; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_12; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_13; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_14; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_15; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_16; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_17; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_18; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_19; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_20; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_21; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_22; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_23; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_24; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_25; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_26; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_27; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_28; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_29; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_30; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_regs_31; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] difftest_io_csr_estat; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [63:0] difftest_io_csr_timer64; // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
  wire [31:0] _GEN_0 = backend_difftest_regs_0; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_1 = 5'h1 == reg_num ? backend_difftest_regs_1 : _GEN_0; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_2 = 5'h2 == reg_num ? backend_difftest_regs_2 : _GEN_1; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_3 = 5'h3 == reg_num ? backend_difftest_regs_3 : _GEN_2; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_4 = 5'h4 == reg_num ? backend_difftest_regs_4 : _GEN_3; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_5 = 5'h5 == reg_num ? backend_difftest_regs_5 : _GEN_4; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_6 = 5'h6 == reg_num ? backend_difftest_regs_6 : _GEN_5; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_7 = 5'h7 == reg_num ? backend_difftest_regs_7 : _GEN_6; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_8 = 5'h8 == reg_num ? backend_difftest_regs_8 : _GEN_7; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_9 = 5'h9 == reg_num ? backend_difftest_regs_9 : _GEN_8; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_10 = 5'ha == reg_num ? backend_difftest_regs_10 : _GEN_9; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_11 = 5'hb == reg_num ? backend_difftest_regs_11 : _GEN_10; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_12 = 5'hc == reg_num ? backend_difftest_regs_12 : _GEN_11; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_13 = 5'hd == reg_num ? backend_difftest_regs_13 : _GEN_12; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_14 = 5'he == reg_num ? backend_difftest_regs_14 : _GEN_13; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_15 = 5'hf == reg_num ? backend_difftest_regs_15 : _GEN_14; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_16 = 5'h10 == reg_num ? backend_difftest_regs_16 : _GEN_15; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_17 = 5'h11 == reg_num ? backend_difftest_regs_17 : _GEN_16; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_18 = 5'h12 == reg_num ? backend_difftest_regs_18 : _GEN_17; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_19 = 5'h13 == reg_num ? backend_difftest_regs_19 : _GEN_18; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_20 = 5'h14 == reg_num ? backend_difftest_regs_20 : _GEN_19; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_21 = 5'h15 == reg_num ? backend_difftest_regs_21 : _GEN_20; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_22 = 5'h16 == reg_num ? backend_difftest_regs_22 : _GEN_21; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_23 = 5'h17 == reg_num ? backend_difftest_regs_23 : _GEN_22; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_24 = 5'h18 == reg_num ? backend_difftest_regs_24 : _GEN_23; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_25 = 5'h19 == reg_num ? backend_difftest_regs_25 : _GEN_24; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_26 = 5'h1a == reg_num ? backend_difftest_regs_26 : _GEN_25; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_27 = 5'h1b == reg_num ? backend_difftest_regs_27 : _GEN_26; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_28 = 5'h1c == reg_num ? backend_difftest_regs_28 : _GEN_27; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_29 = 5'h1d == reg_num ? backend_difftest_regs_29 : _GEN_28; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  wire [31:0] _GEN_30 = 5'h1e == reg_num ? backend_difftest_regs_30 : _GEN_29; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  Frontend frontend ( // @[\\src\\main\\scala\\myCPU_top.scala 106:24]
    .clock(frontend_clock),
    .reset(frontend_reset),
    .io_out_0_ready(frontend_io_out_0_ready),
    .io_out_0_valid(frontend_io_out_0_valid),
    .io_out_0_bits_instr(frontend_io_out_0_bits_instr),
    .io_out_0_bits_pc(frontend_io_out_0_bits_pc),
    .io_out_0_bits_pdInfo_valid(frontend_io_out_0_bits_pdInfo_valid),
    .io_out_0_bits_pdInfo_isBr(frontend_io_out_0_bits_pdInfo_isBr),
    .io_out_0_bits_pdInfo_isJal(frontend_io_out_0_bits_pdInfo_isJal),
    .io_out_0_bits_pdInfo_isJalr(frontend_io_out_0_bits_pdInfo_isJalr),
    .io_out_0_bits_pdInfo_isCall(frontend_io_out_0_bits_pdInfo_isCall),
    .io_out_0_bits_pdInfo_isRet(frontend_io_out_0_bits_pdInfo_isRet),
    .io_out_0_bits_pdInfo_jumpTarget(frontend_io_out_0_bits_pdInfo_jumpTarget),
    .io_out_0_bits_bpuInfo_pc(frontend_io_out_0_bits_bpuInfo_pc),
    .io_out_0_bits_bpuInfo_fallThrough(frontend_io_out_0_bits_bpuInfo_fallThrough),
    .io_out_0_bits_bpuInfo_taken(frontend_io_out_0_bits_bpuInfo_taken),
    .io_out_0_bits_bpuInfo_target(frontend_io_out_0_bits_bpuInfo_target),
    .io_out_0_bits_bpuInfo_takenOffset(frontend_io_out_0_bits_bpuInfo_takenOffset),
    .io_out_0_bits_bpuInfo_meta_btbHit(frontend_io_out_0_bits_bpuInfo_meta_btbHit),
    .io_out_0_bits_bpuInfo_meta_btbIsJalr(frontend_io_out_0_bits_bpuInfo_meta_btbIsJalr),
    .io_out_0_bits_bpuInfo_meta_btbIsJal(frontend_io_out_0_bits_bpuInfo_meta_btbIsJal),
    .io_out_0_bits_bpuInfo_meta_btbIsCall(frontend_io_out_0_bits_bpuInfo_meta_btbIsCall),
    .io_out_0_bits_bpuInfo_meta_btbIsRet(frontend_io_out_0_bits_bpuInfo_meta_btbIsRet),
    .io_out_0_bits_bpuInfo_meta_btbOffset(frontend_io_out_0_bits_bpuInfo_meta_btbOffset),
    .io_out_0_bits_bpuInfo_meta_phtCounter(frontend_io_out_0_bits_bpuInfo_meta_phtCounter),
    .io_out_0_bits_bpuInfo_meta_rasTop(frontend_io_out_0_bits_bpuInfo_meta_rasTop),
    .io_out_0_bits_bpuInfo_meta_predTaken(frontend_io_out_0_bits_bpuInfo_meta_predTaken),
    .io_out_0_bits_bpuInfo_meta_predTarget(frontend_io_out_0_bits_bpuInfo_meta_predTarget),
    .io_out_0_bits_exception_excpTlbRefill(frontend_io_out_0_bits_exception_excpTlbRefill),
    .io_out_0_bits_exception_excpTlbPif(frontend_io_out_0_bits_exception_excpTlbPif),
    .io_out_0_bits_exception_excpTlbPpi(frontend_io_out_0_bits_exception_excpTlbPpi),
    .io_out_0_bits_exception_excpAdef(frontend_io_out_0_bits_exception_excpAdef),
    .io_out_1_ready(frontend_io_out_1_ready),
    .io_out_1_valid(frontend_io_out_1_valid),
    .io_out_1_bits_instr(frontend_io_out_1_bits_instr),
    .io_out_1_bits_pc(frontend_io_out_1_bits_pc),
    .io_out_1_bits_pdInfo_valid(frontend_io_out_1_bits_pdInfo_valid),
    .io_out_1_bits_pdInfo_isBr(frontend_io_out_1_bits_pdInfo_isBr),
    .io_out_1_bits_pdInfo_isJal(frontend_io_out_1_bits_pdInfo_isJal),
    .io_out_1_bits_pdInfo_isJalr(frontend_io_out_1_bits_pdInfo_isJalr),
    .io_out_1_bits_pdInfo_isCall(frontend_io_out_1_bits_pdInfo_isCall),
    .io_out_1_bits_pdInfo_isRet(frontend_io_out_1_bits_pdInfo_isRet),
    .io_out_1_bits_pdInfo_jumpTarget(frontend_io_out_1_bits_pdInfo_jumpTarget),
    .io_out_1_bits_bpuInfo_pc(frontend_io_out_1_bits_bpuInfo_pc),
    .io_out_1_bits_bpuInfo_fallThrough(frontend_io_out_1_bits_bpuInfo_fallThrough),
    .io_out_1_bits_bpuInfo_taken(frontend_io_out_1_bits_bpuInfo_taken),
    .io_out_1_bits_bpuInfo_target(frontend_io_out_1_bits_bpuInfo_target),
    .io_out_1_bits_bpuInfo_takenOffset(frontend_io_out_1_bits_bpuInfo_takenOffset),
    .io_out_1_bits_bpuInfo_meta_btbHit(frontend_io_out_1_bits_bpuInfo_meta_btbHit),
    .io_out_1_bits_bpuInfo_meta_btbIsJalr(frontend_io_out_1_bits_bpuInfo_meta_btbIsJalr),
    .io_out_1_bits_bpuInfo_meta_btbIsJal(frontend_io_out_1_bits_bpuInfo_meta_btbIsJal),
    .io_out_1_bits_bpuInfo_meta_btbIsCall(frontend_io_out_1_bits_bpuInfo_meta_btbIsCall),
    .io_out_1_bits_bpuInfo_meta_btbIsRet(frontend_io_out_1_bits_bpuInfo_meta_btbIsRet),
    .io_out_1_bits_bpuInfo_meta_btbOffset(frontend_io_out_1_bits_bpuInfo_meta_btbOffset),
    .io_out_1_bits_bpuInfo_meta_phtCounter(frontend_io_out_1_bits_bpuInfo_meta_phtCounter),
    .io_out_1_bits_bpuInfo_meta_rasTop(frontend_io_out_1_bits_bpuInfo_meta_rasTop),
    .io_out_1_bits_bpuInfo_meta_predTaken(frontend_io_out_1_bits_bpuInfo_meta_predTaken),
    .io_out_1_bits_bpuInfo_meta_predTarget(frontend_io_out_1_bits_bpuInfo_meta_predTarget),
    .io_out_1_bits_exception_excpTlbRefill(frontend_io_out_1_bits_exception_excpTlbRefill),
    .io_out_1_bits_exception_excpTlbPif(frontend_io_out_1_bits_exception_excpTlbPif),
    .io_out_1_bits_exception_excpTlbPpi(frontend_io_out_1_bits_exception_excpTlbPpi),
    .io_out_1_bits_exception_excpAdef(frontend_io_out_1_bits_exception_excpAdef),
    .io_out_2_ready(frontend_io_out_2_ready),
    .io_out_2_valid(frontend_io_out_2_valid),
    .io_out_2_bits_instr(frontend_io_out_2_bits_instr),
    .io_out_2_bits_pc(frontend_io_out_2_bits_pc),
    .io_out_2_bits_pdInfo_valid(frontend_io_out_2_bits_pdInfo_valid),
    .io_out_2_bits_pdInfo_isBr(frontend_io_out_2_bits_pdInfo_isBr),
    .io_out_2_bits_pdInfo_isJal(frontend_io_out_2_bits_pdInfo_isJal),
    .io_out_2_bits_pdInfo_isJalr(frontend_io_out_2_bits_pdInfo_isJalr),
    .io_out_2_bits_pdInfo_isCall(frontend_io_out_2_bits_pdInfo_isCall),
    .io_out_2_bits_pdInfo_isRet(frontend_io_out_2_bits_pdInfo_isRet),
    .io_out_2_bits_pdInfo_jumpTarget(frontend_io_out_2_bits_pdInfo_jumpTarget),
    .io_out_2_bits_bpuInfo_pc(frontend_io_out_2_bits_bpuInfo_pc),
    .io_out_2_bits_bpuInfo_fallThrough(frontend_io_out_2_bits_bpuInfo_fallThrough),
    .io_out_2_bits_bpuInfo_taken(frontend_io_out_2_bits_bpuInfo_taken),
    .io_out_2_bits_bpuInfo_target(frontend_io_out_2_bits_bpuInfo_target),
    .io_out_2_bits_bpuInfo_takenOffset(frontend_io_out_2_bits_bpuInfo_takenOffset),
    .io_out_2_bits_bpuInfo_meta_btbHit(frontend_io_out_2_bits_bpuInfo_meta_btbHit),
    .io_out_2_bits_bpuInfo_meta_btbIsJalr(frontend_io_out_2_bits_bpuInfo_meta_btbIsJalr),
    .io_out_2_bits_bpuInfo_meta_btbIsJal(frontend_io_out_2_bits_bpuInfo_meta_btbIsJal),
    .io_out_2_bits_bpuInfo_meta_btbIsCall(frontend_io_out_2_bits_bpuInfo_meta_btbIsCall),
    .io_out_2_bits_bpuInfo_meta_btbIsRet(frontend_io_out_2_bits_bpuInfo_meta_btbIsRet),
    .io_out_2_bits_bpuInfo_meta_btbOffset(frontend_io_out_2_bits_bpuInfo_meta_btbOffset),
    .io_out_2_bits_bpuInfo_meta_phtCounter(frontend_io_out_2_bits_bpuInfo_meta_phtCounter),
    .io_out_2_bits_bpuInfo_meta_rasTop(frontend_io_out_2_bits_bpuInfo_meta_rasTop),
    .io_out_2_bits_bpuInfo_meta_predTaken(frontend_io_out_2_bits_bpuInfo_meta_predTaken),
    .io_out_2_bits_bpuInfo_meta_predTarget(frontend_io_out_2_bits_bpuInfo_meta_predTarget),
    .io_out_2_bits_exception_excpTlbRefill(frontend_io_out_2_bits_exception_excpTlbRefill),
    .io_out_2_bits_exception_excpTlbPif(frontend_io_out_2_bits_exception_excpTlbPif),
    .io_out_2_bits_exception_excpTlbPpi(frontend_io_out_2_bits_exception_excpTlbPpi),
    .io_out_2_bits_exception_excpAdef(frontend_io_out_2_bits_exception_excpAdef),
    .io_redirect_valid(frontend_io_redirect_valid),
    .io_mmu_toMmu_ready(frontend_io_mmu_toMmu_ready),
    .io_mmu_toMmu_valid(frontend_io_mmu_toMmu_valid),
    .io_mmu_toMmu_bits_vaddr(frontend_io_mmu_toMmu_bits_vaddr),
    .io_mmu_fromMmu_valid(frontend_io_mmu_fromMmu_valid),
    .io_mmu_fromMmu_bits_paddr(frontend_io_mmu_fromMmu_bits_paddr),
    .io_mmu_fromMmu_bits_cacheable(frontend_io_mmu_fromMmu_bits_cacheable),
    .io_mmu_fromMmu_bits_error_excpTlbRefill(frontend_io_mmu_fromMmu_bits_error_excpTlbRefill),
    .io_mmu_fromMmu_bits_error_excpTlbPif(frontend_io_mmu_fromMmu_bits_error_excpTlbPif),
    .io_mmu_fromMmu_bits_error_excpTlbPpi(frontend_io_mmu_fromMmu_bits_error_excpTlbPpi),
    .io_mmu_fromMmu_bits_error_excpAdef(frontend_io_mmu_fromMmu_bits_error_excpAdef),
    .io_axi_master_ar_data_arid(frontend_io_axi_master_ar_data_arid),
    .io_axi_master_ar_data_araddr(frontend_io_axi_master_ar_data_araddr),
    .io_axi_master_ar_data_arlen(frontend_io_axi_master_ar_data_arlen),
    .io_axi_master_ar_data_arsize(frontend_io_axi_master_ar_data_arsize),
    .io_axi_master_ar_data_arburst(frontend_io_axi_master_ar_data_arburst),
    .io_axi_master_ar_data_arvalid(frontend_io_axi_master_ar_data_arvalid),
    .io_axi_master_ar_arready(frontend_io_axi_master_ar_arready),
    .io_axi_master_r_data_rid(frontend_io_axi_master_r_data_rid),
    .io_axi_master_r_data_rdata(frontend_io_axi_master_r_data_rdata),
    .io_axi_master_r_data_rlast(frontend_io_axi_master_r_data_rlast),
    .io_axi_master_r_data_rvalid(frontend_io_axi_master_r_data_rvalid),
    .io_axi_master_r_rready(frontend_io_axi_master_r_rready)
  );
  Backend backend ( // @[\\src\\main\\scala\\myCPU_top.scala 107:23]
    .clock(backend_clock),
    .reset(backend_reset),
    .io_in_0_ready(backend_io_in_0_ready),
    .io_in_0_valid(backend_io_in_0_valid),
    .io_in_0_bits_instr(backend_io_in_0_bits_instr),
    .io_in_0_bits_pc(backend_io_in_0_bits_pc),
    .io_in_0_bits_pdInfo_valid(backend_io_in_0_bits_pdInfo_valid),
    .io_in_0_bits_pdInfo_isBr(backend_io_in_0_bits_pdInfo_isBr),
    .io_in_0_bits_pdInfo_isJal(backend_io_in_0_bits_pdInfo_isJal),
    .io_in_0_bits_pdInfo_isJalr(backend_io_in_0_bits_pdInfo_isJalr),
    .io_in_0_bits_pdInfo_isCall(backend_io_in_0_bits_pdInfo_isCall),
    .io_in_0_bits_pdInfo_isRet(backend_io_in_0_bits_pdInfo_isRet),
    .io_in_0_bits_pdInfo_jumpTarget(backend_io_in_0_bits_pdInfo_jumpTarget),
    .io_in_0_bits_bpuInfo_pc(backend_io_in_0_bits_bpuInfo_pc),
    .io_in_0_bits_bpuInfo_fallThrough(backend_io_in_0_bits_bpuInfo_fallThrough),
    .io_in_0_bits_bpuInfo_taken(backend_io_in_0_bits_bpuInfo_taken),
    .io_in_0_bits_bpuInfo_target(backend_io_in_0_bits_bpuInfo_target),
    .io_in_0_bits_bpuInfo_takenOffset(backend_io_in_0_bits_bpuInfo_takenOffset),
    .io_in_0_bits_bpuInfo_meta_btbHit(backend_io_in_0_bits_bpuInfo_meta_btbHit),
    .io_in_0_bits_bpuInfo_meta_btbIsJalr(backend_io_in_0_bits_bpuInfo_meta_btbIsJalr),
    .io_in_0_bits_bpuInfo_meta_btbIsJal(backend_io_in_0_bits_bpuInfo_meta_btbIsJal),
    .io_in_0_bits_bpuInfo_meta_btbIsCall(backend_io_in_0_bits_bpuInfo_meta_btbIsCall),
    .io_in_0_bits_bpuInfo_meta_btbIsRet(backend_io_in_0_bits_bpuInfo_meta_btbIsRet),
    .io_in_0_bits_bpuInfo_meta_btbOffset(backend_io_in_0_bits_bpuInfo_meta_btbOffset),
    .io_in_0_bits_bpuInfo_meta_phtCounter(backend_io_in_0_bits_bpuInfo_meta_phtCounter),
    .io_in_0_bits_bpuInfo_meta_rasTop(backend_io_in_0_bits_bpuInfo_meta_rasTop),
    .io_in_0_bits_bpuInfo_meta_predTaken(backend_io_in_0_bits_bpuInfo_meta_predTaken),
    .io_in_0_bits_bpuInfo_meta_predTarget(backend_io_in_0_bits_bpuInfo_meta_predTarget),
    .io_in_0_bits_exception_excpTlbRefill(backend_io_in_0_bits_exception_excpTlbRefill),
    .io_in_0_bits_exception_excpTlbPif(backend_io_in_0_bits_exception_excpTlbPif),
    .io_in_0_bits_exception_excpTlbPpi(backend_io_in_0_bits_exception_excpTlbPpi),
    .io_in_0_bits_exception_excpAdef(backend_io_in_0_bits_exception_excpAdef),
    .io_in_1_ready(backend_io_in_1_ready),
    .io_in_1_valid(backend_io_in_1_valid),
    .io_in_1_bits_instr(backend_io_in_1_bits_instr),
    .io_in_1_bits_pc(backend_io_in_1_bits_pc),
    .io_in_1_bits_pdInfo_valid(backend_io_in_1_bits_pdInfo_valid),
    .io_in_1_bits_pdInfo_isBr(backend_io_in_1_bits_pdInfo_isBr),
    .io_in_1_bits_pdInfo_isJal(backend_io_in_1_bits_pdInfo_isJal),
    .io_in_1_bits_pdInfo_isJalr(backend_io_in_1_bits_pdInfo_isJalr),
    .io_in_1_bits_pdInfo_isCall(backend_io_in_1_bits_pdInfo_isCall),
    .io_in_1_bits_pdInfo_isRet(backend_io_in_1_bits_pdInfo_isRet),
    .io_in_1_bits_pdInfo_jumpTarget(backend_io_in_1_bits_pdInfo_jumpTarget),
    .io_in_1_bits_bpuInfo_pc(backend_io_in_1_bits_bpuInfo_pc),
    .io_in_1_bits_bpuInfo_fallThrough(backend_io_in_1_bits_bpuInfo_fallThrough),
    .io_in_1_bits_bpuInfo_taken(backend_io_in_1_bits_bpuInfo_taken),
    .io_in_1_bits_bpuInfo_target(backend_io_in_1_bits_bpuInfo_target),
    .io_in_1_bits_bpuInfo_takenOffset(backend_io_in_1_bits_bpuInfo_takenOffset),
    .io_in_1_bits_bpuInfo_meta_btbHit(backend_io_in_1_bits_bpuInfo_meta_btbHit),
    .io_in_1_bits_bpuInfo_meta_btbIsJalr(backend_io_in_1_bits_bpuInfo_meta_btbIsJalr),
    .io_in_1_bits_bpuInfo_meta_btbIsJal(backend_io_in_1_bits_bpuInfo_meta_btbIsJal),
    .io_in_1_bits_bpuInfo_meta_btbIsCall(backend_io_in_1_bits_bpuInfo_meta_btbIsCall),
    .io_in_1_bits_bpuInfo_meta_btbIsRet(backend_io_in_1_bits_bpuInfo_meta_btbIsRet),
    .io_in_1_bits_bpuInfo_meta_btbOffset(backend_io_in_1_bits_bpuInfo_meta_btbOffset),
    .io_in_1_bits_bpuInfo_meta_phtCounter(backend_io_in_1_bits_bpuInfo_meta_phtCounter),
    .io_in_1_bits_bpuInfo_meta_rasTop(backend_io_in_1_bits_bpuInfo_meta_rasTop),
    .io_in_1_bits_bpuInfo_meta_predTaken(backend_io_in_1_bits_bpuInfo_meta_predTaken),
    .io_in_1_bits_bpuInfo_meta_predTarget(backend_io_in_1_bits_bpuInfo_meta_predTarget),
    .io_in_1_bits_exception_excpTlbRefill(backend_io_in_1_bits_exception_excpTlbRefill),
    .io_in_1_bits_exception_excpTlbPif(backend_io_in_1_bits_exception_excpTlbPif),
    .io_in_1_bits_exception_excpTlbPpi(backend_io_in_1_bits_exception_excpTlbPpi),
    .io_in_1_bits_exception_excpAdef(backend_io_in_1_bits_exception_excpAdef),
    .io_in_2_ready(backend_io_in_2_ready),
    .io_in_2_valid(backend_io_in_2_valid),
    .io_in_2_bits_instr(backend_io_in_2_bits_instr),
    .io_in_2_bits_pc(backend_io_in_2_bits_pc),
    .io_in_2_bits_pdInfo_valid(backend_io_in_2_bits_pdInfo_valid),
    .io_in_2_bits_pdInfo_isBr(backend_io_in_2_bits_pdInfo_isBr),
    .io_in_2_bits_pdInfo_isJal(backend_io_in_2_bits_pdInfo_isJal),
    .io_in_2_bits_pdInfo_isJalr(backend_io_in_2_bits_pdInfo_isJalr),
    .io_in_2_bits_pdInfo_isCall(backend_io_in_2_bits_pdInfo_isCall),
    .io_in_2_bits_pdInfo_isRet(backend_io_in_2_bits_pdInfo_isRet),
    .io_in_2_bits_pdInfo_jumpTarget(backend_io_in_2_bits_pdInfo_jumpTarget),
    .io_in_2_bits_bpuInfo_pc(backend_io_in_2_bits_bpuInfo_pc),
    .io_in_2_bits_bpuInfo_fallThrough(backend_io_in_2_bits_bpuInfo_fallThrough),
    .io_in_2_bits_bpuInfo_taken(backend_io_in_2_bits_bpuInfo_taken),
    .io_in_2_bits_bpuInfo_target(backend_io_in_2_bits_bpuInfo_target),
    .io_in_2_bits_bpuInfo_takenOffset(backend_io_in_2_bits_bpuInfo_takenOffset),
    .io_in_2_bits_bpuInfo_meta_btbHit(backend_io_in_2_bits_bpuInfo_meta_btbHit),
    .io_in_2_bits_bpuInfo_meta_btbIsJalr(backend_io_in_2_bits_bpuInfo_meta_btbIsJalr),
    .io_in_2_bits_bpuInfo_meta_btbIsJal(backend_io_in_2_bits_bpuInfo_meta_btbIsJal),
    .io_in_2_bits_bpuInfo_meta_btbIsCall(backend_io_in_2_bits_bpuInfo_meta_btbIsCall),
    .io_in_2_bits_bpuInfo_meta_btbIsRet(backend_io_in_2_bits_bpuInfo_meta_btbIsRet),
    .io_in_2_bits_bpuInfo_meta_btbOffset(backend_io_in_2_bits_bpuInfo_meta_btbOffset),
    .io_in_2_bits_bpuInfo_meta_phtCounter(backend_io_in_2_bits_bpuInfo_meta_phtCounter),
    .io_in_2_bits_bpuInfo_meta_rasTop(backend_io_in_2_bits_bpuInfo_meta_rasTop),
    .io_in_2_bits_bpuInfo_meta_predTaken(backend_io_in_2_bits_bpuInfo_meta_predTaken),
    .io_in_2_bits_bpuInfo_meta_predTarget(backend_io_in_2_bits_bpuInfo_meta_predTarget),
    .io_in_2_bits_exception_excpTlbRefill(backend_io_in_2_bits_exception_excpTlbRefill),
    .io_in_2_bits_exception_excpTlbPif(backend_io_in_2_bits_exception_excpTlbPif),
    .io_in_2_bits_exception_excpTlbPpi(backend_io_in_2_bits_exception_excpTlbPpi),
    .io_in_2_bits_exception_excpAdef(backend_io_in_2_bits_exception_excpAdef),
    .io_extInt(backend_io_extInt),
    .io_lsEnq_req_valid(backend_io_lsEnq_req_valid),
    .io_lsEnq_req_bits_robIdx_value(backend_io_lsEnq_req_bits_robIdx_value),
    .io_lsEnq_req_bits_robIdx_flag(backend_io_lsEnq_req_bits_robIdx_flag),
    .io_lsEnq_req_bits_isLoad(backend_io_lsEnq_req_bits_isLoad),
    .io_lsEnq_req_bits_isStore(backend_io_lsEnq_req_bits_isStore),
    .io_lsEnq_req_bits_sqIdx_value(backend_io_lsEnq_req_bits_sqIdx_value),
    .io_lsEnq_req_bits_sqIdx_flag(backend_io_lsEnq_req_bits_sqIdx_flag),
    .io_lsEnq_req_bits_lqIdx_value(backend_io_lsEnq_req_bits_lqIdx_value),
    .io_lsEnq_req_bits_lqIdx_flag(backend_io_lsEnq_req_bits_lqIdx_flag),
    .io_lsEnq_toLsqData_pc(backend_io_lsEnq_toLsqData_pc),
    .io_lsEnq_toLsqData_inst(backend_io_lsEnq_toLsqData_inst),
    .io_lsEnq_toLsqData_ctrl_fuType(backend_io_lsEnq_toLsqData_ctrl_fuType),
    .io_lsEnq_toLsqData_ctrl_aluOp(backend_io_lsEnq_toLsqData_ctrl_aluOp),
    .io_lsEnq_toLsqData_ctrl_bruOp(backend_io_lsEnq_toLsqData_ctrl_bruOp),
    .io_lsEnq_toLsqData_ctrl_lsuOp(backend_io_lsEnq_toLsqData_ctrl_lsuOp),
    .io_lsEnq_toLsqData_ctrl_csrOp(backend_io_lsEnq_toLsqData_ctrl_csrOp),
    .io_lsEnq_toLsqData_ctrl_mulOp(backend_io_lsEnq_toLsqData_ctrl_mulOp),
    .io_lsEnq_toLsqData_ctrl_divOp(backend_io_lsEnq_toLsqData_ctrl_divOp),
    .io_lsEnq_toLsqData_ctrl_src1Type(backend_io_lsEnq_toLsqData_ctrl_src1Type),
    .io_lsEnq_toLsqData_ctrl_src2Type(backend_io_lsEnq_toLsqData_ctrl_src2Type),
    .io_lsEnq_toLsqData_ctrl_immType(backend_io_lsEnq_toLsqData_ctrl_immType),
    .io_lsEnq_toLsqData_ctrl_rfWen(backend_io_lsEnq_toLsqData_ctrl_rfWen),
    .io_lsEnq_toLsqData_ctrl_memRead(backend_io_lsEnq_toLsqData_ctrl_memRead),
    .io_lsEnq_toLsqData_ctrl_memWrite(backend_io_lsEnq_toLsqData_ctrl_memWrite),
    .io_lsEnq_toLsqData_ctrl_csrWen(backend_io_lsEnq_toLsqData_ctrl_csrWen),
    .io_lsEnq_toLsqData_ctrl_isBranch(backend_io_lsEnq_toLsqData_ctrl_isBranch),
    .io_lsEnq_toLsqData_ctrl_isJump(backend_io_lsEnq_toLsqData_ctrl_isJump),
    .io_lsEnq_toLsqData_ctrl_isPriv(backend_io_lsEnq_toLsqData_ctrl_isPriv),
    .io_lsEnq_toLsqData_excpVec(backend_io_lsEnq_toLsqData_excpVec),
    .io_lsEnq_toLsqData_imm(backend_io_lsEnq_toLsqData_imm),
    .io_lsEnq_toLsqData_csrAddress(backend_io_lsEnq_toLsqData_csrAddress),
    .io_lsEnq_toLsqData_pdInfo_valid(backend_io_lsEnq_toLsqData_pdInfo_valid),
    .io_lsEnq_toLsqData_pdInfo_isBr(backend_io_lsEnq_toLsqData_pdInfo_isBr),
    .io_lsEnq_toLsqData_pdInfo_isJal(backend_io_lsEnq_toLsqData_pdInfo_isJal),
    .io_lsEnq_toLsqData_pdInfo_isJalr(backend_io_lsEnq_toLsqData_pdInfo_isJalr),
    .io_lsEnq_toLsqData_pdInfo_isCall(backend_io_lsEnq_toLsqData_pdInfo_isCall),
    .io_lsEnq_toLsqData_pdInfo_isRet(backend_io_lsEnq_toLsqData_pdInfo_isRet),
    .io_lsEnq_toLsqData_pdInfo_jumpTarget(backend_io_lsEnq_toLsqData_pdInfo_jumpTarget),
    .io_lsEnq_toLsqData_bpuInfo_pc(backend_io_lsEnq_toLsqData_bpuInfo_pc),
    .io_lsEnq_toLsqData_bpuInfo_fallThrough(backend_io_lsEnq_toLsqData_bpuInfo_fallThrough),
    .io_lsEnq_toLsqData_bpuInfo_taken(backend_io_lsEnq_toLsqData_bpuInfo_taken),
    .io_lsEnq_toLsqData_bpuInfo_target(backend_io_lsEnq_toLsqData_bpuInfo_target),
    .io_lsEnq_toLsqData_bpuInfo_takenOffset(backend_io_lsEnq_toLsqData_bpuInfo_takenOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbHit(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbHit),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJalr),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsJal),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsCall),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbIsRet),
    .io_lsEnq_toLsqData_bpuInfo_meta_btbOffset(backend_io_lsEnq_toLsqData_bpuInfo_meta_btbOffset),
    .io_lsEnq_toLsqData_bpuInfo_meta_phtCounter(backend_io_lsEnq_toLsqData_bpuInfo_meta_phtCounter),
    .io_lsEnq_toLsqData_bpuInfo_meta_rasTop(backend_io_lsEnq_toLsqData_bpuInfo_meta_rasTop),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTaken(backend_io_lsEnq_toLsqData_bpuInfo_meta_predTaken),
    .io_lsEnq_toLsqData_bpuInfo_meta_predTarget(backend_io_lsEnq_toLsqData_bpuInfo_meta_predTarget),
    .io_lsEnq_toLsqData_ldst(backend_io_lsEnq_toLsqData_ldst),
    .io_lsEnq_toLsqData_lrs1(backend_io_lsEnq_toLsqData_lrs1),
    .io_lsEnq_toLsqData_lrs2(backend_io_lsEnq_toLsqData_lrs2),
    .io_lsEnq_toLsqData_pdst(backend_io_lsEnq_toLsqData_pdst),
    .io_lsEnq_toLsqData_prs1(backend_io_lsEnq_toLsqData_prs1),
    .io_lsEnq_toLsqData_prs2(backend_io_lsEnq_toLsqData_prs2),
    .io_lsEnq_toLsqData_oldPdst(backend_io_lsEnq_toLsqData_oldPdst),
    .io_lsEnq_toLsqData_rs1Valid(backend_io_lsEnq_toLsqData_rs1Valid),
    .io_lsEnq_toLsqData_rs2Valid(backend_io_lsEnq_toLsqData_rs2Valid),
    .io_lsEnq_toLsqData_rdValid(backend_io_lsEnq_toLsqData_rdValid),
    .io_lsEnq_toLsqData_robIdx_value(backend_io_lsEnq_toLsqData_robIdx_value),
    .io_lsEnq_toLsqData_robIdx_flag(backend_io_lsEnq_toLsqData_robIdx_flag),
    .io_lsEnq_lqFull(backend_io_lsEnq_lqFull),
    .io_lsEnq_sqFull(backend_io_lsEnq_sqFull),
    .io_toMemResult_0_ready(backend_io_toMemResult_0_ready),
    .io_toMemResult_0_valid(backend_io_toMemResult_0_valid),
    .io_toMemResult_0_bits_uop_pc(backend_io_toMemResult_0_bits_uop_pc),
    .io_toMemResult_0_bits_uop_inst(backend_io_toMemResult_0_bits_uop_inst),
    .io_toMemResult_0_bits_uop_ctrl_fuType(backend_io_toMemResult_0_bits_uop_ctrl_fuType),
    .io_toMemResult_0_bits_uop_ctrl_aluOp(backend_io_toMemResult_0_bits_uop_ctrl_aluOp),
    .io_toMemResult_0_bits_uop_ctrl_bruOp(backend_io_toMemResult_0_bits_uop_ctrl_bruOp),
    .io_toMemResult_0_bits_uop_ctrl_lsuOp(backend_io_toMemResult_0_bits_uop_ctrl_lsuOp),
    .io_toMemResult_0_bits_uop_ctrl_csrOp(backend_io_toMemResult_0_bits_uop_ctrl_csrOp),
    .io_toMemResult_0_bits_uop_ctrl_mulOp(backend_io_toMemResult_0_bits_uop_ctrl_mulOp),
    .io_toMemResult_0_bits_uop_ctrl_divOp(backend_io_toMemResult_0_bits_uop_ctrl_divOp),
    .io_toMemResult_0_bits_uop_ctrl_src1Type(backend_io_toMemResult_0_bits_uop_ctrl_src1Type),
    .io_toMemResult_0_bits_uop_ctrl_src2Type(backend_io_toMemResult_0_bits_uop_ctrl_src2Type),
    .io_toMemResult_0_bits_uop_ctrl_immType(backend_io_toMemResult_0_bits_uop_ctrl_immType),
    .io_toMemResult_0_bits_uop_ctrl_rfWen(backend_io_toMemResult_0_bits_uop_ctrl_rfWen),
    .io_toMemResult_0_bits_uop_ctrl_memRead(backend_io_toMemResult_0_bits_uop_ctrl_memRead),
    .io_toMemResult_0_bits_uop_ctrl_memWrite(backend_io_toMemResult_0_bits_uop_ctrl_memWrite),
    .io_toMemResult_0_bits_uop_ctrl_csrWen(backend_io_toMemResult_0_bits_uop_ctrl_csrWen),
    .io_toMemResult_0_bits_uop_ctrl_isBranch(backend_io_toMemResult_0_bits_uop_ctrl_isBranch),
    .io_toMemResult_0_bits_uop_ctrl_isJump(backend_io_toMemResult_0_bits_uop_ctrl_isJump),
    .io_toMemResult_0_bits_uop_ctrl_isPriv(backend_io_toMemResult_0_bits_uop_ctrl_isPriv),
    .io_toMemResult_0_bits_uop_excpVec(backend_io_toMemResult_0_bits_uop_excpVec),
    .io_toMemResult_0_bits_uop_imm(backend_io_toMemResult_0_bits_uop_imm),
    .io_toMemResult_0_bits_uop_csrAddress(backend_io_toMemResult_0_bits_uop_csrAddress),
    .io_toMemResult_0_bits_uop_pdInfo_valid(backend_io_toMemResult_0_bits_uop_pdInfo_valid),
    .io_toMemResult_0_bits_uop_pdInfo_isBr(backend_io_toMemResult_0_bits_uop_pdInfo_isBr),
    .io_toMemResult_0_bits_uop_pdInfo_isJal(backend_io_toMemResult_0_bits_uop_pdInfo_isJal),
    .io_toMemResult_0_bits_uop_pdInfo_isJalr(backend_io_toMemResult_0_bits_uop_pdInfo_isJalr),
    .io_toMemResult_0_bits_uop_pdInfo_isCall(backend_io_toMemResult_0_bits_uop_pdInfo_isCall),
    .io_toMemResult_0_bits_uop_pdInfo_isRet(backend_io_toMemResult_0_bits_uop_pdInfo_isRet),
    .io_toMemResult_0_bits_uop_pdInfo_jumpTarget(backend_io_toMemResult_0_bits_uop_pdInfo_jumpTarget),
    .io_toMemResult_0_bits_uop_bpuInfo_pc(backend_io_toMemResult_0_bits_uop_bpuInfo_pc),
    .io_toMemResult_0_bits_uop_bpuInfo_fallThrough(backend_io_toMemResult_0_bits_uop_bpuInfo_fallThrough),
    .io_toMemResult_0_bits_uop_bpuInfo_taken(backend_io_toMemResult_0_bits_uop_bpuInfo_taken),
    .io_toMemResult_0_bits_uop_bpuInfo_target(backend_io_toMemResult_0_bits_uop_bpuInfo_target),
    .io_toMemResult_0_bits_uop_bpuInfo_takenOffset(backend_io_toMemResult_0_bits_uop_bpuInfo_takenOffset),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbHit),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsJal),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsCall),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbIsRet),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_btbOffset),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_phtCounter),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_rasTop),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTaken),
    .io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget(backend_io_toMemResult_0_bits_uop_bpuInfo_meta_predTarget),
    .io_toMemResult_0_bits_uop_ldst(backend_io_toMemResult_0_bits_uop_ldst),
    .io_toMemResult_0_bits_uop_lrs1(backend_io_toMemResult_0_bits_uop_lrs1),
    .io_toMemResult_0_bits_uop_lrs2(backend_io_toMemResult_0_bits_uop_lrs2),
    .io_toMemResult_0_bits_uop_pdst(backend_io_toMemResult_0_bits_uop_pdst),
    .io_toMemResult_0_bits_uop_prs1(backend_io_toMemResult_0_bits_uop_prs1),
    .io_toMemResult_0_bits_uop_prs2(backend_io_toMemResult_0_bits_uop_prs2),
    .io_toMemResult_0_bits_uop_oldPdst(backend_io_toMemResult_0_bits_uop_oldPdst),
    .io_toMemResult_0_bits_uop_rs1Valid(backend_io_toMemResult_0_bits_uop_rs1Valid),
    .io_toMemResult_0_bits_uop_rs2Valid(backend_io_toMemResult_0_bits_uop_rs2Valid),
    .io_toMemResult_0_bits_uop_rdValid(backend_io_toMemResult_0_bits_uop_rdValid),
    .io_toMemResult_0_bits_uop_robIdx_value(backend_io_toMemResult_0_bits_uop_robIdx_value),
    .io_toMemResult_0_bits_uop_robIdx_flag(backend_io_toMemResult_0_bits_uop_robIdx_flag),
    .io_toMemResult_0_bits_uop_robIdxFull_value(backend_io_toMemResult_0_bits_uop_robIdxFull_value),
    .io_toMemResult_0_bits_uop_robIdxFull_flag(backend_io_toMemResult_0_bits_uop_robIdxFull_flag),
    .io_toMemResult_0_bits_uop_lqIdx_value(backend_io_toMemResult_0_bits_uop_lqIdx_value),
    .io_toMemResult_0_bits_uop_lqIdx_flag(backend_io_toMemResult_0_bits_uop_lqIdx_flag),
    .io_toMemResult_0_bits_uop_sqIdx_value(backend_io_toMemResult_0_bits_uop_sqIdx_value),
    .io_toMemResult_0_bits_uop_sqIdx_flag(backend_io_toMemResult_0_bits_uop_sqIdx_flag),
    .io_toMemResult_0_bits_uop_issueQueue(backend_io_toMemResult_0_bits_uop_issueQueue),
    .io_toMemResult_0_bits_uop_prs1Busy(backend_io_toMemResult_0_bits_uop_prs1Busy),
    .io_toMemResult_0_bits_uop_prs2Busy(backend_io_toMemResult_0_bits_uop_prs2Busy),
    .io_toMemResult_0_bits_uop_isSta(backend_io_toMemResult_0_bits_uop_isSta),
    .io_toMemResult_0_bits_uop_isStd(backend_io_toMemResult_0_bits_uop_isStd),
    .io_toMemResult_0_bits_data(backend_io_toMemResult_0_bits_data),
    .io_toMemResult_0_bits_redirect_valid(backend_io_toMemResult_0_bits_redirect_valid),
    .io_toMemResult_0_bits_redirect_bits_valid(backend_io_toMemResult_0_bits_redirect_bits_valid),
    .io_toMemResult_0_bits_redirect_bits_robIdx_value(backend_io_toMemResult_0_bits_redirect_bits_robIdx_value),
    .io_toMemResult_0_bits_redirect_bits_robIdx_flag(backend_io_toMemResult_0_bits_redirect_bits_robIdx_flag),
    .io_toMemResult_0_bits_memValid(backend_io_toMemResult_0_bits_memValid),
    .io_toMemResult_0_bits_memRead(backend_io_toMemResult_0_bits_memRead),
    .io_toMemResult_0_bits_memWrite(backend_io_toMemResult_0_bits_memWrite),
    .io_toMemResult_0_bits_memVaddr(backend_io_toMemResult_0_bits_memVaddr),
    .io_toMemResult_0_bits_memPaddr(backend_io_toMemResult_0_bits_memPaddr),
    .io_toMemResult_0_bits_memStoreData(backend_io_toMemResult_0_bits_memStoreData),
    .io_toMemResult_1_ready(backend_io_toMemResult_1_ready),
    .io_toMemResult_1_valid(backend_io_toMemResult_1_valid),
    .io_toMemResult_1_bits_uop_pc(backend_io_toMemResult_1_bits_uop_pc),
    .io_toMemResult_1_bits_uop_inst(backend_io_toMemResult_1_bits_uop_inst),
    .io_toMemResult_1_bits_uop_ctrl_fuType(backend_io_toMemResult_1_bits_uop_ctrl_fuType),
    .io_toMemResult_1_bits_uop_ctrl_aluOp(backend_io_toMemResult_1_bits_uop_ctrl_aluOp),
    .io_toMemResult_1_bits_uop_ctrl_bruOp(backend_io_toMemResult_1_bits_uop_ctrl_bruOp),
    .io_toMemResult_1_bits_uop_ctrl_lsuOp(backend_io_toMemResult_1_bits_uop_ctrl_lsuOp),
    .io_toMemResult_1_bits_uop_ctrl_csrOp(backend_io_toMemResult_1_bits_uop_ctrl_csrOp),
    .io_toMemResult_1_bits_uop_ctrl_mulOp(backend_io_toMemResult_1_bits_uop_ctrl_mulOp),
    .io_toMemResult_1_bits_uop_ctrl_divOp(backend_io_toMemResult_1_bits_uop_ctrl_divOp),
    .io_toMemResult_1_bits_uop_ctrl_src1Type(backend_io_toMemResult_1_bits_uop_ctrl_src1Type),
    .io_toMemResult_1_bits_uop_ctrl_src2Type(backend_io_toMemResult_1_bits_uop_ctrl_src2Type),
    .io_toMemResult_1_bits_uop_ctrl_immType(backend_io_toMemResult_1_bits_uop_ctrl_immType),
    .io_toMemResult_1_bits_uop_ctrl_rfWen(backend_io_toMemResult_1_bits_uop_ctrl_rfWen),
    .io_toMemResult_1_bits_uop_ctrl_memRead(backend_io_toMemResult_1_bits_uop_ctrl_memRead),
    .io_toMemResult_1_bits_uop_ctrl_memWrite(backend_io_toMemResult_1_bits_uop_ctrl_memWrite),
    .io_toMemResult_1_bits_uop_ctrl_csrWen(backend_io_toMemResult_1_bits_uop_ctrl_csrWen),
    .io_toMemResult_1_bits_uop_ctrl_isBranch(backend_io_toMemResult_1_bits_uop_ctrl_isBranch),
    .io_toMemResult_1_bits_uop_ctrl_isJump(backend_io_toMemResult_1_bits_uop_ctrl_isJump),
    .io_toMemResult_1_bits_uop_ctrl_isPriv(backend_io_toMemResult_1_bits_uop_ctrl_isPriv),
    .io_toMemResult_1_bits_uop_excpVec(backend_io_toMemResult_1_bits_uop_excpVec),
    .io_toMemResult_1_bits_uop_imm(backend_io_toMemResult_1_bits_uop_imm),
    .io_toMemResult_1_bits_uop_csrAddress(backend_io_toMemResult_1_bits_uop_csrAddress),
    .io_toMemResult_1_bits_uop_pdInfo_valid(backend_io_toMemResult_1_bits_uop_pdInfo_valid),
    .io_toMemResult_1_bits_uop_pdInfo_isBr(backend_io_toMemResult_1_bits_uop_pdInfo_isBr),
    .io_toMemResult_1_bits_uop_pdInfo_isJal(backend_io_toMemResult_1_bits_uop_pdInfo_isJal),
    .io_toMemResult_1_bits_uop_pdInfo_isJalr(backend_io_toMemResult_1_bits_uop_pdInfo_isJalr),
    .io_toMemResult_1_bits_uop_pdInfo_isCall(backend_io_toMemResult_1_bits_uop_pdInfo_isCall),
    .io_toMemResult_1_bits_uop_pdInfo_isRet(backend_io_toMemResult_1_bits_uop_pdInfo_isRet),
    .io_toMemResult_1_bits_uop_pdInfo_jumpTarget(backend_io_toMemResult_1_bits_uop_pdInfo_jumpTarget),
    .io_toMemResult_1_bits_uop_bpuInfo_pc(backend_io_toMemResult_1_bits_uop_bpuInfo_pc),
    .io_toMemResult_1_bits_uop_bpuInfo_fallThrough(backend_io_toMemResult_1_bits_uop_bpuInfo_fallThrough),
    .io_toMemResult_1_bits_uop_bpuInfo_taken(backend_io_toMemResult_1_bits_uop_bpuInfo_taken),
    .io_toMemResult_1_bits_uop_bpuInfo_target(backend_io_toMemResult_1_bits_uop_bpuInfo_target),
    .io_toMemResult_1_bits_uop_bpuInfo_takenOffset(backend_io_toMemResult_1_bits_uop_bpuInfo_takenOffset),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbHit),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJalr),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsJal),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsCall),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbIsRet),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_btbOffset),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_phtCounter),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_rasTop),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTaken),
    .io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget(backend_io_toMemResult_1_bits_uop_bpuInfo_meta_predTarget),
    .io_toMemResult_1_bits_uop_ldst(backend_io_toMemResult_1_bits_uop_ldst),
    .io_toMemResult_1_bits_uop_lrs1(backend_io_toMemResult_1_bits_uop_lrs1),
    .io_toMemResult_1_bits_uop_lrs2(backend_io_toMemResult_1_bits_uop_lrs2),
    .io_toMemResult_1_bits_uop_pdst(backend_io_toMemResult_1_bits_uop_pdst),
    .io_toMemResult_1_bits_uop_prs1(backend_io_toMemResult_1_bits_uop_prs1),
    .io_toMemResult_1_bits_uop_prs2(backend_io_toMemResult_1_bits_uop_prs2),
    .io_toMemResult_1_bits_uop_oldPdst(backend_io_toMemResult_1_bits_uop_oldPdst),
    .io_toMemResult_1_bits_uop_rs1Valid(backend_io_toMemResult_1_bits_uop_rs1Valid),
    .io_toMemResult_1_bits_uop_rs2Valid(backend_io_toMemResult_1_bits_uop_rs2Valid),
    .io_toMemResult_1_bits_uop_rdValid(backend_io_toMemResult_1_bits_uop_rdValid),
    .io_toMemResult_1_bits_uop_robIdx_value(backend_io_toMemResult_1_bits_uop_robIdx_value),
    .io_toMemResult_1_bits_uop_robIdx_flag(backend_io_toMemResult_1_bits_uop_robIdx_flag),
    .io_toMemResult_1_bits_uop_robIdxFull_value(backend_io_toMemResult_1_bits_uop_robIdxFull_value),
    .io_toMemResult_1_bits_uop_robIdxFull_flag(backend_io_toMemResult_1_bits_uop_robIdxFull_flag),
    .io_toMemResult_1_bits_uop_lqIdx_value(backend_io_toMemResult_1_bits_uop_lqIdx_value),
    .io_toMemResult_1_bits_uop_lqIdx_flag(backend_io_toMemResult_1_bits_uop_lqIdx_flag),
    .io_toMemResult_1_bits_uop_sqIdx_value(backend_io_toMemResult_1_bits_uop_sqIdx_value),
    .io_toMemResult_1_bits_uop_sqIdx_flag(backend_io_toMemResult_1_bits_uop_sqIdx_flag),
    .io_toMemResult_1_bits_uop_issueQueue(backend_io_toMemResult_1_bits_uop_issueQueue),
    .io_toMemResult_1_bits_uop_prs1Busy(backend_io_toMemResult_1_bits_uop_prs1Busy),
    .io_toMemResult_1_bits_uop_prs2Busy(backend_io_toMemResult_1_bits_uop_prs2Busy),
    .io_toMemResult_1_bits_uop_isSta(backend_io_toMemResult_1_bits_uop_isSta),
    .io_toMemResult_1_bits_uop_isStd(backend_io_toMemResult_1_bits_uop_isStd),
    .io_toMemResult_1_bits_data(backend_io_toMemResult_1_bits_data),
    .io_toMemResult_1_bits_redirect_valid(backend_io_toMemResult_1_bits_redirect_valid),
    .io_toMemResult_1_bits_redirect_bits_valid(backend_io_toMemResult_1_bits_redirect_bits_valid),
    .io_toMemResult_1_bits_redirect_bits_robIdx_value(backend_io_toMemResult_1_bits_redirect_bits_robIdx_value),
    .io_toMemResult_1_bits_redirect_bits_robIdx_flag(backend_io_toMemResult_1_bits_redirect_bits_robIdx_flag),
    .io_toMemResult_1_bits_memValid(backend_io_toMemResult_1_bits_memValid),
    .io_toMemResult_1_bits_memRead(backend_io_toMemResult_1_bits_memRead),
    .io_toMemResult_1_bits_memWrite(backend_io_toMemResult_1_bits_memWrite),
    .io_toMemResult_1_bits_memVaddr(backend_io_toMemResult_1_bits_memVaddr),
    .io_toMemResult_1_bits_memPaddr(backend_io_toMemResult_1_bits_memPaddr),
    .io_toMemResult_1_bits_memStoreData(backend_io_toMemResult_1_bits_memStoreData),
    .io_fromMemResult_0_ready(backend_io_fromMemResult_0_ready),
    .io_fromMemResult_0_valid(backend_io_fromMemResult_0_valid),
    .io_fromMemResult_0_bits_uop_pc(backend_io_fromMemResult_0_bits_uop_pc),
    .io_fromMemResult_0_bits_uop_ctrl_fuType(backend_io_fromMemResult_0_bits_uop_ctrl_fuType),
    .io_fromMemResult_0_bits_uop_ctrl_lsuOp(backend_io_fromMemResult_0_bits_uop_ctrl_lsuOp),
    .io_fromMemResult_0_bits_uop_ctrl_rfWen(backend_io_fromMemResult_0_bits_uop_ctrl_rfWen),
    .io_fromMemResult_0_bits_uop_excpVec(backend_io_fromMemResult_0_bits_uop_excpVec),
    .io_fromMemResult_0_bits_uop_pdst(backend_io_fromMemResult_0_bits_uop_pdst),
    .io_fromMemResult_0_bits_uop_rdValid(backend_io_fromMemResult_0_bits_uop_rdValid),
    .io_fromMemResult_0_bits_uop_robIdx_value(backend_io_fromMemResult_0_bits_uop_robIdx_value),
    .io_fromMemResult_0_bits_uop_robIdx_flag(backend_io_fromMemResult_0_bits_uop_robIdx_flag),
    .io_fromMemResult_0_bits_uop_robIdxFull_value(backend_io_fromMemResult_0_bits_uop_robIdxFull_value),
    .io_fromMemResult_0_bits_uop_robIdxFull_flag(backend_io_fromMemResult_0_bits_uop_robIdxFull_flag),
    .io_fromMemResult_0_bits_uop_lqIdx_value(backend_io_fromMemResult_0_bits_uop_lqIdx_value),
    .io_fromMemResult_0_bits_uop_sqIdx_value(backend_io_fromMemResult_0_bits_uop_sqIdx_value),
    .io_fromMemResult_0_bits_data(backend_io_fromMemResult_0_bits_data),
    .io_fromMemResult_0_bits_redirect_valid(backend_io_fromMemResult_0_bits_redirect_valid),
    .io_fromMemResult_0_bits_redirect_bits_valid(backend_io_fromMemResult_0_bits_redirect_bits_valid),
    .io_fromMemResult_0_bits_redirect_bits_robIdx_value(backend_io_fromMemResult_0_bits_redirect_bits_robIdx_value),
    .io_fromMemResult_0_bits_redirect_bits_robIdx_flag(backend_io_fromMemResult_0_bits_redirect_bits_robIdx_flag),
    .io_fromMemResult_0_bits_memVaddr(backend_io_fromMemResult_0_bits_memVaddr),
    .io_fromMemResult_0_bits_memPaddr(backend_io_fromMemResult_0_bits_memPaddr),
    .io_fromMemResult_1_ready(backend_io_fromMemResult_1_ready),
    .io_fromMemResult_1_valid(backend_io_fromMemResult_1_valid),
    .io_fromMemResult_1_bits_uop_pc(backend_io_fromMemResult_1_bits_uop_pc),
    .io_fromMemResult_1_bits_uop_ctrl_fuType(backend_io_fromMemResult_1_bits_uop_ctrl_fuType),
    .io_fromMemResult_1_bits_uop_ctrl_lsuOp(backend_io_fromMemResult_1_bits_uop_ctrl_lsuOp),
    .io_fromMemResult_1_bits_uop_excpVec(backend_io_fromMemResult_1_bits_uop_excpVec),
    .io_fromMemResult_1_bits_uop_pdst(backend_io_fromMemResult_1_bits_uop_pdst),
    .io_fromMemResult_1_bits_uop_robIdx_value(backend_io_fromMemResult_1_bits_uop_robIdx_value),
    .io_fromMemResult_1_bits_uop_robIdx_flag(backend_io_fromMemResult_1_bits_uop_robIdx_flag),
    .io_fromMemResult_1_bits_uop_robIdxFull_value(backend_io_fromMemResult_1_bits_uop_robIdxFull_value),
    .io_fromMemResult_1_bits_uop_robIdxFull_flag(backend_io_fromMemResult_1_bits_uop_robIdxFull_flag),
    .io_fromMemResult_1_bits_uop_lqIdx_value(backend_io_fromMemResult_1_bits_uop_lqIdx_value),
    .io_fromMemResult_1_bits_uop_sqIdx_value(backend_io_fromMemResult_1_bits_uop_sqIdx_value),
    .io_fromMemResult_1_bits_redirect_valid(backend_io_fromMemResult_1_bits_redirect_valid),
    .io_fromMemResult_1_bits_redirect_bits_valid(backend_io_fromMemResult_1_bits_redirect_bits_valid),
    .io_fromMemResult_1_bits_redirect_bits_robIdx_value(backend_io_fromMemResult_1_bits_redirect_bits_robIdx_value),
    .io_fromMemResult_1_bits_redirect_bits_robIdx_flag(backend_io_fromMemResult_1_bits_redirect_bits_robIdx_flag),
    .io_fromMemResult_1_bits_memVaddr(backend_io_fromMemResult_1_bits_memVaddr),
    .io_fromMemResult_1_bits_memPaddr(backend_io_fromMemResult_1_bits_memPaddr),
    .io_fromMemResult_1_bits_memStoreData(backend_io_fromMemResult_1_bits_memStoreData),
    .io_commitToSq_valid_0(backend_io_commitToSq_valid_0),
    .io_commitToSq_bits_0_sqIdx_value(backend_io_commitToSq_bits_0_sqIdx_value),
    .difftest_commit_0_valid(backend_difftest_commit_0_valid),
    .difftest_commit_0_pc(backend_difftest_commit_0_pc),
    .difftest_commit_0_instr(backend_difftest_commit_0_instr),
    .difftest_commit_0_rfWen(backend_difftest_commit_0_rfWen),
    .difftest_commit_0_wdest(backend_difftest_commit_0_wdest),
    .difftest_commit_0_wdata(backend_difftest_commit_0_wdata),
    .difftest_commit_0_isCntInst(backend_difftest_commit_0_isCntInst),
    .difftest_commit_0_csrRstat(backend_difftest_commit_0_csrRstat),
    .difftest_commit_0_csrData(backend_difftest_commit_0_csrData),
    .difftest_commit_0_excpFlush(backend_difftest_commit_0_excpFlush),
    .difftest_commit_0_ertnFlush(backend_difftest_commit_0_ertnFlush),
    .difftest_commit_0_csrEcode(backend_difftest_commit_0_csrEcode),
    .difftest_commit_0_trap(backend_difftest_commit_0_trap),
    .difftest_commit_0_load_valid(backend_difftest_commit_0_load_valid),
    .difftest_commit_0_load_paddr(backend_difftest_commit_0_load_paddr),
    .difftest_commit_0_load_vaddr(backend_difftest_commit_0_load_vaddr),
    .difftest_commit_0_store_valid(backend_difftest_commit_0_store_valid),
    .difftest_commit_0_store_paddr(backend_difftest_commit_0_store_paddr),
    .difftest_commit_0_store_vaddr(backend_difftest_commit_0_store_vaddr),
    .difftest_commit_0_store_data(backend_difftest_commit_0_store_data),
    .difftest_regs_0(backend_difftest_regs_0),
    .difftest_regs_1(backend_difftest_regs_1),
    .difftest_regs_2(backend_difftest_regs_2),
    .difftest_regs_3(backend_difftest_regs_3),
    .difftest_regs_4(backend_difftest_regs_4),
    .difftest_regs_5(backend_difftest_regs_5),
    .difftest_regs_6(backend_difftest_regs_6),
    .difftest_regs_7(backend_difftest_regs_7),
    .difftest_regs_8(backend_difftest_regs_8),
    .difftest_regs_9(backend_difftest_regs_9),
    .difftest_regs_10(backend_difftest_regs_10),
    .difftest_regs_11(backend_difftest_regs_11),
    .difftest_regs_12(backend_difftest_regs_12),
    .difftest_regs_13(backend_difftest_regs_13),
    .difftest_regs_14(backend_difftest_regs_14),
    .difftest_regs_15(backend_difftest_regs_15),
    .difftest_regs_16(backend_difftest_regs_16),
    .difftest_regs_17(backend_difftest_regs_17),
    .difftest_regs_18(backend_difftest_regs_18),
    .difftest_regs_19(backend_difftest_regs_19),
    .difftest_regs_20(backend_difftest_regs_20),
    .difftest_regs_21(backend_difftest_regs_21),
    .difftest_regs_22(backend_difftest_regs_22),
    .difftest_regs_23(backend_difftest_regs_23),
    .difftest_regs_24(backend_difftest_regs_24),
    .difftest_regs_25(backend_difftest_regs_25),
    .difftest_regs_26(backend_difftest_regs_26),
    .difftest_regs_27(backend_difftest_regs_27),
    .difftest_regs_28(backend_difftest_regs_28),
    .difftest_regs_29(backend_difftest_regs_29),
    .difftest_regs_30(backend_difftest_regs_30),
    .difftest_regs_31(backend_difftest_regs_31)
  );
  MemoryBlock memory ( // @[\\src\\main\\scala\\myCPU_top.scala 108:22]
    .clock(memory_clock),
    .reset(memory_reset),
    .io_lsEnq_req_valid(memory_io_lsEnq_req_valid),
    .io_lsEnq_req_bits_robIdx_value(memory_io_lsEnq_req_bits_robIdx_value),
    .io_lsEnq_req_bits_robIdx_flag(memory_io_lsEnq_req_bits_robIdx_flag),
    .io_lsEnq_req_bits_isLoad(memory_io_lsEnq_req_bits_isLoad),
    .io_lsEnq_req_bits_isStore(memory_io_lsEnq_req_bits_isStore),
    .io_lsEnq_req_bits_sqIdx_value(memory_io_lsEnq_req_bits_sqIdx_value),
    .io_lsEnq_req_bits_lqIdx_value(memory_io_lsEnq_req_bits_lqIdx_value),
    .io_lsEnq_toLsqData_pc(memory_io_lsEnq_toLsqData_pc),
    .io_lsEnq_toLsqData_ctrl_fuType(memory_io_lsEnq_toLsqData_ctrl_fuType),
    .io_lsEnq_toLsqData_ctrl_lsuOp(memory_io_lsEnq_toLsqData_ctrl_lsuOp),
    .io_lsEnq_toLsqData_ctrl_rfWen(memory_io_lsEnq_toLsqData_ctrl_rfWen),
    .io_lsEnq_toLsqData_pdst(memory_io_lsEnq_toLsqData_pdst),
    .io_lsEnq_lqFull(memory_io_lsEnq_lqFull),
    .io_lsEnq_sqFull(memory_io_lsEnq_sqFull),
    .io_fromExeMmuResult_ready(memory_io_fromExeMmuResult_ready),
    .io_fromExeMmuResult_valid(memory_io_fromExeMmuResult_valid),
    .io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead(memory_io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead),
    .io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value(memory_io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value),
    .io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value(memory_io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value),
    .io_fromExeMmuResult_bits_exeRes_uop_isSta(memory_io_fromExeMmuResult_bits_exeRes_uop_isSta),
    .io_fromExeMmuResult_bits_exeRes_data(memory_io_fromExeMmuResult_bits_exeRes_data),
    .io_fromExeMmuResult_bits_mmuRes_paddr(memory_io_fromExeMmuResult_bits_mmuRes_paddr),
    .io_fromExeMmuResult_bits_mmuRes_cacheable(memory_io_fromExeMmuResult_bits_mmuRes_cacheable),
    .io_fromExeResult_ready(memory_io_fromExeResult_ready),
    .io_fromExeResult_valid(memory_io_fromExeResult_valid),
    .io_fromExeResult_bits_uop_sqIdx_value(memory_io_fromExeResult_bits_uop_sqIdx_value),
    .io_fromExeResult_bits_uop_isStd(memory_io_fromExeResult_bits_uop_isStd),
    .io_fromExeResult_bits_data(memory_io_fromExeResult_bits_data),
    .io_toWbResult_0_ready(memory_io_toWbResult_0_ready),
    .io_toWbResult_0_valid(memory_io_toWbResult_0_valid),
    .io_toWbResult_0_bits_uop_pc(memory_io_toWbResult_0_bits_uop_pc),
    .io_toWbResult_0_bits_uop_ctrl_fuType(memory_io_toWbResult_0_bits_uop_ctrl_fuType),
    .io_toWbResult_0_bits_uop_ctrl_lsuOp(memory_io_toWbResult_0_bits_uop_ctrl_lsuOp),
    .io_toWbResult_0_bits_uop_ctrl_rfWen(memory_io_toWbResult_0_bits_uop_ctrl_rfWen),
    .io_toWbResult_0_bits_uop_excpVec(memory_io_toWbResult_0_bits_uop_excpVec),
    .io_toWbResult_0_bits_uop_pdst(memory_io_toWbResult_0_bits_uop_pdst),
    .io_toWbResult_0_bits_uop_rdValid(memory_io_toWbResult_0_bits_uop_rdValid),
    .io_toWbResult_0_bits_uop_robIdx_value(memory_io_toWbResult_0_bits_uop_robIdx_value),
    .io_toWbResult_0_bits_uop_robIdx_flag(memory_io_toWbResult_0_bits_uop_robIdx_flag),
    .io_toWbResult_0_bits_uop_robIdxFull_value(memory_io_toWbResult_0_bits_uop_robIdxFull_value),
    .io_toWbResult_0_bits_uop_robIdxFull_flag(memory_io_toWbResult_0_bits_uop_robIdxFull_flag),
    .io_toWbResult_0_bits_uop_lqIdx_value(memory_io_toWbResult_0_bits_uop_lqIdx_value),
    .io_toWbResult_0_bits_uop_sqIdx_value(memory_io_toWbResult_0_bits_uop_sqIdx_value),
    .io_toWbResult_0_bits_data(memory_io_toWbResult_0_bits_data),
    .io_toWbResult_0_bits_redirect_valid(memory_io_toWbResult_0_bits_redirect_valid),
    .io_toWbResult_0_bits_redirect_bits_valid(memory_io_toWbResult_0_bits_redirect_bits_valid),
    .io_toWbResult_0_bits_redirect_bits_robIdx_value(memory_io_toWbResult_0_bits_redirect_bits_robIdx_value),
    .io_toWbResult_0_bits_redirect_bits_robIdx_flag(memory_io_toWbResult_0_bits_redirect_bits_robIdx_flag),
    .io_toWbResult_0_bits_memVaddr(memory_io_toWbResult_0_bits_memVaddr),
    .io_toWbResult_0_bits_memPaddr(memory_io_toWbResult_0_bits_memPaddr),
    .io_toWbResult_1_ready(memory_io_toWbResult_1_ready),
    .io_toWbResult_1_valid(memory_io_toWbResult_1_valid),
    .io_toWbResult_1_bits_uop_pc(memory_io_toWbResult_1_bits_uop_pc),
    .io_toWbResult_1_bits_uop_ctrl_fuType(memory_io_toWbResult_1_bits_uop_ctrl_fuType),
    .io_toWbResult_1_bits_uop_ctrl_lsuOp(memory_io_toWbResult_1_bits_uop_ctrl_lsuOp),
    .io_toWbResult_1_bits_uop_excpVec(memory_io_toWbResult_1_bits_uop_excpVec),
    .io_toWbResult_1_bits_uop_pdst(memory_io_toWbResult_1_bits_uop_pdst),
    .io_toWbResult_1_bits_uop_robIdx_value(memory_io_toWbResult_1_bits_uop_robIdx_value),
    .io_toWbResult_1_bits_uop_robIdx_flag(memory_io_toWbResult_1_bits_uop_robIdx_flag),
    .io_toWbResult_1_bits_uop_robIdxFull_value(memory_io_toWbResult_1_bits_uop_robIdxFull_value),
    .io_toWbResult_1_bits_uop_robIdxFull_flag(memory_io_toWbResult_1_bits_uop_robIdxFull_flag),
    .io_toWbResult_1_bits_uop_lqIdx_value(memory_io_toWbResult_1_bits_uop_lqIdx_value),
    .io_toWbResult_1_bits_uop_sqIdx_value(memory_io_toWbResult_1_bits_uop_sqIdx_value),
    .io_toWbResult_1_bits_redirect_valid(memory_io_toWbResult_1_bits_redirect_valid),
    .io_toWbResult_1_bits_redirect_bits_valid(memory_io_toWbResult_1_bits_redirect_bits_valid),
    .io_toWbResult_1_bits_redirect_bits_robIdx_value(memory_io_toWbResult_1_bits_redirect_bits_robIdx_value),
    .io_toWbResult_1_bits_redirect_bits_robIdx_flag(memory_io_toWbResult_1_bits_redirect_bits_robIdx_flag),
    .io_toWbResult_1_bits_memVaddr(memory_io_toWbResult_1_bits_memVaddr),
    .io_toWbResult_1_bits_memPaddr(memory_io_toWbResult_1_bits_memPaddr),
    .io_toWbResult_1_bits_memStoreData(memory_io_toWbResult_1_bits_memStoreData),
    .io_robCommit_0_valid(memory_io_robCommit_0_valid),
    .io_robCommit_0_sqIdx(memory_io_robCommit_0_sqIdx),
    .io_axi_ar_data_arid(memory_io_axi_ar_data_arid),
    .io_axi_ar_data_araddr(memory_io_axi_ar_data_araddr),
    .io_axi_ar_data_arlen(memory_io_axi_ar_data_arlen),
    .io_axi_ar_data_arsize(memory_io_axi_ar_data_arsize),
    .io_axi_ar_data_arburst(memory_io_axi_ar_data_arburst),
    .io_axi_ar_data_arvalid(memory_io_axi_ar_data_arvalid),
    .io_axi_ar_arready(memory_io_axi_ar_arready),
    .io_axi_aw_data_awid(memory_io_axi_aw_data_awid),
    .io_axi_aw_data_awaddr(memory_io_axi_aw_data_awaddr),
    .io_axi_aw_data_awlen(memory_io_axi_aw_data_awlen),
    .io_axi_aw_data_awsize(memory_io_axi_aw_data_awsize),
    .io_axi_aw_data_awburst(memory_io_axi_aw_data_awburst),
    .io_axi_aw_data_awvalid(memory_io_axi_aw_data_awvalid),
    .io_axi_aw_awready(memory_io_axi_aw_awready),
    .io_axi_w_data_wid(memory_io_axi_w_data_wid),
    .io_axi_w_data_wdata(memory_io_axi_w_data_wdata),
    .io_axi_w_data_wstrb(memory_io_axi_w_data_wstrb),
    .io_axi_w_data_wlast(memory_io_axi_w_data_wlast),
    .io_axi_w_data_wvalid(memory_io_axi_w_data_wvalid),
    .io_axi_w_wready(memory_io_axi_w_wready),
    .io_axi_r_data_rid(memory_io_axi_r_data_rid),
    .io_axi_r_data_rdata(memory_io_axi_r_data_rdata),
    .io_axi_r_data_rlast(memory_io_axi_r_data_rlast),
    .io_axi_r_data_rvalid(memory_io_axi_r_data_rvalid),
    .io_axi_r_rready(memory_io_axi_r_rready),
    .io_axi_b_data_bid(memory_io_axi_b_data_bid),
    .io_axi_b_data_bvalid(memory_io_axi_b_data_bvalid),
    .io_axi_b_bready(memory_io_axi_b_bready)
  );
  MemAddrTrans memaddrtrans ( // @[\\src\\main\\scala\\myCPU_top.scala 124:28]
    .clock(memaddrtrans_clock),
    .reset(memaddrtrans_reset),
    .io_in_ready(memaddrtrans_io_in_ready),
    .io_in_valid(memaddrtrans_io_in_valid),
    .io_in_bits_uop_ctrl_memRead(memaddrtrans_io_in_bits_uop_ctrl_memRead),
    .io_in_bits_uop_lqIdx_value(memaddrtrans_io_in_bits_uop_lqIdx_value),
    .io_in_bits_uop_sqIdx_value(memaddrtrans_io_in_bits_uop_sqIdx_value),
    .io_in_bits_uop_isSta(memaddrtrans_io_in_bits_uop_isSta),
    .io_in_bits_data(memaddrtrans_io_in_bits_data),
    .io_out_valid(memaddrtrans_io_out_valid),
    .io_out_bits_exeRes_uop_ctrl_memRead(memaddrtrans_io_out_bits_exeRes_uop_ctrl_memRead),
    .io_out_bits_exeRes_uop_lqIdx_value(memaddrtrans_io_out_bits_exeRes_uop_lqIdx_value),
    .io_out_bits_exeRes_uop_sqIdx_value(memaddrtrans_io_out_bits_exeRes_uop_sqIdx_value),
    .io_out_bits_exeRes_uop_isSta(memaddrtrans_io_out_bits_exeRes_uop_isSta),
    .io_out_bits_exeRes_data(memaddrtrans_io_out_bits_exeRes_data),
    .io_out_bits_mmuRes_paddr(memaddrtrans_io_out_bits_mmuRes_paddr),
    .io_out_bits_mmuRes_cacheable(memaddrtrans_io_out_bits_mmuRes_cacheable),
    .io_mmuReq_valid(memaddrtrans_io_mmuReq_valid),
    .io_mmuReq_bits_vaddr(memaddrtrans_io_mmuReq_bits_vaddr),
    .io_mmuResp_valid(memaddrtrans_io_mmuResp_valid),
    .io_mmuResp_bits_paddr(memaddrtrans_io_mmuResp_bits_paddr),
    .io_mmuResp_bits_cacheable(memaddrtrans_io_mmuResp_bits_cacheable)
  );
  SimpleMMU simMMU ( // @[\\src\\main\\scala\\myCPU_top.scala 128:22]
    .clock(simMMU_clock),
    .reset(simMMU_reset),
    .io_mmuReq_valid(simMMU_io_mmuReq_valid),
    .io_mmuReq_bits_vaddr(simMMU_io_mmuReq_bits_vaddr),
    .io_mmuResp_valid(simMMU_io_mmuResp_valid),
    .io_mmuResp_bits_paddr(simMMU_io_mmuResp_bits_paddr),
    .io_mmuResp_bits_cacheable(simMMU_io_mmuResp_bits_cacheable)
  );
  Mmu mmu ( // @[\\src\\main\\scala\\myCPU_top.scala 168:19]
    .clock(mmu_clock),
    .reset(mmu_reset),
    .io_fromIcache_ready(mmu_io_fromIcache_ready),
    .io_fromIcache_valid(mmu_io_fromIcache_valid),
    .io_fromIcache_bits_vaddr(mmu_io_fromIcache_bits_vaddr),
    .io_toIcache_ready(mmu_io_toIcache_ready),
    .io_toIcache_valid(mmu_io_toIcache_valid),
    .io_toIcache_bits_paddr(mmu_io_toIcache_bits_paddr),
    .io_toIcache_bits_cacheable(mmu_io_toIcache_bits_cacheable),
    .io_toIcache_bits_hasError(mmu_io_toIcache_bits_hasError),
    .io_toIcache_bits_error_excpTlbRefill(mmu_io_toIcache_bits_error_excpTlbRefill),
    .io_toIcache_bits_error_excpTlbPif(mmu_io_toIcache_bits_error_excpTlbPif),
    .io_toIcache_bits_error_excpTlbPpi(mmu_io_toIcache_bits_error_excpTlbPpi),
    .io_toIcache_bits_error_excpAdef(mmu_io_toIcache_bits_error_excpAdef)
  );
  CsrFile csr ( // @[\\src\\main\\scala\\myCPU_top.scala 180:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_irqBus(csr_io_irqBus),
    .difftest_estat(csr_difftest_estat),
    .difftest_timer64(csr_difftest_timer64)
  );
  cache_BlackBox uncache1 ( // @[\\src\\main\\scala\\myCPU_top.scala 209:24]
    .axi_master_ar_data_arid(uncache1_axi_master_ar_data_arid),
    .axi_master_ar_data_araddr(uncache1_axi_master_ar_data_araddr),
    .axi_master_ar_data_arlen(uncache1_axi_master_ar_data_arlen),
    .axi_master_ar_data_arsize(uncache1_axi_master_ar_data_arsize),
    .axi_master_ar_data_arburst(uncache1_axi_master_ar_data_arburst),
    .axi_master_ar_data_arlock(uncache1_axi_master_ar_data_arlock),
    .axi_master_ar_data_arcache(uncache1_axi_master_ar_data_arcache),
    .axi_master_ar_data_arprot(uncache1_axi_master_ar_data_arprot),
    .axi_master_ar_data_arvalid(uncache1_axi_master_ar_data_arvalid),
    .axi_master_ar_arready(uncache1_axi_master_ar_arready),
    .axi_master_aw_data_awid(uncache1_axi_master_aw_data_awid),
    .axi_master_aw_data_awaddr(uncache1_axi_master_aw_data_awaddr),
    .axi_master_aw_data_awlen(uncache1_axi_master_aw_data_awlen),
    .axi_master_aw_data_awsize(uncache1_axi_master_aw_data_awsize),
    .axi_master_aw_data_awburst(uncache1_axi_master_aw_data_awburst),
    .axi_master_aw_data_awlock(uncache1_axi_master_aw_data_awlock),
    .axi_master_aw_data_awcache(uncache1_axi_master_aw_data_awcache),
    .axi_master_aw_data_awprot(uncache1_axi_master_aw_data_awprot),
    .axi_master_aw_data_awvalid(uncache1_axi_master_aw_data_awvalid),
    .axi_master_aw_awready(uncache1_axi_master_aw_awready),
    .axi_master_w_data_wid(uncache1_axi_master_w_data_wid),
    .axi_master_w_data_wdata(uncache1_axi_master_w_data_wdata),
    .axi_master_w_data_wstrb(uncache1_axi_master_w_data_wstrb),
    .axi_master_w_data_wlast(uncache1_axi_master_w_data_wlast),
    .axi_master_w_data_wvalid(uncache1_axi_master_w_data_wvalid),
    .axi_master_w_wready(uncache1_axi_master_w_wready),
    .axi_master_r_data_rid(uncache1_axi_master_r_data_rid),
    .axi_master_r_data_rdata(uncache1_axi_master_r_data_rdata),
    .axi_master_r_data_rresp(uncache1_axi_master_r_data_rresp),
    .axi_master_r_data_rlast(uncache1_axi_master_r_data_rlast),
    .axi_master_r_data_rvalid(uncache1_axi_master_r_data_rvalid),
    .axi_master_r_rready(uncache1_axi_master_r_rready),
    .axi_master_b_data_bid(uncache1_axi_master_b_data_bid),
    .axi_master_b_data_bresp(uncache1_axi_master_b_data_bresp),
    .axi_master_b_data_bvalid(uncache1_axi_master_b_data_bvalid),
    .axi_master_b_bready(uncache1_axi_master_b_bready),
    .cpu_if_req_addr(uncache1_cpu_if_req_addr),
    .cpu_if_req_valid(uncache1_cpu_if_req_valid),
    .cpu_if_resp_data(uncache1_cpu_if_resp_data),
    .cpu_if_resp_valid(uncache1_cpu_if_resp_valid)
  );
  cache_BlackBox uncache2 ( // @[\\src\\main\\scala\\myCPU_top.scala 210:24]
    .axi_master_ar_data_arid(uncache2_axi_master_ar_data_arid),
    .axi_master_ar_data_araddr(uncache2_axi_master_ar_data_araddr),
    .axi_master_ar_data_arlen(uncache2_axi_master_ar_data_arlen),
    .axi_master_ar_data_arsize(uncache2_axi_master_ar_data_arsize),
    .axi_master_ar_data_arburst(uncache2_axi_master_ar_data_arburst),
    .axi_master_ar_data_arlock(uncache2_axi_master_ar_data_arlock),
    .axi_master_ar_data_arcache(uncache2_axi_master_ar_data_arcache),
    .axi_master_ar_data_arprot(uncache2_axi_master_ar_data_arprot),
    .axi_master_ar_data_arvalid(uncache2_axi_master_ar_data_arvalid),
    .axi_master_ar_arready(uncache2_axi_master_ar_arready),
    .axi_master_aw_data_awid(uncache2_axi_master_aw_data_awid),
    .axi_master_aw_data_awaddr(uncache2_axi_master_aw_data_awaddr),
    .axi_master_aw_data_awlen(uncache2_axi_master_aw_data_awlen),
    .axi_master_aw_data_awsize(uncache2_axi_master_aw_data_awsize),
    .axi_master_aw_data_awburst(uncache2_axi_master_aw_data_awburst),
    .axi_master_aw_data_awlock(uncache2_axi_master_aw_data_awlock),
    .axi_master_aw_data_awcache(uncache2_axi_master_aw_data_awcache),
    .axi_master_aw_data_awprot(uncache2_axi_master_aw_data_awprot),
    .axi_master_aw_data_awvalid(uncache2_axi_master_aw_data_awvalid),
    .axi_master_aw_awready(uncache2_axi_master_aw_awready),
    .axi_master_w_data_wid(uncache2_axi_master_w_data_wid),
    .axi_master_w_data_wdata(uncache2_axi_master_w_data_wdata),
    .axi_master_w_data_wstrb(uncache2_axi_master_w_data_wstrb),
    .axi_master_w_data_wlast(uncache2_axi_master_w_data_wlast),
    .axi_master_w_data_wvalid(uncache2_axi_master_w_data_wvalid),
    .axi_master_w_wready(uncache2_axi_master_w_wready),
    .axi_master_r_data_rid(uncache2_axi_master_r_data_rid),
    .axi_master_r_data_rdata(uncache2_axi_master_r_data_rdata),
    .axi_master_r_data_rresp(uncache2_axi_master_r_data_rresp),
    .axi_master_r_data_rlast(uncache2_axi_master_r_data_rlast),
    .axi_master_r_data_rvalid(uncache2_axi_master_r_data_rvalid),
    .axi_master_r_rready(uncache2_axi_master_r_rready),
    .axi_master_b_data_bid(uncache2_axi_master_b_data_bid),
    .axi_master_b_data_bresp(uncache2_axi_master_b_data_bresp),
    .axi_master_b_data_bvalid(uncache2_axi_master_b_data_bvalid),
    .axi_master_b_bready(uncache2_axi_master_b_bready),
    .cpu_if_req_addr(uncache2_cpu_if_req_addr),
    .cpu_if_req_valid(uncache2_cpu_if_req_valid),
    .cpu_if_resp_data(uncache2_cpu_if_resp_data),
    .cpu_if_resp_valid(uncache2_cpu_if_resp_valid)
  );
  AXI3Crossbar4to1 axi_crossbar ( // @[\\src\\main\\scala\\myCPU_top.scala 220:28]
    .clock(axi_crossbar_clock),
    .reset(axi_crossbar_reset),
    .io_in_icache_ar_data_arid(axi_crossbar_io_in_icache_ar_data_arid),
    .io_in_icache_ar_data_araddr(axi_crossbar_io_in_icache_ar_data_araddr),
    .io_in_icache_ar_data_arlen(axi_crossbar_io_in_icache_ar_data_arlen),
    .io_in_icache_ar_data_arsize(axi_crossbar_io_in_icache_ar_data_arsize),
    .io_in_icache_ar_data_arburst(axi_crossbar_io_in_icache_ar_data_arburst),
    .io_in_icache_ar_data_arvalid(axi_crossbar_io_in_icache_ar_data_arvalid),
    .io_in_icache_ar_arready(axi_crossbar_io_in_icache_ar_arready),
    .io_in_icache_r_data_rid(axi_crossbar_io_in_icache_r_data_rid),
    .io_in_icache_r_data_rdata(axi_crossbar_io_in_icache_r_data_rdata),
    .io_in_icache_r_data_rlast(axi_crossbar_io_in_icache_r_data_rlast),
    .io_in_icache_r_data_rvalid(axi_crossbar_io_in_icache_r_data_rvalid),
    .io_in_icache_r_rready(axi_crossbar_io_in_icache_r_rready),
    .io_in_dcache_ar_data_arid(axi_crossbar_io_in_dcache_ar_data_arid),
    .io_in_dcache_ar_data_araddr(axi_crossbar_io_in_dcache_ar_data_araddr),
    .io_in_dcache_ar_data_arlen(axi_crossbar_io_in_dcache_ar_data_arlen),
    .io_in_dcache_ar_data_arsize(axi_crossbar_io_in_dcache_ar_data_arsize),
    .io_in_dcache_ar_data_arburst(axi_crossbar_io_in_dcache_ar_data_arburst),
    .io_in_dcache_ar_data_arvalid(axi_crossbar_io_in_dcache_ar_data_arvalid),
    .io_in_dcache_ar_arready(axi_crossbar_io_in_dcache_ar_arready),
    .io_in_dcache_aw_data_awid(axi_crossbar_io_in_dcache_aw_data_awid),
    .io_in_dcache_aw_data_awaddr(axi_crossbar_io_in_dcache_aw_data_awaddr),
    .io_in_dcache_aw_data_awlen(axi_crossbar_io_in_dcache_aw_data_awlen),
    .io_in_dcache_aw_data_awsize(axi_crossbar_io_in_dcache_aw_data_awsize),
    .io_in_dcache_aw_data_awburst(axi_crossbar_io_in_dcache_aw_data_awburst),
    .io_in_dcache_aw_data_awvalid(axi_crossbar_io_in_dcache_aw_data_awvalid),
    .io_in_dcache_aw_awready(axi_crossbar_io_in_dcache_aw_awready),
    .io_in_dcache_w_data_wid(axi_crossbar_io_in_dcache_w_data_wid),
    .io_in_dcache_w_data_wdata(axi_crossbar_io_in_dcache_w_data_wdata),
    .io_in_dcache_w_data_wstrb(axi_crossbar_io_in_dcache_w_data_wstrb),
    .io_in_dcache_w_data_wlast(axi_crossbar_io_in_dcache_w_data_wlast),
    .io_in_dcache_w_data_wvalid(axi_crossbar_io_in_dcache_w_data_wvalid),
    .io_in_dcache_w_wready(axi_crossbar_io_in_dcache_w_wready),
    .io_in_dcache_r_data_rid(axi_crossbar_io_in_dcache_r_data_rid),
    .io_in_dcache_r_data_rdata(axi_crossbar_io_in_dcache_r_data_rdata),
    .io_in_dcache_r_data_rlast(axi_crossbar_io_in_dcache_r_data_rlast),
    .io_in_dcache_r_data_rvalid(axi_crossbar_io_in_dcache_r_data_rvalid),
    .io_in_dcache_r_rready(axi_crossbar_io_in_dcache_r_rready),
    .io_in_dcache_b_data_bid(axi_crossbar_io_in_dcache_b_data_bid),
    .io_in_dcache_b_data_bvalid(axi_crossbar_io_in_dcache_b_data_bvalid),
    .io_in_dcache_b_bready(axi_crossbar_io_in_dcache_b_bready),
    .io_in_uncache1_ar_data_arid(axi_crossbar_io_in_uncache1_ar_data_arid),
    .io_in_uncache1_ar_data_araddr(axi_crossbar_io_in_uncache1_ar_data_araddr),
    .io_in_uncache1_ar_data_arlen(axi_crossbar_io_in_uncache1_ar_data_arlen),
    .io_in_uncache1_ar_data_arsize(axi_crossbar_io_in_uncache1_ar_data_arsize),
    .io_in_uncache1_ar_data_arburst(axi_crossbar_io_in_uncache1_ar_data_arburst),
    .io_in_uncache1_ar_data_arlock(axi_crossbar_io_in_uncache1_ar_data_arlock),
    .io_in_uncache1_ar_data_arcache(axi_crossbar_io_in_uncache1_ar_data_arcache),
    .io_in_uncache1_ar_data_arprot(axi_crossbar_io_in_uncache1_ar_data_arprot),
    .io_in_uncache1_ar_data_arvalid(axi_crossbar_io_in_uncache1_ar_data_arvalid),
    .io_in_uncache1_ar_arready(axi_crossbar_io_in_uncache1_ar_arready),
    .io_in_uncache1_aw_data_awid(axi_crossbar_io_in_uncache1_aw_data_awid),
    .io_in_uncache1_aw_data_awaddr(axi_crossbar_io_in_uncache1_aw_data_awaddr),
    .io_in_uncache1_aw_data_awlen(axi_crossbar_io_in_uncache1_aw_data_awlen),
    .io_in_uncache1_aw_data_awsize(axi_crossbar_io_in_uncache1_aw_data_awsize),
    .io_in_uncache1_aw_data_awburst(axi_crossbar_io_in_uncache1_aw_data_awburst),
    .io_in_uncache1_aw_data_awlock(axi_crossbar_io_in_uncache1_aw_data_awlock),
    .io_in_uncache1_aw_data_awcache(axi_crossbar_io_in_uncache1_aw_data_awcache),
    .io_in_uncache1_aw_data_awprot(axi_crossbar_io_in_uncache1_aw_data_awprot),
    .io_in_uncache1_aw_data_awvalid(axi_crossbar_io_in_uncache1_aw_data_awvalid),
    .io_in_uncache1_aw_awready(axi_crossbar_io_in_uncache1_aw_awready),
    .io_in_uncache1_r_rready(axi_crossbar_io_in_uncache1_r_rready),
    .io_in_uncache1_b_bready(axi_crossbar_io_in_uncache1_b_bready),
    .io_in_uncache2_ar_data_arid(axi_crossbar_io_in_uncache2_ar_data_arid),
    .io_in_uncache2_ar_data_araddr(axi_crossbar_io_in_uncache2_ar_data_araddr),
    .io_in_uncache2_ar_data_arlen(axi_crossbar_io_in_uncache2_ar_data_arlen),
    .io_in_uncache2_ar_data_arsize(axi_crossbar_io_in_uncache2_ar_data_arsize),
    .io_in_uncache2_ar_data_arburst(axi_crossbar_io_in_uncache2_ar_data_arburst),
    .io_in_uncache2_ar_data_arlock(axi_crossbar_io_in_uncache2_ar_data_arlock),
    .io_in_uncache2_ar_data_arcache(axi_crossbar_io_in_uncache2_ar_data_arcache),
    .io_in_uncache2_ar_data_arprot(axi_crossbar_io_in_uncache2_ar_data_arprot),
    .io_in_uncache2_ar_data_arvalid(axi_crossbar_io_in_uncache2_ar_data_arvalid),
    .io_in_uncache2_ar_arready(axi_crossbar_io_in_uncache2_ar_arready),
    .io_in_uncache2_aw_data_awid(axi_crossbar_io_in_uncache2_aw_data_awid),
    .io_in_uncache2_aw_data_awaddr(axi_crossbar_io_in_uncache2_aw_data_awaddr),
    .io_in_uncache2_aw_data_awlen(axi_crossbar_io_in_uncache2_aw_data_awlen),
    .io_in_uncache2_aw_data_awsize(axi_crossbar_io_in_uncache2_aw_data_awsize),
    .io_in_uncache2_aw_data_awburst(axi_crossbar_io_in_uncache2_aw_data_awburst),
    .io_in_uncache2_aw_data_awlock(axi_crossbar_io_in_uncache2_aw_data_awlock),
    .io_in_uncache2_aw_data_awcache(axi_crossbar_io_in_uncache2_aw_data_awcache),
    .io_in_uncache2_aw_data_awprot(axi_crossbar_io_in_uncache2_aw_data_awprot),
    .io_in_uncache2_aw_data_awvalid(axi_crossbar_io_in_uncache2_aw_data_awvalid),
    .io_in_uncache2_aw_awready(axi_crossbar_io_in_uncache2_aw_awready),
    .io_in_uncache2_r_rready(axi_crossbar_io_in_uncache2_r_rready),
    .io_in_uncache2_b_bready(axi_crossbar_io_in_uncache2_b_bready),
    .io_out_ar_data_arid(axi_crossbar_io_out_ar_data_arid),
    .io_out_ar_data_araddr(axi_crossbar_io_out_ar_data_araddr),
    .io_out_ar_data_arlen(axi_crossbar_io_out_ar_data_arlen),
    .io_out_ar_data_arsize(axi_crossbar_io_out_ar_data_arsize),
    .io_out_ar_data_arburst(axi_crossbar_io_out_ar_data_arburst),
    .io_out_ar_data_arlock(axi_crossbar_io_out_ar_data_arlock),
    .io_out_ar_data_arcache(axi_crossbar_io_out_ar_data_arcache),
    .io_out_ar_data_arprot(axi_crossbar_io_out_ar_data_arprot),
    .io_out_ar_data_arvalid(axi_crossbar_io_out_ar_data_arvalid),
    .io_out_ar_arready(axi_crossbar_io_out_ar_arready),
    .io_out_aw_data_awid(axi_crossbar_io_out_aw_data_awid),
    .io_out_aw_data_awaddr(axi_crossbar_io_out_aw_data_awaddr),
    .io_out_aw_data_awlen(axi_crossbar_io_out_aw_data_awlen),
    .io_out_aw_data_awsize(axi_crossbar_io_out_aw_data_awsize),
    .io_out_aw_data_awburst(axi_crossbar_io_out_aw_data_awburst),
    .io_out_aw_data_awlock(axi_crossbar_io_out_aw_data_awlock),
    .io_out_aw_data_awcache(axi_crossbar_io_out_aw_data_awcache),
    .io_out_aw_data_awprot(axi_crossbar_io_out_aw_data_awprot),
    .io_out_aw_data_awvalid(axi_crossbar_io_out_aw_data_awvalid),
    .io_out_aw_awready(axi_crossbar_io_out_aw_awready),
    .io_out_w_data_wid(axi_crossbar_io_out_w_data_wid),
    .io_out_w_data_wdata(axi_crossbar_io_out_w_data_wdata),
    .io_out_w_data_wstrb(axi_crossbar_io_out_w_data_wstrb),
    .io_out_w_data_wlast(axi_crossbar_io_out_w_data_wlast),
    .io_out_w_data_wvalid(axi_crossbar_io_out_w_data_wvalid),
    .io_out_w_wready(axi_crossbar_io_out_w_wready),
    .io_out_r_data_rid(axi_crossbar_io_out_r_data_rid),
    .io_out_r_data_rdata(axi_crossbar_io_out_r_data_rdata),
    .io_out_r_data_rlast(axi_crossbar_io_out_r_data_rlast),
    .io_out_r_data_rvalid(axi_crossbar_io_out_r_data_rvalid),
    .io_out_r_rready(axi_crossbar_io_out_r_rready),
    .io_out_b_data_bid(axi_crossbar_io_out_b_data_bid),
    .io_out_b_data_bvalid(axi_crossbar_io_out_b_data_bvalid),
    .io_out_b_bready(axi_crossbar_io_out_b_bready)
  );
  DifftestInCore difftest ( // @[\\src\\main\\scala\\myCPU_top.scala 311:26]
    .clock(difftest_clock),
    .reset(difftest_reset),
    .io_commit_0_valid(difftest_io_commit_0_valid),
    .io_commit_0_pc(difftest_io_commit_0_pc),
    .io_commit_0_instr(difftest_io_commit_0_instr),
    .io_commit_0_rfWen(difftest_io_commit_0_rfWen),
    .io_commit_0_wdest(difftest_io_commit_0_wdest),
    .io_commit_0_wdata(difftest_io_commit_0_wdata),
    .io_commit_0_isCntInst(difftest_io_commit_0_isCntInst),
    .io_commit_0_csrRstat(difftest_io_commit_0_csrRstat),
    .io_commit_0_csrData(difftest_io_commit_0_csrData),
    .io_commit_0_excpFlush(difftest_io_commit_0_excpFlush),
    .io_commit_0_ertnFlush(difftest_io_commit_0_ertnFlush),
    .io_commit_0_csrEcode(difftest_io_commit_0_csrEcode),
    .io_commit_0_trap(difftest_io_commit_0_trap),
    .io_commit_0_load_valid(difftest_io_commit_0_load_valid),
    .io_commit_0_load_paddr(difftest_io_commit_0_load_paddr),
    .io_commit_0_load_vaddr(difftest_io_commit_0_load_vaddr),
    .io_commit_0_store_valid(difftest_io_commit_0_store_valid),
    .io_commit_0_store_paddr(difftest_io_commit_0_store_paddr),
    .io_commit_0_store_vaddr(difftest_io_commit_0_store_vaddr),
    .io_commit_0_store_data(difftest_io_commit_0_store_data),
    .io_regs_1(difftest_io_regs_1),
    .io_regs_2(difftest_io_regs_2),
    .io_regs_3(difftest_io_regs_3),
    .io_regs_4(difftest_io_regs_4),
    .io_regs_5(difftest_io_regs_5),
    .io_regs_6(difftest_io_regs_6),
    .io_regs_7(difftest_io_regs_7),
    .io_regs_8(difftest_io_regs_8),
    .io_regs_9(difftest_io_regs_9),
    .io_regs_10(difftest_io_regs_10),
    .io_regs_11(difftest_io_regs_11),
    .io_regs_12(difftest_io_regs_12),
    .io_regs_13(difftest_io_regs_13),
    .io_regs_14(difftest_io_regs_14),
    .io_regs_15(difftest_io_regs_15),
    .io_regs_16(difftest_io_regs_16),
    .io_regs_17(difftest_io_regs_17),
    .io_regs_18(difftest_io_regs_18),
    .io_regs_19(difftest_io_regs_19),
    .io_regs_20(difftest_io_regs_20),
    .io_regs_21(difftest_io_regs_21),
    .io_regs_22(difftest_io_regs_22),
    .io_regs_23(difftest_io_regs_23),
    .io_regs_24(difftest_io_regs_24),
    .io_regs_25(difftest_io_regs_25),
    .io_regs_26(difftest_io_regs_26),
    .io_regs_27(difftest_io_regs_27),
    .io_regs_28(difftest_io_regs_28),
    .io_regs_29(difftest_io_regs_29),
    .io_regs_30(difftest_io_regs_30),
    .io_regs_31(difftest_io_regs_31),
    .io_csr_estat(difftest_io_csr_estat),
    .io_csr_timer64(difftest_io_csr_timer64)
  );
  assign arid = axi_crossbar_io_out_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 239:11]
  assign araddr = axi_crossbar_io_out_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 240:11]
  assign arlen = axi_crossbar_io_out_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 241:11]
  assign arsize = axi_crossbar_io_out_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 242:11]
  assign arburst = axi_crossbar_io_out_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 243:11]
  assign arlock = axi_crossbar_io_out_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 244:11]
  assign arcache = axi_crossbar_io_out_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 245:11]
  assign arprot = axi_crossbar_io_out_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 246:11]
  assign arvalid = axi_crossbar_io_out_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 247:11]
  assign rready = axi_crossbar_io_out_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 258:10]
  assign awid = axi_crossbar_io_out_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 261:11]
  assign awaddr = axi_crossbar_io_out_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 262:11]
  assign awlen = axi_crossbar_io_out_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 263:11]
  assign awsize = axi_crossbar_io_out_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 264:11]
  assign awburst = axi_crossbar_io_out_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 265:11]
  assign awlock = axi_crossbar_io_out_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 266:11]
  assign awcache = axi_crossbar_io_out_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 267:11]
  assign awprot = axi_crossbar_io_out_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 268:11]
  assign awvalid = axi_crossbar_io_out_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 269:11]
  assign wid = axi_crossbar_io_out_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 273:11]
  assign wdata = axi_crossbar_io_out_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 274:11]
  assign wstrb = axi_crossbar_io_out_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 275:11]
  assign wlast = axi_crossbar_io_out_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 276:11]
  assign wvalid = axi_crossbar_io_out_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 277:11]
  assign bready = axi_crossbar_io_out_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 286:10]
  assign ws_valid = backend_difftest_commit_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 320:24]
  assign rf_rdata = 5'h1f == reg_num ? backend_difftest_regs_31 : _GEN_30; // @[\\src\\main\\scala\\myCPU_top.scala 326:{24,24}]
  assign debug0_wb_pc = backend_difftest_commit_0_pc; // @[\\src\\main\\scala\\myCPU_top.scala 321:42]
  assign debug0_wb_rf_wen = backend_difftest_commit_0_valid & backend_difftest_commit_0_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 322:46]
  assign debug0_wb_rf_wnum = backend_difftest_commit_0_wdest; // @[\\src\\main\\scala\\myCPU_top.scala 323:24]
  assign debug0_wb_rf_wdata = backend_difftest_commit_0_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 324:45]
  assign debug0_wb_inst = backend_difftest_commit_0_instr; // @[\\src\\main\\scala\\myCPU_top.scala 325:24]
  assign frontend_clock = aclk;
  assign frontend_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign frontend_io_out_0_ready = backend_io_in_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign frontend_io_out_1_ready = backend_io_in_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign frontend_io_out_2_ready = backend_io_in_2_ready; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign frontend_io_redirect_valid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 157:31]
  assign frontend_io_mmu_toMmu_ready = mmu_io_fromIcache_ready; // @[\\src\\main\\scala\\myCPU_top.scala 171:25]
  assign frontend_io_mmu_fromMmu_valid = mmu_io_toIcache_valid; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_mmu_fromMmu_bits_paddr = mmu_io_toIcache_bits_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_mmu_fromMmu_bits_cacheable = mmu_io_toIcache_bits_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpTlbRefill = mmu_io_toIcache_bits_error_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpTlbPif = mmu_io_toIcache_bits_error_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpTlbPpi = mmu_io_toIcache_bits_error_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_mmu_fromMmu_bits_error_excpAdef = mmu_io_toIcache_bits_error_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign frontend_io_axi_master_ar_arready = axi_crossbar_io_in_icache_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign frontend_io_axi_master_r_data_rid = axi_crossbar_io_in_icache_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign frontend_io_axi_master_r_data_rdata = axi_crossbar_io_in_icache_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign frontend_io_axi_master_r_data_rlast = axi_crossbar_io_in_icache_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign frontend_io_axi_master_r_data_rvalid = axi_crossbar_io_in_icache_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign backend_clock = aclk;
  assign backend_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign backend_io_in_0_valid = frontend_io_out_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_instr = frontend_io_out_0_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pc = frontend_io_out_0_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_valid = frontend_io_out_0_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_isBr = frontend_io_out_0_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_isJal = frontend_io_out_0_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_isJalr = frontend_io_out_0_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_isCall = frontend_io_out_0_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_isRet = frontend_io_out_0_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_pdInfo_jumpTarget = frontend_io_out_0_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_pc = frontend_io_out_0_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_fallThrough = frontend_io_out_0_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_taken = frontend_io_out_0_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_target = frontend_io_out_0_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_takenOffset = frontend_io_out_0_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbHit = frontend_io_out_0_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsJalr = frontend_io_out_0_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsJal = frontend_io_out_0_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsCall = frontend_io_out_0_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbIsRet = frontend_io_out_0_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_btbOffset = frontend_io_out_0_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_phtCounter = frontend_io_out_0_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_rasTop = frontend_io_out_0_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_predTaken = frontend_io_out_0_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_bpuInfo_meta_predTarget = frontend_io_out_0_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_exception_excpTlbRefill = frontend_io_out_0_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_exception_excpTlbPif = frontend_io_out_0_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_exception_excpTlbPpi = frontend_io_out_0_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_0_bits_exception_excpAdef = frontend_io_out_0_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_valid = frontend_io_out_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_instr = frontend_io_out_1_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pc = frontend_io_out_1_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_valid = frontend_io_out_1_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_isBr = frontend_io_out_1_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_isJal = frontend_io_out_1_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_isJalr = frontend_io_out_1_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_isCall = frontend_io_out_1_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_isRet = frontend_io_out_1_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_pdInfo_jumpTarget = frontend_io_out_1_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_pc = frontend_io_out_1_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_fallThrough = frontend_io_out_1_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_taken = frontend_io_out_1_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_target = frontend_io_out_1_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_takenOffset = frontend_io_out_1_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbHit = frontend_io_out_1_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsJalr = frontend_io_out_1_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsJal = frontend_io_out_1_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsCall = frontend_io_out_1_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbIsRet = frontend_io_out_1_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_btbOffset = frontend_io_out_1_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_phtCounter = frontend_io_out_1_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_rasTop = frontend_io_out_1_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_predTaken = frontend_io_out_1_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_bpuInfo_meta_predTarget = frontend_io_out_1_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_exception_excpTlbRefill = frontend_io_out_1_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_exception_excpTlbPif = frontend_io_out_1_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_exception_excpTlbPpi = frontend_io_out_1_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_1_bits_exception_excpAdef = frontend_io_out_1_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_valid = frontend_io_out_2_valid; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_instr = frontend_io_out_2_bits_instr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pc = frontend_io_out_2_bits_pc; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_valid = frontend_io_out_2_bits_pdInfo_valid; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_isBr = frontend_io_out_2_bits_pdInfo_isBr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_isJal = frontend_io_out_2_bits_pdInfo_isJal; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_isJalr = frontend_io_out_2_bits_pdInfo_isJalr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_isCall = frontend_io_out_2_bits_pdInfo_isCall; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_isRet = frontend_io_out_2_bits_pdInfo_isRet; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_pdInfo_jumpTarget = frontend_io_out_2_bits_pdInfo_jumpTarget; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_pc = frontend_io_out_2_bits_bpuInfo_pc; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_fallThrough = frontend_io_out_2_bits_bpuInfo_fallThrough; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_taken = frontend_io_out_2_bits_bpuInfo_taken; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_target = frontend_io_out_2_bits_bpuInfo_target; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_takenOffset = frontend_io_out_2_bits_bpuInfo_takenOffset; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbHit = frontend_io_out_2_bits_bpuInfo_meta_btbHit; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsJalr = frontend_io_out_2_bits_bpuInfo_meta_btbIsJalr; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsJal = frontend_io_out_2_bits_bpuInfo_meta_btbIsJal; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsCall = frontend_io_out_2_bits_bpuInfo_meta_btbIsCall; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbIsRet = frontend_io_out_2_bits_bpuInfo_meta_btbIsRet; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_btbOffset = frontend_io_out_2_bits_bpuInfo_meta_btbOffset; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_phtCounter = frontend_io_out_2_bits_bpuInfo_meta_phtCounter; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_rasTop = frontend_io_out_2_bits_bpuInfo_meta_rasTop; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_predTaken = frontend_io_out_2_bits_bpuInfo_meta_predTaken; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_bpuInfo_meta_predTarget = frontend_io_out_2_bits_bpuInfo_meta_predTarget; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_exception_excpTlbRefill = frontend_io_out_2_bits_exception_excpTlbRefill; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_exception_excpTlbPif = frontend_io_out_2_bits_exception_excpTlbPif; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_exception_excpTlbPpi = frontend_io_out_2_bits_exception_excpTlbPpi; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_in_2_bits_exception_excpAdef = frontend_io_out_2_bits_exception_excpAdef; // @[\\src\\main\\scala\\myCPU_top.scala 110:19]
  assign backend_io_extInt = intrpt != 8'h0; // @[\\src\\main\\scala\\myCPU_top.scala 147:31]
  assign backend_io_lsEnq_lqFull = memory_io_lsEnq_lqFull; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign backend_io_lsEnq_sqFull = memory_io_lsEnq_sqFull; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign backend_io_toMemResult_0_ready = memaddrtrans_io_in_ready; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign backend_io_toMemResult_1_ready = 1'h1; // @[\\src\\main\\scala\\myCPU_top.scala 122:29]
  assign backend_io_fromMemResult_0_valid = memory_io_toWbResult_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_pc = memory_io_toWbResult_0_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_ctrl_fuType = memory_io_toWbResult_0_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_ctrl_lsuOp = memory_io_toWbResult_0_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_ctrl_rfWen = memory_io_toWbResult_0_bits_uop_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_excpVec = memory_io_toWbResult_0_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_pdst = memory_io_toWbResult_0_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_rdValid = memory_io_toWbResult_0_bits_uop_rdValid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdx_value = memory_io_toWbResult_0_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdx_flag = memory_io_toWbResult_0_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdxFull_value = memory_io_toWbResult_0_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_robIdxFull_flag = memory_io_toWbResult_0_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_lqIdx_value = memory_io_toWbResult_0_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_uop_sqIdx_value = memory_io_toWbResult_0_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_data = memory_io_toWbResult_0_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_redirect_valid = memory_io_toWbResult_0_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_redirect_bits_valid = memory_io_toWbResult_0_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_redirect_bits_robIdx_value =
    memory_io_toWbResult_0_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_redirect_bits_robIdx_flag =
    memory_io_toWbResult_0_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_memVaddr = memory_io_toWbResult_0_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_0_bits_memPaddr = memory_io_toWbResult_0_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_valid = memory_io_toWbResult_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_pc = memory_io_toWbResult_1_bits_uop_pc; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_ctrl_fuType = memory_io_toWbResult_1_bits_uop_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_ctrl_lsuOp = memory_io_toWbResult_1_bits_uop_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_excpVec = memory_io_toWbResult_1_bits_uop_excpVec; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_pdst = memory_io_toWbResult_1_bits_uop_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdx_value = memory_io_toWbResult_1_bits_uop_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdx_flag = memory_io_toWbResult_1_bits_uop_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdxFull_value = memory_io_toWbResult_1_bits_uop_robIdxFull_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_robIdxFull_flag = memory_io_toWbResult_1_bits_uop_robIdxFull_flag; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_lqIdx_value = memory_io_toWbResult_1_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_uop_sqIdx_value = memory_io_toWbResult_1_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_redirect_valid = memory_io_toWbResult_1_bits_redirect_valid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_redirect_bits_valid = memory_io_toWbResult_1_bits_redirect_bits_valid; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_redirect_bits_robIdx_value =
    memory_io_toWbResult_1_bits_redirect_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_redirect_bits_robIdx_flag =
    memory_io_toWbResult_1_bits_redirect_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_memVaddr = memory_io_toWbResult_1_bits_memVaddr; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_memPaddr = memory_io_toWbResult_1_bits_memPaddr; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign backend_io_fromMemResult_1_bits_memStoreData = memory_io_toWbResult_1_bits_memStoreData; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign memory_clock = aclk;
  assign memory_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign memory_io_lsEnq_req_valid = backend_io_lsEnq_req_valid; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_req_bits_robIdx_value = backend_io_lsEnq_req_bits_robIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_req_bits_robIdx_flag = backend_io_lsEnq_req_bits_robIdx_flag; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_req_bits_isLoad = backend_io_lsEnq_req_bits_isLoad; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_req_bits_isStore = backend_io_lsEnq_req_bits_isStore; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_req_bits_sqIdx_value = backend_io_lsEnq_req_bits_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_req_bits_lqIdx_value = backend_io_lsEnq_req_bits_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_toLsqData_pc = backend_io_lsEnq_toLsqData_pc; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_toLsqData_ctrl_fuType = backend_io_lsEnq_toLsqData_ctrl_fuType; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_toLsqData_ctrl_lsuOp = backend_io_lsEnq_toLsqData_ctrl_lsuOp; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_toLsqData_ctrl_rfWen = backend_io_lsEnq_toLsqData_ctrl_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_lsEnq_toLsqData_pdst = backend_io_lsEnq_toLsqData_pdst; // @[\\src\\main\\scala\\myCPU_top.scala 114:20]
  assign memory_io_fromExeMmuResult_valid = memaddrtrans_io_out_valid; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_ctrl_memRead = memaddrtrans_io_out_bits_exeRes_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_lqIdx_value = memaddrtrans_io_out_bits_exeRes_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_sqIdx_value = memaddrtrans_io_out_bits_exeRes_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_uop_isSta = memaddrtrans_io_out_bits_exeRes_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_exeRes_data = memaddrtrans_io_out_bits_exeRes_data; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_paddr = memaddrtrans_io_out_bits_mmuRes_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeMmuResult_bits_mmuRes_cacheable = memaddrtrans_io_out_bits_mmuRes_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 127:30]
  assign memory_io_fromExeResult_valid = backend_io_toMemResult_1_valid; // @[\\src\\main\\scala\\myCPU_top.scala 122:29]
  assign memory_io_fromExeResult_bits_uop_sqIdx_value = backend_io_toMemResult_1_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 122:29]
  assign memory_io_fromExeResult_bits_uop_isStd = backend_io_toMemResult_1_bits_uop_isStd; // @[\\src\\main\\scala\\myCPU_top.scala 122:29]
  assign memory_io_fromExeResult_bits_data = backend_io_toMemResult_1_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 122:29]
  assign memory_io_toWbResult_0_ready = backend_io_fromMemResult_0_ready; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign memory_io_toWbResult_1_ready = backend_io_fromMemResult_1_ready; // @[\\src\\main\\scala\\myCPU_top.scala 133:24]
  assign memory_io_robCommit_0_valid = backend_io_commitToSq_valid_0; // @[\\src\\main\\scala\\myCPU_top.scala 137:34]
  assign memory_io_robCommit_0_sqIdx = backend_io_commitToSq_bits_0_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 138:34]
  assign memory_io_axi_ar_arready = axi_crossbar_io_in_dcache_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_aw_awready = axi_crossbar_io_in_dcache_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_w_wready = axi_crossbar_io_in_dcache_w_wready; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_r_data_rid = axi_crossbar_io_in_dcache_r_data_rid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_r_data_rdata = axi_crossbar_io_in_dcache_r_data_rdata; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_r_data_rlast = axi_crossbar_io_in_dcache_r_data_rlast; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_r_data_rvalid = axi_crossbar_io_in_dcache_r_data_rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_b_data_bid = axi_crossbar_io_in_dcache_b_data_bid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memory_io_axi_b_data_bvalid = axi_crossbar_io_in_dcache_b_data_bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign memaddrtrans_clock = aclk;
  assign memaddrtrans_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign memaddrtrans_io_in_valid = backend_io_toMemResult_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_ctrl_memRead = backend_io_toMemResult_0_bits_uop_ctrl_memRead; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_lqIdx_value = backend_io_toMemResult_0_bits_uop_lqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_sqIdx_value = backend_io_toMemResult_0_bits_uop_sqIdx_value; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_uop_isSta = backend_io_toMemResult_0_bits_uop_isSta; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign memaddrtrans_io_in_bits_data = backend_io_toMemResult_0_bits_data; // @[\\src\\main\\scala\\myCPU_top.scala 126:22]
  assign memaddrtrans_io_mmuResp_valid = simMMU_io_mmuResp_valid; // @[\\src\\main\\scala\\myCPU_top.scala 130:27]
  assign memaddrtrans_io_mmuResp_bits_paddr = simMMU_io_mmuResp_bits_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 130:27]
  assign memaddrtrans_io_mmuResp_bits_cacheable = simMMU_io_mmuResp_bits_cacheable; // @[\\src\\main\\scala\\myCPU_top.scala 130:27]
  assign simMMU_clock = aclk;
  assign simMMU_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign simMMU_io_mmuReq_valid = memaddrtrans_io_mmuReq_valid; // @[\\src\\main\\scala\\myCPU_top.scala 129:26]
  assign simMMU_io_mmuReq_bits_vaddr = memaddrtrans_io_mmuReq_bits_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 129:26]
  assign mmu_clock = aclk;
  assign mmu_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign mmu_io_fromIcache_valid = frontend_io_mmu_toMmu_valid; // @[\\src\\main\\scala\\myCPU_top.scala 171:25]
  assign mmu_io_fromIcache_bits_vaddr = frontend_io_mmu_toMmu_bits_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 171:25]
  assign mmu_io_toIcache_ready = 1'h1; // @[\\src\\main\\scala\\myCPU_top.scala 172:27]
  assign csr_clock = aclk;
  assign csr_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign csr_io_irqBus = intrpt; // @[\\src\\main\\scala\\myCPU_top.scala 181:17]
  assign uncache1_axi_master_ar_arready = axi_crossbar_io_in_uncache1_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_aw_awready = axi_crossbar_io_in_uncache1_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_w_wready = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_r_data_rid = 4'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_r_data_rdata = 32'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_r_data_rresp = 2'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_r_data_rlast = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_r_data_rvalid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_b_data_bid = 4'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_b_data_bresp = 2'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_axi_master_b_data_bvalid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign uncache1_cpu_if_req_addr = 32'h0; // @[\\src\\main\\scala\\myCPU_top.scala 214:32]
  assign uncache1_cpu_if_req_valid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 215:32]
  assign uncache2_axi_master_ar_arready = axi_crossbar_io_in_uncache2_ar_arready; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_aw_awready = axi_crossbar_io_in_uncache2_aw_awready; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_w_wready = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_r_data_rid = 4'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_r_data_rdata = 32'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_r_data_rresp = 2'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_r_data_rlast = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_r_data_rvalid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_b_data_bid = 4'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_b_data_bresp = 2'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_axi_master_b_data_bvalid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign uncache2_cpu_if_req_addr = 32'h0; // @[\\src\\main\\scala\\myCPU_top.scala 216:32]
  assign uncache2_cpu_if_req_valid = 1'h0; // @[\\src\\main\\scala\\myCPU_top.scala 217:32]
  assign axi_crossbar_clock = aclk;
  assign axi_crossbar_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign axi_crossbar_io_in_icache_ar_data_arid = frontend_io_axi_master_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_icache_ar_data_araddr = frontend_io_axi_master_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_icache_ar_data_arlen = frontend_io_axi_master_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_icache_ar_data_arsize = frontend_io_axi_master_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_icache_ar_data_arburst = frontend_io_axi_master_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_icache_ar_data_arvalid = frontend_io_axi_master_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_icache_r_rready = frontend_io_axi_master_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 226:31]
  assign axi_crossbar_io_in_dcache_ar_data_arid = memory_io_axi_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_ar_data_araddr = memory_io_axi_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_ar_data_arlen = memory_io_axi_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_ar_data_arsize = memory_io_axi_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_ar_data_arburst = memory_io_axi_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_ar_data_arvalid = memory_io_axi_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_aw_data_awid = memory_io_axi_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_aw_data_awaddr = memory_io_axi_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_aw_data_awlen = memory_io_axi_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_aw_data_awsize = memory_io_axi_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_aw_data_awburst = memory_io_axi_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_aw_data_awvalid = memory_io_axi_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_w_data_wid = memory_io_axi_w_data_wid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_w_data_wdata = memory_io_axi_w_data_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_w_data_wstrb = memory_io_axi_w_data_wstrb; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_w_data_wlast = memory_io_axi_w_data_wlast; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_w_data_wvalid = memory_io_axi_w_data_wvalid; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_r_rready = memory_io_axi_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_dcache_b_bready = memory_io_axi_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 229:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arid = uncache1_axi_master_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_araddr = uncache1_axi_master_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arlen = uncache1_axi_master_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arsize = uncache1_axi_master_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arburst = uncache1_axi_master_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arlock = uncache1_axi_master_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arcache = uncache1_axi_master_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arprot = uncache1_axi_master_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_ar_data_arvalid = uncache1_axi_master_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awid = uncache1_axi_master_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awaddr = uncache1_axi_master_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awlen = uncache1_axi_master_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awsize = uncache1_axi_master_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awburst = uncache1_axi_master_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awlock = uncache1_axi_master_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awcache = uncache1_axi_master_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awprot = uncache1_axi_master_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_aw_data_awvalid = uncache1_axi_master_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_r_rready = uncache1_axi_master_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache1_b_bready = uncache1_axi_master_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 232:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arid = uncache2_axi_master_ar_data_arid; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_araddr = uncache2_axi_master_ar_data_araddr; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arlen = uncache2_axi_master_ar_data_arlen; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arsize = uncache2_axi_master_ar_data_arsize; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arburst = uncache2_axi_master_ar_data_arburst; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arlock = uncache2_axi_master_ar_data_arlock; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arcache = uncache2_axi_master_ar_data_arcache; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arprot = uncache2_axi_master_ar_data_arprot; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_ar_data_arvalid = uncache2_axi_master_ar_data_arvalid; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awid = uncache2_axi_master_aw_data_awid; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awaddr = uncache2_axi_master_aw_data_awaddr; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awlen = uncache2_axi_master_aw_data_awlen; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awsize = uncache2_axi_master_aw_data_awsize; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awburst = uncache2_axi_master_aw_data_awburst; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awlock = uncache2_axi_master_aw_data_awlock; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awcache = uncache2_axi_master_aw_data_awcache; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awprot = uncache2_axi_master_aw_data_awprot; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_aw_data_awvalid = uncache2_axi_master_aw_data_awvalid; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_r_rready = uncache2_axi_master_r_rready; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_in_uncache2_b_bready = uncache2_axi_master_b_bready; // @[\\src\\main\\scala\\myCPU_top.scala 235:31]
  assign axi_crossbar_io_out_ar_arready = arready; // @[\\src\\main\\scala\\myCPU_top.scala 248:34]
  assign axi_crossbar_io_out_aw_awready = awready; // @[\\src\\main\\scala\\myCPU_top.scala 270:34]
  assign axi_crossbar_io_out_w_wready = wready; // @[\\src\\main\\scala\\myCPU_top.scala 278:32]
  assign axi_crossbar_io_out_r_data_rid = rid; // @[\\src\\main\\scala\\myCPU_top.scala 251:20 252:17]
  assign axi_crossbar_io_out_r_data_rdata = rdata; // @[\\src\\main\\scala\\myCPU_top.scala 251:20 253:17]
  assign axi_crossbar_io_out_r_data_rlast = rlast; // @[\\src\\main\\scala\\myCPU_top.scala 251:20 255:17]
  assign axi_crossbar_io_out_r_data_rvalid = rvalid; // @[\\src\\main\\scala\\myCPU_top.scala 251:20 256:17]
  assign axi_crossbar_io_out_b_data_bid = bid; // @[\\src\\main\\scala\\myCPU_top.scala 281:20 282:17]
  assign axi_crossbar_io_out_b_data_bvalid = bvalid; // @[\\src\\main\\scala\\myCPU_top.scala 281:20 284:17]
  assign difftest_clock = aclk;
  assign difftest_reset = ~aresetn; // @[\\src\\main\\scala\\myCPU_top.scala 95:27]
  assign difftest_io_commit_0_valid = backend_difftest_commit_0_valid; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_pc = backend_difftest_commit_0_pc; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_instr = backend_difftest_commit_0_instr; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_rfWen = backend_difftest_commit_0_rfWen; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_wdest = backend_difftest_commit_0_wdest; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_wdata = backend_difftest_commit_0_wdata; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_isCntInst = backend_difftest_commit_0_isCntInst; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_csrRstat = backend_difftest_commit_0_csrRstat; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_csrData = backend_difftest_commit_0_csrData; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_excpFlush = backend_difftest_commit_0_excpFlush; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_ertnFlush = backend_difftest_commit_0_ertnFlush; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_csrEcode = backend_difftest_commit_0_csrEcode; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_trap = backend_difftest_commit_0_trap; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_load_valid = backend_difftest_commit_0_load_valid; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_load_paddr = backend_difftest_commit_0_load_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_load_vaddr = backend_difftest_commit_0_load_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_store_valid = backend_difftest_commit_0_store_valid; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_store_paddr = backend_difftest_commit_0_store_paddr; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_store_vaddr = backend_difftest_commit_0_store_vaddr; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_commit_0_store_data = backend_difftest_commit_0_store_data; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 314:25]
  assign difftest_io_regs_1 = backend_difftest_regs_1; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_2 = backend_difftest_regs_2; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_3 = backend_difftest_regs_3; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_4 = backend_difftest_regs_4; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_5 = backend_difftest_regs_5; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_6 = backend_difftest_regs_6; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_7 = backend_difftest_regs_7; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_8 = backend_difftest_regs_8; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_9 = backend_difftest_regs_9; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_10 = backend_difftest_regs_10; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_11 = backend_difftest_regs_11; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_12 = backend_difftest_regs_12; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_13 = backend_difftest_regs_13; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_14 = backend_difftest_regs_14; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_15 = backend_difftest_regs_15; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_16 = backend_difftest_regs_16; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_17 = backend_difftest_regs_17; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_18 = backend_difftest_regs_18; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_19 = backend_difftest_regs_19; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_20 = backend_difftest_regs_20; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_21 = backend_difftest_regs_21; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_22 = backend_difftest_regs_22; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_23 = backend_difftest_regs_23; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_24 = backend_difftest_regs_24; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_25 = backend_difftest_regs_25; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_26 = backend_difftest_regs_26; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_27 = backend_difftest_regs_27; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_28 = backend_difftest_regs_28; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_29 = backend_difftest_regs_29; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_30 = backend_difftest_regs_30; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_regs_31 = backend_difftest_regs_31; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 315:25]
  assign difftest_io_csr_estat = csr_difftest_estat; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 316:25]
  assign difftest_io_csr_timer64 = csr_difftest_timer64; // @[\\src\\main\\scala\\myCPU_top.scala 312:28 316:25]
endmodule
