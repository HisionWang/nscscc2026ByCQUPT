package nscscc.config

import chisel3._

object CsrConfigKeys {
  val CRMD_PLV = new Field[(Int, Int)]((1, 0))
  val CRMD_IE = new Field[Int](2)
  val CRMD_DA = new Field[Int](3)
  val CRMD_PG = new Field[Int](4)
  val CRMD_DATF = new Field[(Int, Int)]((6, 5))
  val CRMD_DATM = new Field[(Int, Int)]((8, 7))
  val PRMD_PPLV = new Field[(Int, Int)]((1, 0))
  val PRMD_PIE = new Field[Int](2)
  val ECTL_LIE = new Field[(Int, Int)]((12, 0))
  val ECTL_LIE_1 = new Field[(Int, Int)]((9, 0))
  val ECTL_LIE_2 = new Field[(Int, Int)]((12, 11))
  val ESTAT_IS = new Field[(Int, Int)]((12, 0))
  val ESTAT_ECODE = new Field[(Int, Int)]((21, 16))
  val ESTAT_ESUBCODE = new Field[(Int, Int)]((30, 22))
  val TLBIDX_INDEX = new Field[(Int, Int)]((4, 0))
  val TLBIDX_PS = new Field[(Int, Int)]((29, 24))
  val TLBIDX_NE = new Field[Int](31)
  val TLBEHI_VPPN = new Field[(Int, Int)]((31, 13))
  val TLBELO_V = new Field[Int](0)
  val TLBELO_D = new Field[Int](1)
  val TLBELO_PLV = new Field[(Int, Int)]((3, 2))
  val TLBELO_MAT = new Field[(Int, Int)]((5, 4))
  val TLBELO_G = new Field[Int](6)
  val TLBELO_PPN = new Field[(Int, Int)]((31, 8))
  val TLBELO_PPN_EN = new Field[(Int, Int)]((27, 8))
  val ASID_TLB_ASID = new Field[(Int, Int)]((9, 0))
  val CPUID_COREID = new Field[(Int, Int)]((8, 0))
  val LLBCTL_ROLLB = new Field[Int](0)
  val LLBCTL_WCLLB = new Field[Int](1)
  val LLBCTL_KLO = new Field[Int](2)
  val TCFG_EN = new Field[Int](0)
  val TCFG_PERIODIC = new Field[Int](1)
  val TCFG_INITVAL = new Field[(Int, Int)]((31, 2))
  val TICLR_CLR = new Field[Int](0)
  val TLBRENTRY_PA = new Field[(Int, Int)]((31, 6))
  val DMW_PLV0 = new Field[Int](0)
  val DMW_PLV3 = new Field[Int](3)
  val DMW_MAT = new Field[(Int, Int)]((5, 4))
  val DMW_PSEG = new Field[(Int, Int)]((27, 25))
  val DMW_VSEG = new Field[(Int, Int)]((31, 29))
  val PGD_BASE = new Field[(Int, Int)]((31, 12))
  val ECODE_INT = new Field[Int](0x0)
  val ECODE_PIL = new Field[Int](0x1)
  val ECODE_PIS = new Field[Int](0x2)
  val ECODE_PIF = new Field[Int](0x3)
  val ECODE_PME = new Field[Int](0x4)
  val ECODE_PPI = new Field[Int](0x7)
  val ECODE_ADEF = new Field[Int](0x8)
  val ECODE_ALE = new Field[Int](0x9)
  val ECODE_SYS = new Field[Int](0xb)
  val ECODE_BRK = new Field[Int](0xc)
  val ECODE_INE = new Field[Int](0xd)
  val ECODE_IPE = new Field[Int](0xe)
  val ECODE_FPD = new Field[Int](0xf)
  val ECODE_TLBR = new Field[Int](0x3f)
  val ESUBCODE_ADEF = new Field[Int](0x0)
  val VPPN_LEN = new Field[Int](19)
  val TLB_ASID_LEN = new Field[Int](10)
  val PPN_LEN = new Field[Int](20)
  val PLV_LEN = new Field[Int](2)
  val MAT_LEN = new Field[Int](2)
  val PS_LEN = new Field[Int](6)
  val TLBIDX_INDEX_LEN = new Field[Int](5)
  val INVTLB_OP_LEN = new Field[Int](5)
  val CSR_ADDR_LEN = new Field[Int](14)
  val IRQ_WIDTH = new Field[Int](8)
  val TIMER_LEN = new Field[Int](64)
  val ISA = new Field[String]("LA32R")
}

trait HasCsrParameters {
  implicit val p: Parameters

  val CRMD_PLV_LO: Int = p(CsrConfigKeys.CRMD_PLV)._1
  val CRMD_PLV_HI: Int = p(CsrConfigKeys.CRMD_PLV)._2
  val CRMD_IE_BIT: Int = p(CsrConfigKeys.CRMD_IE)
  val CRMD_DA_BIT: Int = p(CsrConfigKeys.CRMD_DA)
  val CRMD_PG_BIT: Int = p(CsrConfigKeys.CRMD_PG)
  val CRMD_DATF_LO: Int = p(CsrConfigKeys.CRMD_DATF)._1
  val CRMD_DATF_HI: Int = p(CsrConfigKeys.CRMD_DATF)._2
  val CRMD_DATM_LO: Int = p(CsrConfigKeys.CRMD_DATM)._1
  val CRMD_DATM_HI: Int = p(CsrConfigKeys.CRMD_DATM)._2
  val PRMD_PPLV_LO: Int = p(CsrConfigKeys.PRMD_PPLV)._1
  val PRMD_PPLV_HI: Int = p(CsrConfigKeys.PRMD_PPLV)._2
  val PRMD_PIE_BIT: Int = p(CsrConfigKeys.PRMD_PIE)
  val ECTL_LIE_LO: Int = p(CsrConfigKeys.ECTL_LIE)._1
  val ECTL_LIE_HI: Int = p(CsrConfigKeys.ECTL_LIE)._2
  val ECTL_LIE_1_LO: Int = p(CsrConfigKeys.ECTL_LIE_1)._1
  val ECTL_LIE_1_HI: Int = p(CsrConfigKeys.ECTL_LIE_1)._2
  val ECTL_LIE_2_LO: Int = p(CsrConfigKeys.ECTL_LIE_2)._1
  val ECTL_LIE_2_HI: Int = p(CsrConfigKeys.ECTL_LIE_2)._2
  val ESTAT_IS_LO: Int = p(CsrConfigKeys.ESTAT_IS)._1
  val ESTAT_IS_HI: Int = p(CsrConfigKeys.ESTAT_IS)._2
  val ESTAT_ECODE_LO: Int = p(CsrConfigKeys.ESTAT_ECODE)._1
  val ESTAT_ECODE_HI: Int = p(CsrConfigKeys.ESTAT_ECODE)._2
  val ESTAT_ESUBCODE_LO: Int = p(CsrConfigKeys.ESTAT_ESUBCODE)._1
  val ESTAT_ESUBCODE_HI: Int = p(CsrConfigKeys.ESTAT_ESUBCODE)._2
  val TLBIDX_INDEX_LO: Int = p(CsrConfigKeys.TLBIDX_INDEX)._1
  val TLBIDX_INDEX_HI: Int = p(CsrConfigKeys.TLBIDX_INDEX)._2
  val TLBIDX_PS_LO: Int = p(CsrConfigKeys.TLBIDX_PS)._1
  val TLBIDX_PS_HI: Int = p(CsrConfigKeys.TLBIDX_PS)._2
  val TLBIDX_NE_BIT: Int = p(CsrConfigKeys.TLBIDX_NE)
  val TLBEHI_VPPN_LO: Int = p(CsrConfigKeys.TLBEHI_VPPN)._1
  val TLBEHI_VPPN_HI: Int = p(CsrConfigKeys.TLBEHI_VPPN)._2
  val TLBELO_V_BIT: Int = p(CsrConfigKeys.TLBELO_V)
  val TLBELO_D_BIT: Int = p(CsrConfigKeys.TLBELO_D)
  val TLBELO_PLV_LO: Int = p(CsrConfigKeys.TLBELO_PLV)._1
  val TLBELO_PLV_HI: Int = p(CsrConfigKeys.TLBELO_PLV)._2
  val TLBELO_MAT_LO: Int = p(CsrConfigKeys.TLBELO_MAT)._1
  val TLBELO_MAT_HI: Int = p(CsrConfigKeys.TLBELO_MAT)._2
  val TLBELO_G_BIT: Int = p(CsrConfigKeys.TLBELO_G)
  val TLBELO_PPN_LO: Int = p(CsrConfigKeys.TLBELO_PPN)._1
  val TLBELO_PPN_HI: Int = p(CsrConfigKeys.TLBELO_PPN)._2
  val TLBELO_PPN_EN_LO: Int = p(CsrConfigKeys.TLBELO_PPN_EN)._1
  val TLBELO_PPN_EN_HI: Int = p(CsrConfigKeys.TLBELO_PPN_EN)._2
  val ASID_TLB_ASID_LO: Int = p(CsrConfigKeys.ASID_TLB_ASID)._1
  val ASID_TLB_ASID_HI: Int = p(CsrConfigKeys.ASID_TLB_ASID)._2
  val CPUID_COREID_LO: Int = p(CsrConfigKeys.CPUID_COREID)._1
  val CPUID_COREID_HI: Int = p(CsrConfigKeys.CPUID_COREID)._2
  val LLBCTL_ROLLB_BIT: Int = p(CsrConfigKeys.LLBCTL_ROLLB)
  val LLBCTL_WCLLB_BIT: Int = p(CsrConfigKeys.LLBCTL_WCLLB)
  val LLBCTL_KLO_BIT: Int = p(CsrConfigKeys.LLBCTL_KLO)
  val TCFG_EN_BIT: Int = p(CsrConfigKeys.TCFG_EN)
  val TCFG_PERIODIC_BIT: Int = p(CsrConfigKeys.TCFG_PERIODIC)
  val TCFG_INITVAL_LO: Int = p(CsrConfigKeys.TCFG_INITVAL)._1
  val TCFG_INITVAL_HI: Int = p(CsrConfigKeys.TCFG_INITVAL)._2
  val TICLR_CLR_BIT: Int = p(CsrConfigKeys.TICLR_CLR)
  val TLBRENTRY_PA_LO: Int = p(CsrConfigKeys.TLBRENTRY_PA)._1
  val TLBRENTRY_PA_HI: Int = p(CsrConfigKeys.TLBRENTRY_PA)._2
  val DMW_PLV0_BIT: Int = p(CsrConfigKeys.DMW_PLV0)
  val DMW_PLV3_BIT: Int = p(CsrConfigKeys.DMW_PLV3)
  val DMW_MAT_LO: Int = p(CsrConfigKeys.DMW_MAT)._1
  val DMW_MAT_HI: Int = p(CsrConfigKeys.DMW_MAT)._2
  val DMW_PSEG_LO: Int = p(CsrConfigKeys.DMW_PSEG)._1
  val DMW_PSEG_HI: Int = p(CsrConfigKeys.DMW_PSEG)._2
  val DMW_VSEG_LO: Int = p(CsrConfigKeys.DMW_VSEG)._1
  val DMW_VSEG_HI: Int = p(CsrConfigKeys.DMW_VSEG)._2
  val PGD_BASE_LO: Int = p(CsrConfigKeys.PGD_BASE)._1
  val PGD_BASE_HI: Int = p(CsrConfigKeys.PGD_BASE)._2
  val ECODE_INT_VAL: Int = p(CsrConfigKeys.ECODE_INT)
  val ECODE_PIL_VAL: Int = p(CsrConfigKeys.ECODE_PIL)
  val ECODE_PIS_VAL: Int = p(CsrConfigKeys.ECODE_PIS)
  val ECODE_PIF_VAL: Int = p(CsrConfigKeys.ECODE_PIF)
  val ECODE_PME_VAL: Int = p(CsrConfigKeys.ECODE_PME)
  val ECODE_PPI_VAL: Int = p(CsrConfigKeys.ECODE_PPI)
  val ECODE_ADEF_VAL: Int = p(CsrConfigKeys.ECODE_ADEF)
  val ECODE_ALE_VAL: Int = p(CsrConfigKeys.ECODE_ALE)
  val ECODE_SYS_VAL: Int = p(CsrConfigKeys.ECODE_SYS)
  val ECODE_BRK_VAL: Int = p(CsrConfigKeys.ECODE_BRK)
  val ECODE_INE_VAL: Int = p(CsrConfigKeys.ECODE_INE)
  val ECODE_IPE_VAL: Int = p(CsrConfigKeys.ECODE_IPE)
  val ECODE_FPD_VAL: Int = p(CsrConfigKeys.ECODE_FPD)
  val ECODE_TLBR_VAL: Int = p(CsrConfigKeys.ECODE_TLBR)
  val ESUBCODE_ADEF_VAL: Int = p(CsrConfigKeys.ESUBCODE_ADEF)
  val vppnLen: Int = p(CsrConfigKeys.VPPN_LEN)
  val asidLen: Int = p(CsrConfigKeys.TLB_ASID_LEN)
  val ppnLen: Int = p(CsrConfigKeys.PPN_LEN)
  val plvLen: Int = p(CsrConfigKeys.PLV_LEN)
  val matLen: Int = p(CsrConfigKeys.MAT_LEN)
  val psLen: Int = p(CsrConfigKeys.PS_LEN)
  val invtlbOpLen: Int = p(CsrConfigKeys.INVTLB_OP_LEN)
  val csrAddrLen: Int = p(CsrConfigKeys.CSR_ADDR_LEN)
  val irqWidth: Int = p(CsrConfigKeys.IRQ_WIDTH)
  val TimerLen: Int = p(CsrConfigKeys.TIMER_LEN)
  val ISA: String = p(CsrConfigKeys.ISA)

  object csrAddr {
    def crmd      = 0x0
    def prmd      = 0x1
    def ecfg      = 0x4
    def estat     = 0x5
    def era       = 0x6
    def badv      = 0x7
    def eentry    = 0xc
    def tlbelo0   = 0x12
    def tlbelo1   = 0x13
    def tlbidx    = 0x10
    def tlbehi    = 0x11
    def asid      = 0x18
    def save0     = 0x30
    def save1     = 0x31
    def save2     = 0x32
    def save3     = 0x33
    def tid       = 0x40
    def tcfg      = 0x41
    def tval      = 0x42
    def ticlr     = 0x44
    def tlbrentry = 0x88
    def dmw0      = 0x180
    def dmw1      = 0x181
    def llbctl    = 0x60
    def pgdl      = 0x19
    def pgdh      = 0x1a
    def pgd       = 0x1b
  }

  object csrInit {
    def crmd = 0x00000000
    def prmd = 0x00000000
  }

  def extractField(data: UInt, hi: Int, lo: Int): UInt = data(hi, lo)

  def setField(data: UInt, value: UInt, hi: Int, lo: Int): UInt = {
    val mask = ((1L << (hi - lo + 1)) - 1L).U << lo
    (data & ~mask) | (value << lo)
  }
}
