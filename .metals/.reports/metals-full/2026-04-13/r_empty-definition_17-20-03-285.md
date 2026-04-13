error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:Int#
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Int#
	 -chisel3/util/Int#
	 -Int#
	 -scala/Predef.Int#
offset: 621
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
object ConfigKeys {
  val CacheSizeKey = new Field[Int](64)  //index的宽度
  val LineSizeKey = new Field[Int](16)   //16条指令

  val ICacheOffsetWidth = new Field[@@Int](64)
  val XLENKey = new Field[Int](32)

  val BurstNumKey = new Field[Int](16)
}

// 4. 定义"参数特质" - 通过ConfigKeys对象访问参数键
trait HasCommonParameters {
  implicit val p: Parameters
  
  // 从ConfigKeys对象获取参数键
  val cacheSize: Int = p(ConfigKeys.CacheSizeKey)
  val lineSize: Int = p(ConfigKeys.LineSizeKey)
  val xlen: Int = p(ConfigKeys.XLENKey)
  val BurstNum: Int = p(ConfigKeys.BurstNumKey)
  
  val indexBits: Int = log2Ceil(cacheSize / lineSize)
}

// 5. 定义基类
abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCommonParameters

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCommonParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCommonParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: 