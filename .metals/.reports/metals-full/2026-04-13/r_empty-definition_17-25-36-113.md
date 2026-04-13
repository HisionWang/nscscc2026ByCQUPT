error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:config/CPUConfigKeys.iCacheIndexWidth.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol config/CPUConfigKeys.iCacheIndexWidth.
empty definition using fallback
non-local guesses:

offset: 975
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

  val burstNumKey = new Field[Int](16)
}

// 4. 定义"参数特质" - 通过CPUConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters
  
  // 从CPUConfigKeys对象获取参数键
  val iCacheLineSize: Int = p( 2 ^ ( CPUConfigKeys.iCacheOffsetWidth - 2))
  val iCacheIndexSize: Int = p(CPUConfigKeys.iCac@@heIndexWidth)

  val xlen: Int = p(CPUConfigKeys.XLENKey)
  val burstNum: Int = p(CPUConfigKeys.burstNumKey)
  
  val indexBits: Int = log2Ceil(cacheSize / lineSize)
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