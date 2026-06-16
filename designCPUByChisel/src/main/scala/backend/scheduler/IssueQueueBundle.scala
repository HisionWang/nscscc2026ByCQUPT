package nscscc.backend.issue
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
// ═══════════════════════════════════════════════════════════════
//  写回唤醒广播信号
// ═══════════════════════════════════════════════════════════════
class IssueWakeup(implicit p: Parameters) extends NSBundle {
  val pdst = UInt(PhyRegIdxWidth.W)
}
 
// ═══════════════════════════════════════════════════════════════
//  重定向信息（带环绕位的 robIdx）
// ═══════════════════════════════════════════════════════════════
//class RedirectInfo(implicit p: Parameters) extends NSBundle {
//  val valid      = Bool()
//  val robIdxFull = UInt((log2Ceil(RobSize) + 1).W)
//}
 
// ═══════════════════════════════════════════════════════════════
//  IQ 类型标识
// ═══════════════════════════════════════════════════════════════
object IQType {
  val ALU_CSR     = 0
  val ALU_DIV     = 1
  val ALU_MUL_JMP = 2
  val LOAD_STA    = 3
  val STD         = 4
}
 
// ═══════════════════════════════════════════════════════════════
//  IQ 参数
// ═══════════════════════════════════════════════════════════════
// case class IQParams(
//   numEntries: Int,
//   numWakeupPorts: Int,
//   iqType: Int
// )
//  
// object IQConfigs {
//   // 全局写回端口数：ALU×3 + MUL + DIV + BRU + CSR + LOAD×2 = 9
//   val numWakeupPorts = 5
//  
//   val Q1 = IQParams(numEntries = 16, numWakeupPorts = numWakeupPorts, iqType = IQType.ALU_CSR)
//   val Q2 = IQParams(numEntries = 12, numWakeupPorts = numWakeupPorts, iqType = IQType.ALU_DIV)
//   val Q3 = IQParams(numEntries = 16, numWakeupPorts = numWakeupPorts, iqType = IQType.ALU_MUL_JMP)
//   val Q4 = IQParams(numEntries = 16, numWakeupPorts = numWakeupPorts, iqType = IQType.LOAD_STA)
//   val Q5 = IQParams(numEntries = 8,  numWakeupPorts = numWakeupPorts, iqType = IQType.STD)
// }