error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/MyModule.scala:HasCoreParameters#
file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/MyModule.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/HasCoreParameters#
	 -chisel3/util/HasCoreParameters#
	 -HasCoreParameters#
	 -scala/Predef.HasCoreParameters#
offset: 163
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/config/MyModule.scala
text:
```scala
package config

import chisel3._
import chisel3.util._

abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCoreParameters
  with HasCoreP@@arameters

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCoreParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCoreParameters
```


#### Short summary: 

empty definition using pc, found symbol in pc: 