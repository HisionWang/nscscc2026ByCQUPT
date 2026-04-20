// 文件: src/main/scala/config/NSCore.scala
package config

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

// 4. 定义"参数特质" - 通过CPUConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters

  val IOffWidth: Int = p(CPUConfigKeys.iCacheOffsetWidth)
  val IIdxWidth: Int = p(CPUConfigKeys.iCacheIndexWidth)
  val ITagWidth: Int = p(CPUConfigKeys.iCacheTagWidth)
  
  // 从CPUConfigKeys对象获取参数键
  val ILineSize: Int = ( 1 << ( IOffWidth - 2))
  val IIndexSize: Int = ( 1 << IIdxWidth )

  val DOffWidth: Int = p(CPUConfigKeys.dCacheOffsetWidth)
  val DIdxWidth: Int = p(CPUConfigKeys.dCacheIndexWidth)
  val DTagWidth: Int = p(CPUConfigKeys.dCacheTagWidth)


  val DLineSize: Int = ( 1 << ( DOffWidth - 2))
  val DIndexSize: Int = ( 1 << DIdxWidth )



  val xlen: Int = p(CPUConfigKeys.XLENKey)
  val burstNum: Int = p(CPUConfigKeys.burstNumKey)

  val  nSets:      Int = 256
  val  nWays:      Int = 4
  val  blockBytes: Int = 64
  val  fetchWidth: Int = 4
  val  instrBytes: Int = 4
  val  nMSHR:      Int = 4
  val  replacerMode:   String = "plru"
  val  idBits:     Int = 2

  val idxBits     = log2Ceil(nSets)
  val wayBits     = log2Ceil(nWays)
  val blockOffBits = log2Ceil(blockBytes)
  val tagBits     = 32 - idxBits - blockOffBits
  val instrsPerLine = blockBytes / instrBytes
  val fetchBytes  = fetchWidth * instrBytes
  

}

 
