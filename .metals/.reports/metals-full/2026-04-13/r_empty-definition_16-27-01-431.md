error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala:HasAXIParameters#
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/HasAXIParameters#
	 -chisel3/util/HasAXIParameters#
	 -HasAXIParameters#
	 -scala/Predef.HasAXIParameters#
offset: 291
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/NSCore.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch

abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCommonParameters
  with HasAXIParameters

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCommonParameters
  with @@HasAXIParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCommonParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: 