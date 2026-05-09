package nscscc.config

import chisel3._
import chisel3.util._

abstract class NSModule(implicit val p: Parameters) extends Module
  with HasCoreParameters
  with HasArchParameters
  

abstract class NSRawModule(implicit val p: Parameters) extends RawModule
  with HasCoreParameters
  with HasArchParameters

abstract class NSBundle(implicit val p: Parameters) extends Bundle
  with HasCoreParameters
