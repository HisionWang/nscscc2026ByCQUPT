error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/Core.scala:
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/Core.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Int.
	 -chisel3/Int#
	 -chisel3/Int().
	 -chisel3/util/Int.
	 -chisel3/util/Int#
	 -chisel3/util/Int().
	 -Int.
	 -Int#
	 -Int().
	 -scala/Predef.Int.
	 -scala/Predef.Int#
	 -scala/Predef.Int().
offset: 1366
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/Core.scala
text:
```scala
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

      nSets:      Int = 256,
    nWays:      Int = 4,
    blockBytes: Int@@ = 64,
    fetchWidth: Int = 4,
    instrBytes: Int = 4,
    nMSHR:      Int = 4,
    replacer:   String = "plru",
    idBits:     Int = 2
  

}

 
// 定义ICache参数Key
case object ICacheKey
 
case class ICacheParams(
    nSets:      Int = 256,
    nWays:      Int = 4,
    blockBytes: Int = 64,
    fetchWidth: Int = 4,
    instrBytes: Int = 4,
    nMSHR:      Int = 4,
    replacer:   String = "plru",
    idBits:     Int = 2
) {
    require(isPow2(nSets), "nSets must be power of 2")
    require(isPow2(nWays), "nWays must be power of 2")
    require(isPow2(blockBytes), "blockBytes must be power of 2")
    
    val idxBits     = log2Ceil(nSets)
    val wayBits     = log2Ceil(nWays)
    val blockOffBits = log2Ceil(blockBytes)
    val tagBits     = 32 - idxBits - blockOffBits
    val instrsPerLine = blockBytes / instrBytes
    val fetchBytes  = fetchWidth * instrBytes
}
 
object ICacheParams {
    def default: ICacheParams = ICacheParams()
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 