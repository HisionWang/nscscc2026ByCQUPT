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

object CoreConfigKeys {
  val FetchWidth = new Field[Int](4)
  val CtrlBlockWidth = new Field[Int](3)
  val BtbSize = new Field[Int](256)
  val PhtSize = new Field[Int](1024)
  val RasSize = new Field[Int](8)
  val useNewBPU = new Field[Int](1)
  val usePIPT = new Field[Int](0)
  val NWaysI = new Field[Int](8)
  val NSetsI = new Field[Int](64)
  val NWaysD = new Field[Int](4)
  val NSetsD = new Field[Int](256)
  // L1 I/D Cache共用固定64B cache line，必须与L2一致。
  val BlockBytes = new Field[Int](64)
  val NMshrEntries = new Field[Int](2)
  val BurstNum = new Field[Int](16)
  val IbufDepth = new Field[Int](8)
  val IntLogicRegs = new Field[Int](32)
  val IntPhyRegs = new Field[Int](70)
  val RobSize = new Field[Int](32)
  val SnapshotNum = new Field[Int](8)
  val CommitWidth = new Field[Int](3)
  val LqSize = new Field[Int](8)
  val SqSize = new Field[Int](8)
  val WbBusWidth = new Field[Int](5)
  val IQNum = new Field[Int](5)
  val IQ1Params = new Field[IQParams](IQParams(8, 5, exeSource = 0))
  val IQ2Params = new Field[IQParams](IQParams(8, 5, exeSource = 1))
  val IQ3Params = new Field[IQParams](IQParams(8, 5, exeSource = 2))
  val IQ4Params = new Field[IQParams](IQParams(16, 5, exeSource = 3))
  val IQ5Params = new Field[IQParams](IQParams(8, 5, exeSource = 4))
}

case class IQParams(
  numEntries: Int,
  numWakeupPorts: Int,
  exeSource: Int,
)

trait HasCoreParameters {
  implicit def p: Parameters
  val XLEN: Int = 32

  val fetchWidth: Int = p(CoreConfigKeys.FetchWidth)
  val CtrlBlockWidth: Int = p(CoreConfigKeys.CtrlBlockWidth)
  val btbSize: Int = p(CoreConfigKeys.BtbSize)
  val phtSize: Int = p(CoreConfigKeys.PhtSize)
  val rasSize: Int = p(CoreConfigKeys.RasSize)
  val useNewBPU: Int = p(CoreConfigKeys.useNewBPU)
  val usePIPT: Int = p(CoreConfigKeys.usePIPT)
  val fetchBlockBits: Int = log2Ceil(fetchWidth * 4)
  val btbIndexBits: Int = log2Ceil(btbSize)
  val phtIndexBits: Int = log2Ceil(phtSize)
  val btbTagBits: Int = 32 - fetchBlockBits - btbIndexBits
  val fetchOffsetBits: Int = log2Ceil(fetchWidth)

  val nSetsI: Int = p(CoreConfigKeys.NSetsI)
  val nSetsD: Int = p(CoreConfigKeys.NSetsD)
  val nWaysI: Int = p(CoreConfigKeys.NWaysI)
  val nWaysD: Int = p(CoreConfigKeys.NWaysD)
  val blockBytes: Int = p(CoreConfigKeys.BlockBytes)
  val idxBitsI = log2Ceil(nSetsI)
  val wayBitsI = log2Ceil(nWaysI)
  val wayBitsD = log2Ceil(nWaysD)
  val blockOffBits = log2Ceil(blockBytes)
  val tagBitsI = 32 - idxBitsI - blockOffBits
  val idxBitsD = log2Ceil(nSetsD)
  val tagBitsD = 32 - idxBitsD - blockOffBits

  val nMshrEntries: Int = p(CoreConfigKeys.NMshrEntries)
  val icacheAxiMissId: Int = nMshrEntries
  val icacheAxiNucacheId: Int = icacheAxiMissId + 1
  val burstNum: Int = p(CoreConfigKeys.BurstNum)

  // 统一L2 Cache参数独立于L1 I/D Cache参数。
  val l2Sets: Int = 512
  val l2Ways: Int = 8
  val l2BlockBytes: Int = 64
  val l2MshrEntries: Int = 4
  val l2LrbEntries: Int = 2
  val l2IStbEntries: Int = 1
  val l2DStbEntries: Int = 2
  val l2EbEntries: Int = 1
  val l2ReadLatency: Int = 2
  val l2IdxBits: Int = log2Ceil(l2Sets)
  val l2WayBits: Int = log2Ceil(l2Ways)
  val l2BlockOffBits: Int = log2Ceil(l2BlockBytes)
  val l2TagBits: Int = XLEN - l2IdxBits - l2BlockOffBits
  val l2LineBits: Int = l2BlockBytes * 8
  val l2BeatBytes: Int = XLEN / 8
  val l2BurstBeats: Int = l2BlockBytes / l2BeatBytes
  val l2BeatIdxBits: Int = log2Ceil(l2BurstBeats)
  val l2MshrIdBits: Int = log2Ceil(l2MshrEntries)
  val l2BridgeSourceBits: Int = 2

  val ibufDepth: Int = p(CoreConfigKeys.IbufDepth)
  val IntLogicRegs = p(CoreConfigKeys.IntLogicRegs)
  val IntPhyRegs = p(CoreConfigKeys.IntPhyRegs)
  val PhyRegIdxWidth = log2Ceil(IntPhyRegs)
  val RobSize = p(CoreConfigKeys.RobSize)
  val SnapshotNum = p(CoreConfigKeys.SnapshotNum)
  val CommitWidth = p(CoreConfigKeys.CommitWidth)
  val LqSize: Int = p(CoreConfigKeys.LqSize)
  val SqSize: Int = p(CoreConfigKeys.SqSize)
  val WbBusWidth: Int = p(CoreConfigKeys.WbBusWidth)
  val IQNumWakeupPorts: Int = WbBusWidth
  val IQNum: Int = p(CoreConfigKeys.IQNum)
  val EnableDifftest: Boolean = p(DebugConfigKeys.EnableDifftest)
  val IQ1Params = p(CoreConfigKeys.IQ1Params)
  val IQ2Params = p(CoreConfigKeys.IQ2Params)
  val IQ3Params = p(CoreConfigKeys.IQ3Params)
  val IQ4Params = p(CoreConfigKeys.IQ4Params)
  val IQ5Params = p(CoreConfigKeys.IQ5Params)
  val IQ1Width = log2Ceil(IQ1Params.numEntries + 1)
  val IQ2Width = log2Ceil(IQ2Params.numEntries + 1)
  val IQ3Width = log2Ceil(IQ3Params.numEntries + 1)
  val IQ4Width = log2Ceil(IQ4Params.numEntries + 1)
  val IQ5Width = log2Ceil(IQ5Params.numEntries + 1)
  val intRegFileReadPorts: Int = 8
  val intRegFileWritePorts: Int = 5

  val nrTlb: Int = p(MmuconfigKeys.TlbNum)
  val nrSearchPort: Int = p(MmuconfigKeys.TlbSearchPortNum)
  val tlbIdxLen: Int = log2Ceil(nrTlb)

  def diffDontTouch[T <: Data](data: T): T = {
    if (EnableDifftest) dontTouch(data) else data
  }
}
