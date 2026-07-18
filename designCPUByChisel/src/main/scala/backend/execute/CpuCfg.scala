package nscscc.csr
 
import chisel3._
import chisel3.util._
import nscscc.config.{NSModule, Parameters}
 
class CpuCfg(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val addr  = Input(UInt(32.W))   // rj 的值，即配置字号
    val rdata = Output(UInt(32.W))  // 读出的配置信息字
  })
 
  // ── 根据你提供的 localparam 定义配置常量 ──
  // 若你的 CPU 有 ICache / DCache / MMU 等，修改这些值即可
  val ARCH            = 2.U(2.W)    // 00=LA32, 01=LA64, 10=LA32R
  val PGMMU           = 0.U(1.W)    // 是否实现页表映射MMU
  val PALEN           = 0x1f.U(8.W) // 物理地址位数
  val VALEN           = 0x1f.U(8.W) // 虚拟地址位数
  val FP              = 0.U(1.W)
  val FP_SP           = 0.U(1.W)
  val FP_DP           = 0.U(1.W)
  val L1_I_PRESENT    = 0.U(1.W)    // 是否有一级指令Cache
  val L1_D_PRESENT    = 0.U(1.W)    // 是否有一级数据Cache
  val L2_U_PRESENT    = 0.U(2.W)    // 是否有统一二级Cache
  val L2_U_INCLUSIVE  = 0.U(1.W)
  val I_WAY           = 0.U(16.W)
  val I_INDEX_LOG2    = 0.U(8.W)
  val I_LINESIZE_LOG2 = 0.U(7.W)
  val D_WAY           = 0.U(16.W)
  val D_INDEX_LOG2    = 0.U(8.W)
  val D_LINESIZE_LOG2 = 0.U(7.W)
  val U_WAY           = 0.U(16.W)
  val U_INDEX_LOG2    = 0.U(8.W)
  val U_LINESIZE_LOG2 = 0.U(7.W)
 
  // ── 配置信息字拼接（严格按照龙芯手册位域） ──
  val cfg_0x1  = Cat(0.U(12.W), VALEN, PALEN, 0.U(1.W), PGMMU, ARCH)
  val cfg_0x2  = Cat(0.U(29.W), FP_DP, FP_SP, FP)
  val cfg_0x10 = Cat(0.U(25.W), L2_U_INCLUSIVE, 0.U(1.W), L2_U_PRESENT,
                     L1_D_PRESENT, 0.U(1.W), L1_I_PRESENT)
  val cfg_0x11 = Cat(0.U(1.W), I_LINESIZE_LOG2, I_INDEX_LOG2, I_WAY)
  val cfg_0x12 = Cat(0.U(1.W), D_LINESIZE_LOG2, D_INDEX_LOG2, D_WAY)
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