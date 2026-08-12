package nscscc.mem.L2cache

import chisel3.stage.ChiselStage
import nscscc.config._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class L2MetadataBlackBoxSpec extends AnyFlatSpec with Matchers {
  behavior of "L2CacheArray FPGA structure"

  it should "instantiate eight L2_meta_512x19 memories" in {
    implicit val p: Parameters =
      new Parameters(Map(DebugConfigKeys.EnableDifftest -> false))
    val verilog = ChiselStage.emitSystemVerilog(new L2CacheArray)

    verilog should include("L2_meta_512x19")
    val wrapperPattern = "(?m)^  L2MetadataRAM metadataRams_[0-7] \\(".r
    wrapperPattern.findAllMatchIn(verilog).length shouldBe 8
  }
}
