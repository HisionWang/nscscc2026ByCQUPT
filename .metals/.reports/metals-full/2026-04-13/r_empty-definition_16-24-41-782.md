error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:Module#
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Module#
	 -chisel3/util/Module#
	 -Module#
	 -scala/Predef.Module#
offset: 247
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch

abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCommonParameters
  with HasAXIParameters

abstract class NSModule(implicit val p: Parameters) extends Mod@@ule
  with HasCommonParameters
  with HasAXIParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCommonParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: 