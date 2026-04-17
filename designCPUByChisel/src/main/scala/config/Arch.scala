package config

import chisel3._
import chisel3.util._

// 创建一个对象来包含所有的参数键
object ArchConfigKeys {
  // 控制和状态寄存器位域定义
  
  // CRMD寄存器位域
  val CRMD_PLV = new Field[(Int, Int)]((1, 0))      // 特权级
  val CRMD_IE = new Field[Int](2)                   // 全局中断使能
  val CRMD_DA = new Field[Int](3)                   // 地址翻译使能
  val CRMD_PG = new Field[Int](4)                   // 页表使能
  val CRMD_DATF = new Field[(Int, Int)]((6, 5))     // 数据地址翻译模式
  val CRMD_DATM = new Field[(Int, Int)]((8, 7))     // 内存访问类型
  
  // PRMD寄存器位域
  val PRMD_PPLV = new Field[(Int, Int)]((1, 0))     // 前一个特权级
  val PRMD_PIE = new Field[Int](2)                  // 前一个中断使能
  
  // ECTL寄存器位域
  val ECTL_LIE = new Field[(Int, Int)]((12, 0))     // 本地中断使能
  val ECTL_LIE_1 = new Field[(Int, Int)]((9, 0))    // 本地中断使能低10位
  val ECTL_LIE_2 = new Field[(Int, Int)]((12, 11))  // 本地中断使能高2位
  
  // ESTAT寄存器位域
  val ESTAT_IS = new Field[(Int, Int)]((12, 0))     // 中断状态
  val ESTAT_ECODE = new Field[(Int, Int)]((21, 16)) // 异常代码
  val ESTAT_ESUBCODE = new Field[(Int, Int)]((30, 22)) // 异常子代码
  
  // TLBIDX寄存器位域
  val TLBIDX_INDEX = new Field[(Int, Int)]((4, 0))  // TLB索引
  val TLBIDX_PS = new Field[(Int, Int)]((29, 24))   // 页大小
  val TLBIDX_NE = new Field[Int](31)                // 无条目
  
  // TLBEHI寄存器位域
  val TLBEHI_VPPN = new Field[(Int, Int)]((31, 13)) // 虚页页号
  
  // TLBELO寄存器位域
  val TLBELO_V = new Field[Int](0)                  // 有效位
  val TLBELO_D = new Field[Int](1)                  // 脏位
  val TLBELO_PLV = new Field[(Int, Int)]((3, 2))    // 特权级
  val TLBELO_MAT = new Field[(Int, Int)]((5, 4))    // 内存访问类型
  val TLBELO_G = new Field[Int](6)                  // 全局位
  val TLBELO_PPN = new Field[(Int, Int)]((31, 8))   // 物理页号
  val TLBELO_PPN_EN = new Field[(Int, Int)]((27, 8)) // 物理页号使能位
  
  // ASID寄存器位域
  val ASID_TLB_ASID = new Field[(Int, Int)]((9, 0)) // TLB ASID
  
  // CPUID寄存器位域
  val CPUID_COREID = new Field[(Int, Int)]((8, 0))  // 核心ID
  
  // LLBCTL寄存器位域
  val LLBCTL_ROLLB = new Field[Int](0)              // 回滚LLB
  val LLBCTL_WCLLB = new Field[Int](1)              // 写条件LLB
  val LLBCTL_KLO = new Field[Int](2)               // 内核加载/存储顺序
  
  // TCFG寄存器位域
  val TCFG_EN = new Field[Int](0)                   // 定时器使能
  val TCFG_PERIODIC = new Field[Int](1)            // 周期性模式
  val TCFG_INITVAL = new Field[(Int, Int)]((31, 2)) // 初始值
  
  // TICLR寄存器位域
  val TICLR_CLR = new Field[Int](0)                // 定时器中断清除
  
  // TLBRENTRY寄存器位域
  val TLBRENTRY_PA = new Field[(Int, Int)]((31, 6)) // TLB重填入口地址
  
  // DMW寄存器位域
  val DMW_PLV0 = new Field[Int](0)                 // 特权级0
  val DMW_PLV3 = new Field[Int](3)                 // 特权级3
  val DMW_MAT = new Field[(Int, Int)]((5, 4))      // 内存访问类型
  val DMW_PSEG = new Field[(Int, Int)]((27, 25))   // 物理段
  val DMW_VSEG = new Field[(Int, Int)]((31, 29))   // 虚拟段
  
  // PGDL/PGDH/PGD寄存器位域
  val PGD_BASE = new Field[(Int, Int)]((31, 12))   // 页表基地址
  
  // 异常代码定义
  val ECODE_INT = new Field[Int](0x0)              // 中断
  val ECODE_PIL = new Field[Int](0x1)              // 缺页异常(取指)
  val ECODE_PIS = new Field[Int](0x2)              // 缺页异常(加载)
  val ECODE_PIF = new Field[Int](0x3)              // 缺页异常(存储)
  val ECODE_PME = new Field[Int](0x4)              // 页维护异常
  val ECODE_PPI = new Field[Int](0x7)              // 页特权级异常
  val ECODE_ADEF = new Field[Int](0x8)             // 地址错误异常(取指)
  val ECODE_ALE = new Field[Int](0x9)              // 地址错误异常(访存)
  val ECODE_SYS = new Field[Int](0xb)              // 系统调用
  val ECODE_BRK = new Field[Int](0xc)              // 断点异常
  val ECODE_INE = new Field[Int](0xd)              // 指令不存在
  val ECODE_IPE = new Field[Int](0xe)              // 指令特权级异常
  val ECODE_FPD = new Field[Int](0xf)              // 浮点禁用
  val ECODE_TLBR = new Field[Int](0x3f)            // TLB重填
  
  // 异常子代码定义
  val ESUBCODE_ADEF = new Field[Int](0x0)          // ADEF异常子代码
}

// 定义"参数特质" - 通过ArchConfigKeys对象访问参数键
trait HasArchParameters {
  implicit val p: Parameters
  
  // CSR寄存器位域访问器
  
  // CRMD
  val CRMD_PLV_LO: Int = p(ArchConfigKeys.CRMD_PLV)._1
  val CRMD_PLV_HI: Int = p(ArchConfigKeys.CRMD_PLV)._2
  val CRMD_IE_BIT: Int = p(ArchConfigKeys.CRMD_IE)
  val CRMD_DA_BIT: Int = p(ArchConfigKeys.CRMD_DA)
  val CRMD_PG_BIT: Int = p(ArchConfigKeys.CRMD_PG)
  val CRMD_DATF_LO: Int = p(ArchConfigKeys.CRMD_DATF)._1
  val CRMD_DATF_HI: Int = p(ArchConfigKeys.CRMD_DATF)._2
  val CRMD_DATM_LO: Int = p(ArchConfigKeys.CRMD_DATM)._1
  val CRMD_DATM_HI: Int = p(ArchConfigKeys.CRMD_DATM)._2
  
  // PRMD
  val PRMD_PPLV_LO: Int = p(ArchConfigKeys.PRMD_PPLV)._1
  val PRMD_PPLV_HI: Int = p(ArchConfigKeys.PRMD_PPLV)._2
  val PRMD_PIE_BIT: Int = p(ArchConfigKeys.PRMD_PIE)
  
  // ECTL
  val ECTL_LIE_LO: Int = p(ArchConfigKeys.ECTL_LIE)._1
  val ECTL_LIE_HI: Int = p(ArchConfigKeys.ECTL_LIE)._2
  val ECTL_LIE_1_LO: Int = p(ArchConfigKeys.ECTL_LIE_1)._1
  val ECTL_LIE_1_HI: Int = p(ArchConfigKeys.ECTL_LIE_1)._2
  val ECTL_LIE_2_LO: Int = p(ArchConfigKeys.ECTL_LIE_2)._1
  val ECTL_LIE_2_HI: Int = p(ArchConfigKeys.ECTL_LIE_2)._2
  
  // ESTAT
  val ESTAT_IS_LO: Int = p(ArchConfigKeys.ESTAT_IS)._1
  val ESTAT_IS_HI: Int = p(ArchConfigKeys.ESTAT_IS)._2
  val ESTAT_ECODE_LO: Int = p(ArchConfigKeys.ESTAT_ECODE)._1
  val ESTAT_ECODE_HI: Int = p(ArchConfigKeys.ESTAT_ECODE)._2
  val ESTAT_ESUBCODE_LO: Int = p(ArchConfigKeys.ESTAT_ESUBCODE)._1
  val ESTAT_ESUBCODE_HI: Int = p(ArchConfigKeys.ESTAT_ESUBCODE)._2
  
  // TLBIDX
  val TLBIDX_INDEX_LO: Int = p(ArchConfigKeys.TLBIDX_INDEX)._1
  val TLBIDX_INDEX_HI: Int = p(ArchConfigKeys.TLBIDX_INDEX)._2
  val TLBIDX_PS_LO: Int = p(ArchConfigKeys.TLBIDX_PS)._1
  val TLBIDX_PS_HI: Int = p(ArchConfigKeys.TLBIDX_PS)._2
  val TLBIDX_NE_BIT: Int = p(ArchConfigKeys.TLBIDX_NE)
  
  // TLBEHI
  val TLBEHI_VPPN_LO: Int = p(ArchConfigKeys.TLBEHI_VPPN)._1
  val TLBEHI_VPPN_HI: Int = p(ArchConfigKeys.TLBEHI_VPPN)._2
  
  // TLBELO
  val TLBELO_V_BIT: Int = p(ArchConfigKeys.TLBELO_V)
  val TLBELO_D_BIT: Int = p(ArchConfigKeys.TLBELO_D)
  val TLBELO_PLV_LO: Int = p(ArchConfigKeys.TLBELO_PLV)._1
  val TLBELO_PLV_HI: Int = p(ArchConfigKeys.TLBELO_PLV)._2
  val TLBELO_MAT_LO: Int = p(ArchConfigKeys.TLBELO_MAT)._1
  val TLBELO_MAT_HI: Int = p(ArchConfigKeys.TLBELO_MAT)._2
  val TLBELO_G_BIT: Int = p(ArchConfigKeys.TLBELO_G)
  val TLBELO_PPN_LO: Int = p(ArchConfigKeys.TLBELO_PPN)._1
  val TLBELO_PPN_HI: Int = p(ArchConfigKeys.TLBELO_PPN)._2
  val TLBELO_PPN_EN_LO: Int = p(ArchConfigKeys.TLBELO_PPN_EN)._1
  val TLBELO_PPN_EN_HI: Int = p(ArchConfigKeys.TLBELO_PPN_EN)._2
  
  // ASID
  val ASID_TLB_ASID_LO: Int = p(ArchConfigKeys.ASID_TLB_ASID)._1
  val ASID_TLB_ASID_HI: Int = p(ArchConfigKeys.ASID_TLB_ASID)._2
  
  // CPUID
  val CPUID_COREID_LO: Int = p(ArchConfigKeys.CPUID_COREID)._1
  val CPUID_COREID_HI: Int = p(ArchConfigKeys.CPUID_COREID)._2
  
  // LLBCTL
  val LLBCTL_ROLLB_BIT: Int = p(ArchConfigKeys.LLBCTL_ROLLB)
  val LLBCTL_WCLLB_BIT: Int = p(ArchConfigKeys.LLBCTL_WCLLB)
  val LLBCTL_KLO_BIT: Int = p(ArchConfigKeys.LLBCTL_KLO)
  
  // TCFG
  val TCFG_EN_BIT: Int = p(ArchConfigKeys.TCFG_EN)
  val TCFG_PERIODIC_BIT: Int = p(ArchConfigKeys.TCFG_PERIODIC)
  val TCFG_INITVAL_LO: Int = p(ArchConfigKeys.TCFG_INITVAL)._1
  val TCFG_INITVAL_HI: Int = p(ArchConfigKeys.TCFG_INITVAL)._2
  
  // TICLR
  val TICLR_CLR_BIT: Int = p(ArchConfigKeys.TICLR_CLR)
  
  // TLBRENTRY
  val TLBRENTRY_PA_LO: Int = p(ArchConfigKeys.TLBRENTRY_PA)._1
  val TLBRENTRY_PA_HI: Int = p(ArchConfigKeys.TLBRENTRY_PA)._2
  
  // DMW
  val DMW_PLV0_BIT: Int = p(ArchConfigKeys.DMW_PLV0)
  val DMW_PLV3_BIT: Int = p(ArchConfigKeys.DMW_PLV3)
  val DMW_MAT_LO: Int = p(ArchConfigKeys.DMW_MAT)._1
  val DMW_MAT_HI: Int = p(ArchConfigKeys.DMW_MAT)._2
  val DMW_PSEG_LO: Int = p(ArchConfigKeys.DMW_PSEG)._1
  val DMW_PSEG_HI: Int = p(ArchConfigKeys.DMW_PSEG)._2
  val DMW_VSEG_LO: Int = p(ArchConfigKeys.DMW_VSEG)._1
  val DMW_VSEG_HI: Int = p(ArchConfigKeys.DMW_VSEG)._2
  
  // PGD
  val PGD_BASE_LO: Int = p(ArchConfigKeys.PGD_BASE)._1
  val PGD_BASE_HI: Int = p(ArchConfigKeys.PGD_BASE)._2
  
  // 异常代码
  val ECODE_INT_VAL: Int = p(ArchConfigKeys.ECODE_INT)
  val ECODE_PIL_VAL: Int = p(ArchConfigKeys.ECODE_PIL)
  val ECODE_PIS_VAL: Int = p(ArchConfigKeys.ECODE_PIS)
  val ECODE_PIF_VAL: Int = p(ArchConfigKeys.ECODE_PIF)
  val ECODE_PME_VAL: Int = p(ArchConfigKeys.ECODE_PME)
  val ECODE_PPI_VAL: Int = p(ArchConfigKeys.ECODE_PPI)
  val ECODE_ADEF_VAL: Int = p(ArchConfigKeys.ECODE_ADEF)
  val ECODE_ALE_VAL: Int = p(ArchConfigKeys.ECODE_ALE)
  val ECODE_SYS_VAL: Int = p(ArchConfigKeys.ECODE_SYS)
  val ECODE_BRK_VAL: Int = p(ArchConfigKeys.ECODE_BRK)
  val ECODE_INE_VAL: Int = p(ArchConfigKeys.ECODE_INE)
  val ECODE_IPE_VAL: Int = p(ArchConfigKeys.ECODE_IPE)
  val ECODE_FPD_VAL: Int = p(ArchConfigKeys.ECODE_FPD)
  val ECODE_TLBR_VAL: Int = p(ArchConfigKeys.ECODE_TLBR)
  
  // 异常子代码
  val ESUBCODE_ADEF_VAL: Int = p(ArchConfigKeys.ESUBCODE_ADEF)
  
  // 实用函数：提取位域
  def extractField(data: UInt, hi: Int, lo: Int): UInt = {
    data(hi, lo)
  }
  
  def setField(data: UInt, value: UInt, hi: Int, lo: Int): UInt = {
    val mask = ((1L << (hi - lo + 1)) - 1L).U << lo
    (data & ~mask) | (value << lo)
  }
}