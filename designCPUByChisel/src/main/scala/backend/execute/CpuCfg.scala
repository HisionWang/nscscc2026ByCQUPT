package nscscc.csr
 
import chisel3._
import chisel3.util._
import nscscc.config.{NSModule, Parameters}
 
class CpuCfg(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val addr  = Input(UInt(32.W))   // rj 的值，即配置字号
    val rdata = Output(UInt(32.W))  // 读出的配置信息字
  })

  require(nWays > 0 && nWays <= (1 << 16), "CPUCFG cache way count is out of range")

  // CPUCFG.1: this core implements reduced LA32 (LA32R), a paging MMU,
  // and 32-bit physical/virtual addresses.  PALEN and VALEN encode width - 1.
  val ARCH            = 0.U(2.W)          // 00=LA32R, 01=LA32S, 10=LA64
  val PGMMU           = 1.U(1.W)
  val PALEN           = (XLEN - 1).U(8.W)
  val VALEN           = (XLEN - 1).U(8.W)
  val FP              = 0.U(1.W)
  val FP_SP           = 0.U(1.W)
  val FP_DP           = 0.U(1.W)

  // Both L1 caches use the shared core parameters: nWays ways, nSets sets,
  // and blockBytes bytes per line.  CPUCFG stores ways - 1 and log2 sizes.
  val L1_I_PRESENT    = 1.U(1.W)
  val L1_D_PRESENT    = 1.U(1.W)
  val L2_U_PRESENT    = 0.U(2.W)    // 是否有统一二级Cache
  val L2_U_INCLUSIVE  = 0.U(1.W)
  val I_WAY_MINUS_1   = (nWays - 1).U(16.W)
  val I_INDEX_LOG2    = idxBits.U(8.W)
  val I_LINESIZE_LOG2 = blockOffBits.U(7.W)
  val D_WAY_MINUS_1   = (nWays - 1).U(16.W)
  val D_INDEX_LOG2    = idxBits.U(8.W)
  val D_LINESIZE_LOG2 = blockOffBits.U(7.W)
  val U_WAY           = 0.U(16.W)
  val U_INDEX_LOG2    = 0.U(8.W)
  val U_LINESIZE_LOG2 = 0.U(7.W)
 
  // ── 配置信息字拼接（严格按照龙芯手册位域） ──
  val cfg_0x1  = Cat(0.U(12.W), VALEN, PALEN, 0.U(1.W), PGMMU, ARCH)
  val cfg_0x2  = Cat(0.U(29.W), FP_DP, FP_SP, FP)
  val cfg_0x10 = Cat(0.U(25.W), L2_U_INCLUSIVE, 0.U(1.W), L2_U_PRESENT,
                     L1_D_PRESENT, 0.U(1.W), L1_I_PRESENT)
  val cfg_0x11 = Cat(0.U(1.W), I_LINESIZE_LOG2, I_INDEX_LOG2, I_WAY_MINUS_1)
  val cfg_0x12 = Cat(0.U(1.W), D_LINESIZE_LOG2, D_INDEX_LOG2, D_WAY_MINUS_1)
  val cfg_0x13 = Cat(0.U(1.W), U_LINESIZE_LOG2, U_INDEX_LOG2, U_WAY)
 
  // ── 查询逻辑：未定义配置字返回全0 ──
  io.rdata := MuxLookup(io.addr, 0.U(32.W))(Seq(
    1.U  -> cfg_0x1,
    2.U  -> cfg_0x2,
    0x10.U -> cfg_0x10,
    0x11.U -> cfg_0x11,
    0x12.U -> cfg_0x12,
    0x13.U -> cfg_0x13
  ))
}
