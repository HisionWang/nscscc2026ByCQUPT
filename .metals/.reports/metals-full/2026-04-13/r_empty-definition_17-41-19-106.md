error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/Arch.scala:
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/Arch.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/ArchConfigKeys.
	 -chisel3/util/ArchConfigKeys.
	 -ArchConfigKeys.
	 -scala/Predef.ArchConfigKeys.
offset: 671
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/Arch.scala
text:
```scala
// 文件: src/main/scala/config/NSCore.scala
package config

import chisel3._
import chisel3.util._

// 3. 创建一个对象来包含所有的参数键
object ArchConfigKeys {

  val iCacheOffsetWidth = new Field[Int](6) //一个Line有16条inst
  val iCacheIndexWidth = new Field[Int](6)  //64项
  val iCacheTagWidth = new Field[Int](20)  //64项

  val dCacheOffsetWidth = new Field[Int](6) //一个Line有16条inst
  val dCacheIndexWidth = new Field[Int](6)  //64项
  val dCacheTagWidth = new Field[Int](20)  //64项

  val XLENKey = new Field[Int](32)

  val burstNumKey = new Field[Int](16)
}

// 4. 定义"参数特质" - 通过ArchConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters

  val iOffWidth: Int = p(Arch@@ConfigKeys.iCacheOffsetWidth)
  val iIdxWidth: Int = p(ArchConfigKeys.iCacheIndexWidth)
  val iTagWidth: Int = p(ArchConfigKeys.iCacheTagWidth)
  
  // 从ArchConfigKeys对象获取参数键
  val iLineSize: Int = ( 1 << ( iOffWidth - 2))
  val iIndexSize: Int = ( 1 << iIdxWidth )

  val dOffWidth: Int = p(ArchConfigKeys.dCacheOffsetWidth)
  val dIdxWidth: Int = p(ArchConfigKeys.dCacheIndexWidth)
  val dTagWidth: Int = p(ArchConfigKeys.dCacheTagWidth)


  val dLineSize: Int = ( 1 << ( dOffWidth - 2))
  val dIndexSize: Int = ( 1 << dIdxWidth )



  val xlen: Int = p(ArchConfigKeys.XLENKey)
  val burstNum: Int = p(ArchConfigKeys.burstNumKey)
  

}


```


#### Short summary: 

empty definition using pc, found symbol in pc: 