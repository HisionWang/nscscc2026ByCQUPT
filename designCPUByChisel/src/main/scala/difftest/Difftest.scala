package nscscc.difftest

import chisel3._
import chisel3.util._
import chisel3.experimental._

// 定义所有Difftest模块的黑盒接口
class DifftestInstrCommit extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val index = Input(UInt(64.W))
    val valid = Input(Bool())
    val pc = Input(UInt(64.W))
    val instr = Input(UInt(32.W))
    val skip = Input(Bool())
    val is_TLBFILL = Input(Bool())
    val TLBFILL_index = Input(UInt(5.W))
    val is_CNTinst = Input(Bool())
    val timer_64_value = Input(UInt(64.W))
    val wen = Input(Bool())
    val wdest = Input(UInt(8.W))
    val wdata = Input(UInt(64.W))
    val csr_rstat = Input(Bool())
    val csr_data = Input(UInt(64.W))
  })

}

class DifftestExcpEvent extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val excp_valid = Input(Bool())
    val eret = Input(Bool())
    val intrNo = Input(UInt(11.W))
    val cause = Input(UInt(6.W))
    val exceptionPC = Input(UInt(64.W))
    val exceptionInst = Input(UInt(32.W))
  })

}

class DifftestTrapEvent extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val valid = Input(Bool())
    val code = Input(UInt(8.W))
    val pc = Input(UInt(64.W))
    val cycleCnt = Input(UInt(64.W))
    val instrCnt = Input(UInt(64.W))
  })

}

class DifftestStoreEvent extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val index = Input(UInt(8.W))
    val valid = Input(Bool())
    val storePAddr = Input(UInt(64.W))
    val storeVAddr = Input(UInt(64.W))
    val storeData = Input(UInt(64.W))
  })

}

class DifftestLoadEvent extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val index = Input(UInt(8.W))
    val valid = Input(Bool())
    val paddr = Input(UInt(64.W))
    val vaddr = Input(UInt(64.W))
  })

}

class DifftestCSRRegState extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val crmd = Input(UInt(32.W))
    val prmd = Input(UInt(32.W))
    val euen = Input(UInt(32.W))
    val ecfg = Input(UInt(32.W))
    val estat = Input(UInt(32.W))
    val era = Input(UInt(64.W))
    val badv = Input(UInt(64.W))
    val eentry = Input(UInt(64.W))
    val tlbidx = Input(UInt(32.W))
    val tlbehi = Input(UInt(64.W))
    val tlbelo0 = Input(UInt(32.W))
    val tlbelo1 = Input(UInt(32.W))
    val asid = Input(UInt(32.W))
    val pgdl = Input(UInt(64.W))
    val pgdh = Input(UInt(64.W))
    val save0 = Input(UInt(64.W))
    val save1 = Input(UInt(64.W))
    val save2 = Input(UInt(64.W))
    val save3 = Input(UInt(64.W))
    val tid = Input(UInt(64.W))
    val tcfg = Input(UInt(32.W))
    val tval = Input(UInt(64.W))
    val ticlr = Input(UInt(32.W))
    val llbctl = Input(UInt(32.W))
    val tlbrentry = Input(UInt(64.W))
    val dmw0 = Input(UInt(32.W))
    val dmw1 = Input(UInt(32.W))
  })
}

class DifftestGRegState extends BlackBox with HasBlackBoxResource {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val coreid = Input(UInt(8.W))
    val gpr_0 = Input(UInt(64.W))
    val gpr_1 = Input(UInt(64.W))
    val gpr_2 = Input(UInt(64.W))
    val gpr_3 = Input(UInt(64.W))
    val gpr_4 = Input(UInt(64.W))
    val gpr_5 = Input(UInt(64.W))
    val gpr_6 = Input(UInt(64.W))
    val gpr_7 = Input(UInt(64.W))
    val gpr_8 = Input(UInt(64.W))
    val gpr_9 = Input(UInt(64.W))
    val gpr_10 = Input(UInt(64.W))
    val gpr_11 = Input(UInt(64.W))
    val gpr_12 = Input(UInt(64.W))
    val gpr_13 = Input(UInt(64.W))
    val gpr_14 = Input(UInt(64.W))
    val gpr_15 = Input(UInt(64.W))
    val gpr_16 = Input(UInt(64.W))
    val gpr_17 = Input(UInt(64.W))
    val gpr_18 = Input(UInt(64.W))
    val gpr_19 = Input(UInt(64.W))
    val gpr_20 = Input(UInt(64.W))
    val gpr_21 = Input(UInt(64.W))
    val gpr_22 = Input(UInt(64.W))
    val gpr_23 = Input(UInt(64.W))
    val gpr_24 = Input(UInt(64.W))
    val gpr_25 = Input(UInt(64.W))
    val gpr_26 = Input(UInt(64.W))
    val gpr_27 = Input(UInt(64.W))
    val gpr_28 = Input(UInt(64.W))
    val gpr_29 = Input(UInt(64.W))
    val gpr_30 = Input(UInt(64.W))
    val gpr_31 = Input(UInt(64.W))
  })

}

// 顶层模块
class DifftestInCore extends Module {
  val io = IO(new Bundle {
    
    // 来自CPU的信号
    val inst_valid_diff = Input(Bool())
    val cnt_inst_diff = Input(Bool())
    val cnt_index_diff = Input(UInt(64.W))
    val timer_64_diff = Input(UInt(64.W))
    val inst_ld_en_diff = Input(Bool())
    val ld_paddr_diff = Input(UInt(64.W))
    val ld_vaddr_diff = Input(UInt(64.W))
    val inst_st_en_diff = Input(Bool())
    val st_paddr_diff = Input(UInt(64.W))
    val st_vaddr_diff = Input(UInt(64.W))
    val st_data_diff = Input(UInt(64.W))
    val csr_rstat_en_diff = Input(Bool())
    val csr_data_diff = Input(UInt(64.W))
    
    val debug0_wb_rf_wen = Input(Bool())
    val debug0_wb_rf_wnum = Input(UInt(5.W))
    val debug0_wb_rf_wdata = Input(UInt(64.W))
    val debug0_wb_pc = Input(UInt(64.W))
    val debug0_wb_inst = Input(UInt(32.W))
    
    val excp_flush = Input(Bool())
    val ertn_flush = Input(Bool())
    val ws_csr_ecode = Input(UInt(6.W))
    val tlbfill_en = Input(Bool())
    val rand_index = Input(UInt(5.W))
    
    val csr_estat_diff_0 = Input(UInt(32.W))
    val csr_crmd_diff_0 = Input(UInt(32.W))
    val csr_prmd_diff_0 = Input(UInt(32.W))
    val csr_ectl_diff_0 = Input(UInt(32.W))
    val csr_era_diff_0 = Input(UInt(64.W))
    val csr_badv_diff_0 = Input(UInt(64.W))
    val csr_eentry_diff_0 = Input(UInt(64.W))
    val csr_tlbidx_diff_0 = Input(UInt(32.W))
    val csr_tlbehi_diff_0 = Input(UInt(64.W))
    val csr_tlbelo0_diff_0 = Input(UInt(32.W))
    val csr_tlbelo1_diff_0 = Input(UInt(32.W))
    val csr_asid_diff_0 = Input(UInt(32.W))
    val csr_pgdl_diff_0 = Input(UInt(64.W))
    val csr_pgdh_diff_0 = Input(UInt(64.W))
    val csr_save0_diff_0 = Input(UInt(64.W))
    val csr_save1_diff_0 = Input(UInt(64.W))
    val csr_save2_diff_0 = Input(UInt(64.W))
    val csr_save3_diff_0 = Input(UInt(64.W))
    val csr_tid_diff_0 = Input(UInt(64.W))
    val csr_tcfg_diff_0 = Input(UInt(32.W))
    val csr_tval_diff_0 = Input(UInt(64.W))
    val csr_ticlr_diff_0 = Input(UInt(32.W))
    val csr_llbctl_diff_0 = Input(UInt(32.W))
    val csr_tlbrentry_diff_0 = Input(UInt(64.W))
    val csr_dmw0_diff_0 = Input(UInt(32.W))
    val csr_dmw1_diff_0 = Input(UInt(32.W))
    
    val regs = Input(Vec(32, UInt(64.W)))
  })
  
  // 寄存器定义
  val cmt_valid = RegInit(false.B)
  val cmt_index = RegInit(0.U(64.W))
  val cmt_cnt_inst = RegInit(false.B)
  val cmt_timer_64 = RegInit(0.U(64.W))
  val cmt_inst_ld_en = RegInit(false.B)
  val cmt_ld_paddr = RegInit(0.U(64.W))
  val cmt_ld_vaddr = RegInit(0.U(64.W))
  val cmt_inst_st_en = RegInit(false.B)
  val cmt_st_paddr = RegInit(0.U(64.W))
  val cmt_st_vaddr = RegInit(0.U(64.W))
  val cmt_st_data = RegInit(0.U(64.W))
  val cmt_csr_rstat_en = RegInit(false.B)
  val cmt_csr_data = RegInit(0.U(64.W))
  
  val cmt_wen = RegInit(false.B)
  val cmt_wdest = RegInit(0.U(8.W))
  val cmt_wdata = RegInit(0.U(64.W))
  val cmt_pc = RegInit(0.U(64.W))
  val cmt_inst = RegInit(0.U(32.W))
  
  val cmt_excp_flush = RegInit(false.B)
  val cmt_ertn = RegInit(false.B)
  val cmt_csr_ecode = RegInit(0.U(6.W))
  val cmt_tlbfill_en = RegInit(false.B)
  val cmt_rand_index = RegInit(0.U(5.W))
  
  val trap = RegInit(false.B)
  val trap_code = RegInit(0.U(8.W))
  val cycleCnt = RegInit(0.U(64.W))
  val instrCnt = RegInit(0.U(64.W))
  
    when(!trap) {
      cmt_valid := io.inst_valid_diff
      cmt_index := io.cnt_index_diff
      cmt_cnt_inst := io.cnt_inst_diff
      cmt_timer_64 := io.timer_64_diff
      cmt_inst_ld_en := io.inst_ld_en_diff
      cmt_ld_paddr := io.ld_paddr_diff
      cmt_ld_vaddr := io.ld_vaddr_diff
      cmt_inst_st_en := io.inst_st_en_diff
      cmt_st_paddr := io.st_paddr_diff
      cmt_st_vaddr := io.st_vaddr_diff
      cmt_st_data := io.st_data_diff
      cmt_csr_rstat_en := io.csr_rstat_en_diff
      cmt_csr_data := io.csr_data_diff
      
      cmt_wen := io.debug0_wb_rf_wen
      cmt_wdest := Cat(0.U(3.W), io.debug0_wb_rf_wnum)
      cmt_wdata := io.debug0_wb_rf_wdata
      cmt_pc := io.debug0_wb_pc
      cmt_inst := io.debug0_wb_inst
      
      cmt_excp_flush := io.excp_flush
      cmt_ertn := io.ertn_flush
      cmt_csr_ecode := io.ws_csr_ecode
      cmt_tlbfill_en := io.tlbfill_en
      cmt_rand_index := io.rand_index
      
      trap := false.B
      trap_code := io.regs(10)(7, 0)
      cycleCnt := cycleCnt + 1.U
      instrCnt := instrCnt + io.inst_valid_diff
    }
  
  
  // 实例化Difftest模块
  val difftestInstrCommit = Module(new DifftestInstrCommit)

  difftestInstrCommit.io.clock := clock
  difftestInstrCommit.io.coreid := 0.U
  difftestInstrCommit.io.index := 0.U
  difftestInstrCommit.io.valid := cmt_valid
  difftestInstrCommit.io.pc := cmt_pc
  difftestInstrCommit.io.instr := cmt_inst
  difftestInstrCommit.io.skip := false.B
  difftestInstrCommit.io.is_TLBFILL := cmt_tlbfill_en
  difftestInstrCommit.io.TLBFILL_index := cmt_rand_index
  difftestInstrCommit.io.is_CNTinst := cmt_cnt_inst
  difftestInstrCommit.io.timer_64_value := cmt_timer_64
  difftestInstrCommit.io.wen := cmt_wen
  difftestInstrCommit.io.wdest := cmt_wdest
  difftestInstrCommit.io.wdata := cmt_wdata
  difftestInstrCommit.io.csr_rstat := cmt_csr_rstat_en
  difftestInstrCommit.io.csr_data := cmt_csr_data
  
  val difftestExcpEvent = Module(new DifftestExcpEvent)
  difftestExcpEvent.io.clock := clock
  difftestExcpEvent.io.coreid := 0.U
  difftestExcpEvent.io.excp_valid := cmt_excp_flush
  difftestExcpEvent.io.eret := cmt_ertn
  difftestExcpEvent.io.intrNo := io.csr_estat_diff_0(12, 2)
  difftestExcpEvent.io.cause := cmt_csr_ecode
  difftestExcpEvent.io.exceptionPC := cmt_pc
  difftestExcpEvent.io.exceptionInst := cmt_inst
  
  val difftestTrapEvent = Module(new DifftestTrapEvent)
  difftestTrapEvent.io.clock := clock
  difftestTrapEvent.io.coreid := 0.U
  difftestTrapEvent.io.valid := trap
  difftestTrapEvent.io.code := trap_code
  difftestTrapEvent.io.pc := cmt_pc
  difftestTrapEvent.io.cycleCnt := cycleCnt
  difftestTrapEvent.io.instrCnt := instrCnt
  
  val difftestStoreEvent = Module(new DifftestStoreEvent)
  difftestStoreEvent.io.clock := clock
  difftestStoreEvent.io.coreid := 0.U
  difftestStoreEvent.io.index := 0.U
  difftestStoreEvent.io.valid := cmt_inst_st_en
  difftestStoreEvent.io.storePAddr := cmt_st_paddr
  difftestStoreEvent.io.storeVAddr := cmt_st_vaddr
  difftestStoreEvent.io.storeData := cmt_st_data
  
  val difftestLoadEvent = Module(new DifftestLoadEvent)
  difftestLoadEvent.io.clock := clock
  difftestLoadEvent.io.coreid := 0.U
  difftestLoadEvent.io.index := 0.U
  difftestLoadEvent.io.valid := cmt_inst_ld_en
  difftestLoadEvent.io.paddr := cmt_ld_paddr
  difftestLoadEvent.io.vaddr := cmt_ld_vaddr
  
  val difftestCSRRegState = Module(new DifftestCSRRegState)
  difftestCSRRegState.io.clock := clock
  difftestCSRRegState.io.coreid := 0.U
  difftestCSRRegState.io.crmd := io.csr_crmd_diff_0
  difftestCSRRegState.io.prmd := io.csr_prmd_diff_0
  difftestCSRRegState.io.euen := 0.U
  difftestCSRRegState.io.ecfg := io.csr_ectl_diff_0
  difftestCSRRegState.io.estat := io.csr_estat_diff_0
  difftestCSRRegState.io.era := io.csr_era_diff_0
  difftestCSRRegState.io.badv := io.csr_badv_diff_0
  difftestCSRRegState.io.eentry := io.csr_eentry_diff_0
  difftestCSRRegState.io.tlbidx := io.csr_tlbidx_diff_0
  difftestCSRRegState.io.tlbehi := io.csr_tlbehi_diff_0
  difftestCSRRegState.io.tlbelo0 := io.csr_tlbelo0_diff_0
  difftestCSRRegState.io.tlbelo1 := io.csr_tlbelo1_diff_0
  difftestCSRRegState.io.asid := io.csr_asid_diff_0
  difftestCSRRegState.io.pgdl := io.csr_pgdl_diff_0
  difftestCSRRegState.io.pgdh := io.csr_pgdh_diff_0
  difftestCSRRegState.io.save0 := io.csr_save0_diff_0
  difftestCSRRegState.io.save1 := io.csr_save1_diff_0
  difftestCSRRegState.io.save2 := io.csr_save2_diff_0
  difftestCSRRegState.io.save3 := io.csr_save3_diff_0
  difftestCSRRegState.io.tid := io.csr_tid_diff_0
  difftestCSRRegState.io.tcfg := io.csr_tcfg_diff_0
  difftestCSRRegState.io.tval := io.csr_tval_diff_0
  difftestCSRRegState.io.ticlr := io.csr_ticlr_diff_0
  difftestCSRRegState.io.llbctl := io.csr_llbctl_diff_0
  difftestCSRRegState.io.tlbrentry := io.csr_tlbrentry_diff_0
  difftestCSRRegState.io.dmw0 := io.csr_dmw0_diff_0
  difftestCSRRegState.io.dmw1 := io.csr_dmw1_diff_0
  
  val difftestGRegState = Module(new DifftestGRegState)
  difftestGRegState.io.clock := clock
  difftestGRegState.io.coreid := 0.U
  difftestGRegState.io.gpr_0 := 0.U
  difftestGRegState.io.gpr_1 := io.regs(1)
  difftestGRegState.io.gpr_2 := io.regs(2)
  difftestGRegState.io.gpr_3 := io.regs(3)
  difftestGRegState.io.gpr_4 := io.regs(4)
  difftestGRegState.io.gpr_5 := io.regs(5)
  difftestGRegState.io.gpr_6 := io.regs(6)
  difftestGRegState.io.gpr_7 := io.regs(7)
  difftestGRegState.io.gpr_8 := io.regs(8)
  difftestGRegState.io.gpr_9 := io.regs(9)
  difftestGRegState.io.gpr_10 := io.regs(10)
  difftestGRegState.io.gpr_11 := io.regs(11)
  difftestGRegState.io.gpr_12 := io.regs(12)
  difftestGRegState.io.gpr_13 := io.regs(13)
  difftestGRegState.io.gpr_14 := io.regs(14)
  difftestGRegState.io.gpr_15 := io.regs(15)
  difftestGRegState.io.gpr_16 := io.regs(16)
  difftestGRegState.io.gpr_17 := io.regs(17)
  difftestGRegState.io.gpr_18 := io.regs(18)
  difftestGRegState.io.gpr_19 := io.regs(19)
  difftestGRegState.io.gpr_20 := io.regs(20)
  difftestGRegState.io.gpr_21 := io.regs(21)
  difftestGRegState.io.gpr_22 := io.regs(22)
  difftestGRegState.io.gpr_23 := io.regs(23)
  difftestGRegState.io.gpr_24 := io.regs(24)
  difftestGRegState.io.gpr_25 := io.regs(25)
  difftestGRegState.io.gpr_26 := io.regs(26)
  difftestGRegState.io.gpr_27 := io.regs(27)
  difftestGRegState.io.gpr_28 := io.regs(28)
  difftestGRegState.io.gpr_29 := io.regs(29)
  difftestGRegState.io.gpr_30 := io.regs(30)
  difftestGRegState.io.gpr_31 := io.regs(31)
}
