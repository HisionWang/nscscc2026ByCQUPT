error id: 7FB8F92DE54DE5D94621BBB186345C7D
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
### java.lang.IndexOutOfBoundsException: -1

occurred in the presentation compiler.



action parameters:
offset: 1040
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

  val dCacheOffsetWidth = new Field[Int](6) //一个Line有16条inst
  val dCacheIndexWidth = new Field[Int](6)  //64项
  val dCacheTagWidth = new Field[Int](20)  //64项

  val XLENKey = new Field[Int](32)

  val burstNumKey = new Field[Int](16)
}

// 4. 定义"参数特质" - 通过CPUConfigKeys对象访问参数键
trait HasCoreParameters {
  implicit val p: Parameters
  
  // 从CPUConfigKeys对象获取参数键
  val iLineSize: Int = p( 1 @@ ( CPUConfigKeys.iCacheOffsetWidth - 2))
  val iIndexSize: Int = p( 2 ^ CPUConfigKeys.iCacheIndexWidth )

  val iOffW: Int = p(CPUConfigKeys.iCacheOffsetWidth)
  val iIdxW: Int = p(CPUConfigKeys.iCacheIndexWidth)
  val iTagW: Int = p(CPUConfigKeys.iCacheTagWidth)


  val dLineSize: Int = p( 2 ^ ( CPUConfigKeys.dCacheOffsetWidth - 2))
  val dIndexSize: Int = p( 2 ^ CPUConfigKeys. dCacheIndexWidth )

  val dOffW: Int = p(CPUConfigKeys.dCacheOffsetWidth)
  val dIdxW: Int = p(CPUConfigKeys.dCacheIndexWidth)
  val dTagW: Int = p(CPUConfigKeys.dCacheTagWidth)

  val xlen: Int = p(CPUConfigKeys.XLENKey)
  val burstNum: Int = p(CPUConfigKeys.burstNumKey)
  

}

// 5. 定义基类
abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCoreParameters

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCoreParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCoreParameters
```


presentation compiler configuration:
Scala version: 3.3.7-bin-nonbootstrapped
Classpath:
<HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala3-library_3/3.3.7/scala3-library_3-3.3.7.jar [exists ], <HOME>/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.16/scala-library-2.13.16.jar [exists ]
Options:





#### Error stacktrace:

```
scala.collection.LinearSeqOps.apply(LinearSeq.scala:129)
	scala.collection.LinearSeqOps.apply$(LinearSeq.scala:128)
	scala.collection.immutable.List.apply(List.scala:79)
	dotty.tools.dotc.util.Signatures$.applyCallInfo(Signatures.scala:244)
	dotty.tools.dotc.util.Signatures$.computeSignatureHelp(Signatures.scala:101)
	dotty.tools.dotc.util.Signatures$.signatureHelp(Signatures.scala:88)
	dotty.tools.pc.SignatureHelpProvider$.signatureHelp(SignatureHelpProvider.scala:46)
	dotty.tools.pc.ScalaPresentationCompiler.signatureHelp$$anonfun$1(ScalaPresentationCompiler.scala:498)
	scala.meta.internal.pc.CompilerAccess.withSharedCompiler(CompilerAccess.scala:149)
	scala.meta.internal.pc.CompilerAccess.withNonInterruptableCompiler$$anonfun$1(CompilerAccess.scala:133)
	scala.meta.internal.pc.CompilerAccess.onCompilerJobQueue$$anonfun$1(CompilerAccess.scala:210)
	scala.meta.internal.pc.CompilerJobQueue$Job.run(CompilerJobQueue.scala:153)
	java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
	java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	java.base/java.lang.Thread.run(Thread.java:1583)
```
#### Short summary: 

java.lang.IndexOutOfBoundsException: -1