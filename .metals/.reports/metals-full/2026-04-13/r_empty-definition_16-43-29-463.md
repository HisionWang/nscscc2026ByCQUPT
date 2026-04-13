error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:getOrElse.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: getOrElse.
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/settings/getOrElse.
	 -chisel3/settings/getOrElse#
	 -chisel3/settings/getOrElse().
	 -chisel3/util/settings/getOrElse.
	 -chisel3/util/settings/getOrElse#
	 -chisel3/util/settings/getOrElse().
	 -settings/getOrElse.
	 -settings/getOrElse#
	 -settings/getOrElse().
	 -scala/Predef.settings.getOrElse.
	 -scala/Predef.settings.getOrElse#
	 -scala/Predef.settings.getOrElse().
offset: 313
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
// 文件: src/main/scala/config/MyParameters.scala
package config

// 1. 自定义简单的Field类
class Field[T](val default: T)

// 2. 自定义简单的Parameters类
class Parameters(val settings: Map[Field[_], Any]) {
  def apply[T](key: Field[T]): T = 
    settings.getOrEls@@e(key, key.default).asInstanceOf[T]
  
  def getOrElse[T](key: Field[T], default: T): T = 
    settings.get(key).map(_.asInstanceOf[T]).getOrElse(default)
}

object Parameters {
  val empty = new Parameters(Map.empty)
  
  // 创建配置的辅助方法
  def apply(fields: (Field[_], Any)*): Parameters = 
    new Parameters(fields.toMap)
}
// 1. 定义“参数键”（就像配置文件里的条目名）
case object CacheSizeKey extends Field[Int](1024) // 默认值1024
case object LineSizeKey extends Field[Int](4)     // 默认值4
case object XLENKey extends Field[Int](32)        // 默认32位

// 2. 定义“参数特质”（模块通过这个特质访问参数）
trait HasCommonParameters {
  // 每个用到这个特质的模块，都必须提供一个隐式参数p
  implicit val p: Parameters
  
  // 从这里获取参数，像从配置中心读取一样
  val cacheSize: Int = p(CacheSizeKey)
  val lineSize: Int = p(LineSizeKey)
  val xlen: Int = p(XLENKey)
  
  // 甚至可以在这里计算衍生值，所有模块共享同一份计算
  val indexBits: Int = log2Ceil(cacheSize / lineSize)
}

abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCommonParameters

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCommonParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCommonParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: getOrElse.