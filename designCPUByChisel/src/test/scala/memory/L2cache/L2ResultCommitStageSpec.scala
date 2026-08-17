package nscscc.mem.L2cache

import chisel3._
import chiseltest._
import nscscc.config._
import org.scalatest.flatspec.AnyFlatSpec

class L2ResultCommitStageSpec extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "L2 result commit stage"

  private implicit val p: Parameters = new Parameters(Map(
    DebugConfigKeys.EnableDifftest -> true,
    CoreConfigKeys.L2Ways -> 4,
    CoreConfigKeys.L2Prefetch -> L2PrefetchMode.Disabled))

  private def driveResult(
      dut: L2ResultCommitStage,
      addr: BigInt,
      data: BigInt
  ): Unit = {
    dut.io.in.bits.token.source.poke(L2PortSource.icache)
    dut.io.in.bits.token.id.poke(0.U)
    dut.io.in.bits.token.addr.poke(addr.U)
    dut.io.in.bits.token.isStb.poke(false.B)
    dut.io.in.bits.token.isUncacheProbe.poke(false.B)
    dut.io.in.bits.token.isPrefetch.poke(false.B)
    dut.io.in.bits.token.prefetchEpoch.poke(0.U)
    dut.io.in.bits.token.cancelled.poke(false.B)
    dut.io.in.bits.token.stbSlot.poke(0.U)
    dut.io.in.bits.token.busySlot.poke(0.U)
    dut.io.in.bits.hit.poke(true.B)
    dut.io.in.bits.way.poke(0.U)
    dut.io.in.bits.oldValid.poke(true.B)
    dut.io.in.bits.oldDirty.poke(false.B)
    dut.io.in.bits.oldTag.poke(1.U)
    dut.io.in.bits.oldData.poke(data.U)
    dut.io.in.bits.stbMatch.poke(false.B)
    dut.io.in.bits.stbForwarded.poke(false.B)
    dut.io.in.bits.mshrSetConflict.poke(false.B)
    dut.io.in.bits.ebBlockConflict.poke(false.B)
  }

  private def resetDut(dut: L2ResultCommitStage): Unit = {
    dut.io.in.valid.poke(false.B)
    dut.io.out.ready.poke(false.B)
    dut.io.pendingWriteValid.poke(false.B)
    dut.io.pendingWriteAddr.poke(0.U)
    dut.io.pendingWriteData.poke(0.U)
    dut.reset.poke(true.B)
    dut.clock.step(2)
    dut.reset.poke(false.B)
  }

  it should "register a resolved result and hold the captured forwarding data" in {
    test(new L2ResultCommitStage) { dut =>
      resetDut(dut)
      val addr = BigInt("80001280", 16)
      val arrayData = BigInt("11" * 64, 16)
      val writeData = BigInt("22" * 64, 16)

      driveResult(dut, addr, arrayData)
      dut.io.pendingWriteValid.poke(true.B)
      dut.io.pendingWriteAddr.poke(addr.U)
      dut.io.pendingWriteData.poke(writeData.U)
      dut.io.in.valid.poke(true.B)

      dut.io.in.ready.expect(true.B)
      dut.io.out.valid.expect(false.B)
      dut.clock.step()

      dut.io.in.valid.poke(false.B)
      dut.io.pendingWriteValid.poke(false.B)
      dut.io.pendingWriteData.poke(0.U)
      dut.io.out.valid.expect(true.B)
      dut.io.out.bits.stbMatch.expect(true.B)
      dut.io.out.bits.stbForwarded.expect(true.B)
      dut.io.out.bits.oldData.expect(writeData.U)

      dut.clock.step(2)
      dut.io.out.valid.expect(true.B)
      dut.io.out.bits.oldData.expect(writeData.U)

      dut.io.out.ready.poke(true.B)
      dut.clock.step()
      dut.io.out.valid.expect(false.B)
    }
  }

  it should "replace a committed result with the next result without a bubble" in {
    test(new L2ResultCommitStage) { dut =>
      resetDut(dut)
      val firstAddr = BigInt("80002000", 16)
      val secondAddr = BigInt("80002040", 16)

      driveResult(dut, firstAddr, 1)
      dut.io.in.valid.poke(true.B)
      dut.clock.step()
      dut.io.out.valid.expect(true.B)
      dut.io.out.bits.token.addr.expect(firstAddr.U)

      driveResult(dut, secondAddr, 2)
      dut.io.out.ready.poke(true.B)
      dut.io.in.valid.poke(true.B)
      dut.io.in.ready.expect(true.B)
      dut.clock.step()

      dut.io.in.valid.poke(false.B)
      dut.io.out.ready.poke(false.B)
      dut.io.out.valid.expect(true.B)
      dut.io.out.bits.token.addr.expect(secondAddr.U)
      dut.io.out.bits.oldData.expect(2.U)
    }
  }
}
