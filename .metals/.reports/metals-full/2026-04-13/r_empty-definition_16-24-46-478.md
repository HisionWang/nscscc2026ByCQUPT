error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:RawModule#
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/RawModule#
	 -chisel3/util/RawModule#
	 -RawModule#
	 -scala/Predef.RawModule#
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

abstract class NSModule(implicit val p: Parameters) extends Raw@@Module
  with HasCommonParameters
  with HasAXIParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCommonParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: 