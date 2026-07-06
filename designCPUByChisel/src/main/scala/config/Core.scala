// 文件: src/main/scala/config/NSCore.scala
package nscscc.config

import chisel3._
import chisel3.util._

object MmuconfigKeys {
  val TlbNum = new Field[Int](32)
  val TlbSearchPortNum = new Field[Int](2)
}

object DebugConfigKeys {
  val EnableDifftest = new Field[Boolean](true)
}

case class IQParams(
  numEntries: Int,
  numWakeupPorts: Int,
)
 
// 4. 定义"参数特质" - 通过CPUConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters
  val XLEN : Int = 32
  // ============================================================
  // === BPU (Branch Prediction Unit) 参数 ===
  // ============================================================
   /*---- 通路位宽相关 ----*/
  val  fetchWidth: Int = 4
  
  val  CtrlBlockWidth : Int = 3

  // --- 基本容量 ---
  val btbSize:  Int = 16
  val phtSize:  Int = 64
  val rasSize:  Int = 8 

  val fetchBlockBits: Int = log2Ceil(fetchWidth * 4)
  val btbIndexBits: Int = log2Ceil(btbSize)
  val phtIndexBits: Int = log2Ceil(phtSize)
  val btbTagBits: Int = 32 - fetchBlockBits - btbIndexBits
  val fetchOffsetBits: Int = log2Ceil(fetchWidth)

  /*---- ICache相关 ----*/
  val  nSets:      Int = 256
  val  nWays:      Int = 4
  val  blockBytes: Int = 64
  val idxBits     = log2Ceil(nSets)
  val wayBits     = log2Ceil(nWays)
  val blockOffBits = log2Ceil(blockBytes)
  val tagBits     = 32 - idxBits - blockOffBits

  val nMshrEntries: Int = 4
  val icacheAxiMissId : Int = nMshrEntries
  val icacheAxiNucacheId : Int = icacheAxiMissId + 1

  val burstNum: Int = 16

  val  ibufDepth:  Int = 16  // 必须为2的次方倍



  // ============================================================
  // === 后端 Dispatch / ROB / IQ 参数 ===
  // ============================================================

  val IntLogicRegs  = 32           // 逻辑寄存器数量
  val IntPhyRegs    = 128           // 物理寄存器数量（可调整）
  val PhyRegIdxWidth = log2Ceil(IntPhyRegs)
  val RobSize       = 64           // ROB 深度
  val SnapshotNum   = 8            // 快照数量
  val CommitWidth   = 1//CtrlBlockWidth  // 提交宽度（通常等于译码宽度）

  val LqSize       : Int = 16      // Load Queue 深度（2的幂）
  val SqSize       : Int = 16      // Store Queue 深度（2的幂）
  val WbBusWidth   : Int = 5       // 写回总线宽度（执行单元回写端口数）

  // ── IssueQueue 参数 ──
  val IQNumWakeupPorts : Int = WbBusWidth
  val IQNum : Int = 5 
  val EnableDifftest: Boolean = p(DebugConfigKeys.EnableDifftest)
  
  val IQ1Params = p(new Field[IQParams](IQParams(16, IQNumWakeupPorts))) //ALU_CSR
  val IQ2Params = p(new Field[IQParams](IQParams(12, IQNumWakeupPorts))) //ALU_DIV
  val IQ3Params = p(new Field[IQParams](IQParams(16, IQNumWakeupPorts))) //ALU_MUL_JMP
  val IQ4Params = p(new Field[IQParams](IQParams(16, IQNumWakeupPorts))) //LOAD_STA
  val IQ5Params = p(new Field[IQParams](IQParams(8,  IQNumWakeupPorts))) //STD

  val IQ1Width = log2Ceil(IQ1Params.numEntries + 1)
  val IQ2Width = log2Ceil(IQ2Params.numEntries + 1)
  val IQ3Width = log2Ceil(IQ3Params.numEntries + 1)
  val IQ4Width = log2Ceil(IQ4Params.numEntries + 1)
  val IQ5Width = log2Ceil(IQ5Params.numEntries + 1)

  val intRegFileReadPorts  : Int = 8
  val intRegFileWritePorts : Int = 5 


  //val nMshrEntries: Int = 4

  /*---- TLB相关 ----*/
  val nrTlb: Int = p(MmuconfigKeys.TlbNum)
  val nrSearchPort: Int = p(MmuconfigKeys.TlbSearchPortNum)
  val tlbIdxLen: Int = log2Ceil(nrTlb)



 
}

 
