package nscscc.csr
 
import chisel3._
import chisel3.util._
import nscscc.config.{NSModule, Parameters}
 
class CpuCfg(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val addr  = Input(UInt(32.W))   // rj 的值，即配置字号
    val rdata = Output(UInt(32.W))  // 读出的配置信息字
  })

  // 依据当前 CPU 定义填写：
  // - LA32R
  // - 实现了带页表的 MMU
  // - L1 为分离的 ICache / DCache
  // - 当前没有 L2 / L3 Cache
  val ARCH            = 0.U(2.W)    // 00=LA32R, 01=LA32, 10=LA64
  val PGMMU           = 1.U(1.W)    // 实现页表映射 MMU
  val PALEN           = 0x1f.U(8.W) // 32-bit physical address => PALEN = 31
  val VALEN           = 0x1f.U(8.W) // 32-bit virtual address  => VALEN = 31
  val FP              = 0.U(1.W)
  val FP_SP           = 0.U(1.W)
  val FP_DP           = 0.U(1.W)

  // 0x10 Cache 层级能力
  val L1_IU_PRESENT    = 1.U(1.W)
  val L1_IU_UNIFY      = 0.U(1.W)
  val L1_D_PRESENT     = 1.U(1.W)
  val L2_IU_PRESENT    = 0.U(1.W)
  val L2_IU_UNIFY      = 0.U(1.W)
  val L2_IU_PRIVATE    = 0.U(1.W)
  val L2_IU_INCLUSIVE  = 0.U(1.W)
  val L2_D_PRESENT     = 0.U(1.W)
  val L2_D_PRIVATE     = 0.U(1.W)
  val L2_D_INCLUSIVE   = 0.U(1.W)
  val L3_IU_PRESENT    = 0.U(1.W)
  val L3_IU_UNIFY      = 0.U(1.W)
  val L3_IU_PRIVATE    = 0.U(1.W)
  val L3_IU_INCLUSIVE  = 0.U(1.W)
  val L3_D_PRESENT     = 0.U(1.W)
  val L3_D_PRIVATE     = 0.U(1.W)
  val L3_D_INCLUSIVE   = 0.U(1.W)

  // 0x11 / 0x12: 当前 L1 ICache / DCache 都使用全局 Cache 参数
  val I_WAY_MINUS1       = (nWays - 1).U(16.W)
  val I_INDEX_LOG2       = idxBits.U(8.W)
  val I_LINESIZE_LOG2    = blockOffBits.U(7.W)
  val D_WAY_MINUS1       = (nWays - 1).U(16.W)
  val D_INDEX_LOG2       = idxBits.U(8.W)
  val D_LINESIZE_LOG2    = blockOffBits.U(7.W)

  // 0x13 / 0x14: 当前无 L2 / L3
  val L2_WAY_MINUS1      = 0.U(16.W)
  val L2_INDEX_LOG2      = 0.U(8.W)
  val L2_LINESIZE_LOG2   = 0.U(7.W)
  val L3_WAY_MINUS1      = 0.U(16.W)
  val L3_INDEX_LOG2      = 0.U(8.W)
  val L3_LINESIZE_LOG2   = 0.U(7.W)

  // ── 配置信息字拼接（严格按照龙芯手册位域） ──
  val cfg_0x1  = Cat(0.U(12.W), VALEN, PALEN, 0.U(1.W), PGMMU, ARCH)
  val cfg_0x2  = Cat(0.U(29.W), FP_DP, FP_SP, FP)
  val cfg_0x10 = Cat(
    0.U(15.W),
    L3_D_INCLUSIVE,
    L3_D_PRIVATE,
    L3_D_PRESENT,
    L3_IU_INCLUSIVE,
    L3_IU_PRIVATE,
    L3_IU_UNIFY,
    L3_IU_PRESENT,
    L2_D_INCLUSIVE,
    L2_D_PRIVATE,
    L2_D_PRESENT,
    L2_IU_INCLUSIVE,
    L2_IU_PRIVATE,
    L2_IU_UNIFY,
    L2_IU_PRESENT,
    L1_D_PRESENT,
    L1_IU_UNIFY,
    L1_IU_PRESENT
  )
  val cfg_0x11 = Cat(0.U(1.W), I_LINESIZE_LOG2, I_INDEX_LOG2, I_WAY_MINUS1)
  val cfg_0x12 = Cat(0.U(1.W), D_LINESIZE_LOG2, D_INDEX_LOG2, D_WAY_MINUS1)
  val cfg_0x13 = Cat(0.U(1.W), L2_LINESIZE_LOG2, L2_INDEX_LOG2, L2_WAY_MINUS1)
  val cfg_0x14 = Cat(0.U(1.W), L3_LINESIZE_LOG2, L3_INDEX_LOG2, L3_WAY_MINUS1)
 
  // ── 查询逻辑：未定义配置字返回全0 ──
  io.rdata := MuxLookup(io.addr, 0.U(32.W))(Seq(
    1.U  -> cfg_0x1,
    2.U  -> cfg_0x2,
    0x10.U -> cfg_0x10,
    0x11.U -> cfg_0x11,
    0x12.U -> cfg_0x12,
    0x13.U -> cfg_0x13,
    0x14.U -> cfg_0x14
  ))
}
