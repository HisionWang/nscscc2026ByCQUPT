package nscscc.mem.L2cache

import chisel3.stage.ChiselStage
import nscscc.config._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class L2WaysParameterSpec extends AnyFlatSpec with Matchers {
  behavior of "L2 ways parameter"

  private def params(ways: Int): Parameters = new Parameters(Map(
    DebugConfigKeys.EnableDifftest -> true,
    CoreConfigKeys.L2Ways -> ways))

  Seq(2, 4, 8, 16).foreach { ways =>
    it should s"elaborate the complete L2 cache with $ways ways" in {
      implicit val p: Parameters = params(ways)
      val arrayVerilog = ChiselStage.emitSystemVerilog(new L2CacheArray)
      val replacerVerilog = ChiselStage.emitSystemVerilog(new L2Replacer)
      val cacheVerilog = ChiselStage.emitSystemVerilog(new L2Cache)
      arrayVerilog should include ("module L2CacheArray")
      replacerVerilog should include ("module L2Replacer")
      cacheVerilog should include ("module L2Cache")
    }
  }
}
