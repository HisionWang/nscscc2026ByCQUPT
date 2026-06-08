// 文件: src/main/scala/config/NSCore.scala
package nscscc.config

import chisel3._
import chisel3.util._

// 3. 创建一个对象来包含所有的参数键
object CPUConfigKeys {

  val iCacheOffsetWidth = new Field[Int](6) //一个Line有16条inst
  val iCacheIndexWidth = new Field[Int](6)  //64项
  val iCacheTagWidth = new Field[Int](20)  //64项

  val dCacheOffsetWidth = new Field[Int](6) //一个Line有16条inst
  val dCacheIndexWidth = new Field[Int](6)  //64项
  val dCacheTagWidth = new Field[Int](20)  //64项

  val XLENKey = new Field[Int](32)

  val burstNumKey = new Field[Int](16)
}

object MmuconfigKeys {
  val TlbNum = new Field[Int](32)
  val TlbSearchPortNum = new Field[Int](2)
}

// 4. 定义"参数特质" - 通过CPUConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters

  /*---- ICache相关 ----*/
  val  nSets:      Int = 256
  val  nWays:      Int = 4
  val  blockBytes: Int = 64

  val idxBits     = log2Ceil(nSets)
  val wayBits     = log2Ceil(nWays)
  val blockOffBits = log2Ceil(blockBytes)
  val tagBits     = 32 - idxBits - blockOffBits

  val icacheAxiMissId : Int = 0
  val icacheAxiNucacheId : Int = 1

  val XLEN : Int = p(CPUConfigKeys.XLENKey)
  val burstNum: Int = p(CPUConfigKeys.burstNumKey)

  // ============ 参数 ============
  val FtqSize             : Int = 16   // 队列深度（必须是2的幂，CircularQueue要求）
  val BpRunAheadDistance  : Int = 8    // BPU 最多超前 IFU 几项

  /*---- 通路位宽相关 ----*/
  val  fetchWidth: Int = 5
  val  ibufDepth:  Int = 16  // 必须为2的次方倍
  val  CtrlBlockWidth : Int = 3

  /*---- TLB相关 ----*/
  val nrTlb: Int = p(MmuconfigKeys.TlbNum)
  val nrSearchPort: Int = p(MmuconfigKeys.TlbSearchPortNum)
  val tlbIdxLen: Int = log2Ceil(nrTlb)


  // ============================================================
  // === BPU (Branch Prediction Unit) 参数 ===
  // ============================================================
 
  // --- 基本容量 ---
  val btbSize:  Int = 16    // BTB表项数, 16项直接映射 (设计文档§2.3)
  val phtSize:  Int = 64    // PHT表项数, 64项2位饱和计数器 (设计文档§2.4)
  val rasSize:  Int = 8     // RAS深度, 8层返回地址栈 (设计文档§2.5)
 
  // --- 索引位宽 ---
  // fetchBlockBits: PC低几位不参与BTB/PHT索引
  //   = log2(fetchWidth * 4) = log2(16) = 4
  //   含义: PC[3:0]是块内偏移(2位字节对齐 + log2(fetchWidth)位指令偏移)
  //   当fetchWidth=4时: PC[1:0]=00(定长4字节对齐), PC[3:2]=块内指令索引
  val fetchBlockBits: Int = log2Ceil(fetchWidth * 4)
 
  // btbIndexBits: BTB索引位宽 = log2(btbSize) = log2(16) = 4
  val btbIndexBits: Int = log2Ceil(btbSize)
 
  // phtIndexBits: PHT索引位宽 = log2(phtSize) = log2(64) = 6
  val phtIndexBits: Int = log2Ceil(phtSize)
 
  // --- 标签位宽 ---
  // btbTagBits: BTB标签位宽 = 32 - fetchBlockBits - btbIndexBits
  //   当fetchWidth=4: 32 - 4 - 4 = 24
  //   即 PC[31:8] 作为tag
  val btbTagBits: Int = 32 - fetchBlockBits - btbIndexBits
 
  // --- 块内偏移位宽 ---
  // 块内指令偏移: log2(fetchWidth), 用于标记分支在fetch块中的第几条
  //   当fetchWidth=4: 2位, 值域0~3
  val fetchOffsetBits: Int = log2Ceil(fetchWidth)
 
  // --- RAS指针位宽 ---
  // rasTop位宽 = log2(rasSize) = log2(8) = 3
  //val rasTopBits: Int = log2Ceil(rasSize)
 
}

 
