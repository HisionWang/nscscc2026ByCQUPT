error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:log2Ceil.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/log2Ceil.
	 -chisel3/log2Ceil#
	 -chisel3/log2Ceil().
	 -chisel3/util/log2Ceil.
	 -chisel3/util/log2Ceil#
	 -chisel3/util/log2Ceil().
	 -log2Ceil.
	 -log2Ceil#
	 -log2Ceil().
	 -scala/Predef.log2Ceil.
	 -scala/Predef.log2Ceil#
	 -scala/Predef.log2Ceil().
offset: 1096
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
text:
```scala
// 文件: src/main/scala/config/NSCore.scala
package config

import chisel3._
import chisel3.util._

// 1. 自定义简单的Field类
class Field[T](val default: T)

// 2. 自定义简单的Parameters类
class Parameters(val settings: Map[Field[_], Any]) {
  def apply[T](key: Field[T]): T = 
    settings.getOrElse(key, key.default).asInstanceOf[T]
  
  def getOrElse[T](key: Field[T], default: T): T = 
    settings.get(key).map(_.asInstanceOf[T]).getOrElse(default)
}

// 3. 创建一个对象来包含所有的参数键
object CPUConfigKeys {

  val iCacheOffsetWidth = new Field[Int](6) //一个Line有16条inst
  val iCacheIndexWidth = new Field[Int](6)  //64项
  val iCacheTagWidth = new Field[Int](20)  //64项

  val XLENKey = new Field[Int](32)

  val BurstNumKey = new Field[Int](16)
}

// 4. 定义"参数特质" - 通过CPUConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters
  
  // 从CPUConfigKeys对象获取参数键
  val iCacheSize: Int = p( 2 ^ ( CPUConfigKeys.iCacheOffsetWidth - 2))
  val lineSize: Int = p(CPUConfigKeys.LineSizeKey)
  val xlen: Int = p(CPUConfigKeys.XLENKey)
  val BurstNum: Int = p(CPUConfigKeys.BurstNumKey)
  
  val indexBits: Int = log@@2Ceil(cacheSize / lineSize)
}

// 5. 定义基类
abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCoreParameters

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCoreParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCoreParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: 