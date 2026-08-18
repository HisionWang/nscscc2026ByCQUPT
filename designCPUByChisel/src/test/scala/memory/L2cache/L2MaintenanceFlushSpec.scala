package nscscc.mem.L2cache

import chisel3._
import chiseltest._
import chiseltest.simulator.{VerilatorBackendAnnotation, VerilatorCFlags, VerilatorFlags}
import nscscc.config._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class L2MaintenanceFlushSpec
    extends AnyFlatSpec
    with ChiselScalatestTester
    with Matchers {
  behavior of "L2Cache maintenance flush"

  private implicit val p: Parameters =
    new Parameters(Map(DebugConfigKeys.EnableDifftest -> true))

  private val verilator = Seq(
    VerilatorBackendAnnotation,
    VerilatorFlags(Seq("--output-split", "0")),
    VerilatorCFlags(Seq("-DWData=IData"))
  )

  private def init(dut: L2CacheTestHarness): Unit = {
    dut.io.iReq.valid.poke(false.B)
    dut.io.iReq.bits.id.poke(0.U)
    dut.io.iReq.bits.addr.poke(0.U)
    dut.io.iReq.bits.size.poke(2.U)
    dut.io.iReq.bits.uncache.poke(false.B)
    dut.io.iCancel.poke(false.B)
    dut.io.iRespReady.poke(true.B)
    dut.io.dReadReq.valid.poke(false.B)
    dut.io.dReadReq.bits.id.poke(0.U)
    dut.io.dReadReq.bits.addr.poke(0.U)
    dut.io.dReadReq.bits.size.poke(2.U)
    dut.io.dReadReq.bits.uncache.poke(false.B)
    dut.io.dReadRespReady.poke(true.B)
    dut.io.dWriteReqValid.poke(false.B)
    dut.io.dWriteReqId.poke(0.U)
    dut.io.dWriteReqAddr.poke(0.U)
    dut.io.dWriteReqKind.poke(L2WriteKind.putLine)
    dut.io.dWriteReqSize.poke(2.U)
    for (word <- 0 until 16) dut.io.dWriteReqWords(word).poke(0.U)
    dut.io.dWriteReqStrb.poke(15.U)
    dut.io.dWriteDoneReady.poke(true.B)
    dut.io.maintenanceReqValid.poke(false.B)
    dut.io.maintenanceDoneReady.poke(true.B)
    dut.io.axi.ar.arready.poke(false.B)
    dut.io.axi.aw.awready.poke(false.B)
    dut.io.axi.w.wready.poke(false.B)
    dut.io.axi.r.data.rid.poke(0.U)
    dut.io.axi.r.data.rdata.poke(0.U)
    dut.io.axi.r.data.rresp.poke(0.U)
    dut.io.axi.r.data.rlast.poke(false.B)
    dut.io.axi.r.data.rvalid.poke(false.B)
    dut.io.axi.b.data.bid.poke(0.U)
    dut.io.axi.b.data.bresp.poke(0.U)
    dut.io.axi.b.data.bvalid.poke(false.B)
  }

  private def resetDut(dut: L2CacheTestHarness): Unit = {
    init(dut)
    dut.reset.poke(true.B)
    dut.clock.step(2)
    dut.reset.poke(false.B)
    dut.clock.step(512)
  }

  private def sendIRead(dut: L2CacheTestHarness, addr: BigInt): Unit = {
    dut.io.iReq.valid.poke(true.B)
    dut.io.iReq.bits.addr.poke(addr.U)
    var wait = 0
    while (!dut.io.iReq.ready.peek().litToBoolean && wait < 100) {
      dut.clock.step()
      wait += 1
    }
    withClue(s"I read 0x${addr.toString(16)} was not accepted") {
      dut.io.iReq.ready.peek().litToBoolean shouldBe true
    }
    dut.clock.step()
    dut.io.iReq.valid.poke(false.B)
  }

  private def sendPutLine(
      dut: L2CacheTestHarness,
      addr: BigInt,
      words: Seq[BigInt]
  ): Unit = {
    dut.io.dWriteReqValid.poke(true.B)
    dut.io.dWriteReqAddr.poke(addr.U)
    dut.io.dWriteReqKind.poke(L2WriteKind.putLine)
    for (word <- 0 until 16) {
      dut.io.dWriteReqWords(word).poke(words(word).U)
    }
    var wait = 0
    while (!dut.io.dWriteReqReady.peek().litToBoolean && wait < 100) {
      dut.clock.step()
      wait += 1
    }
    dut.io.dWriteReqReady.expect(true.B)
    dut.clock.step()
    dut.io.dWriteReqValid.poke(false.B)
  }

  private def waitForAr(dut: L2CacheTestHarness, addr: BigInt): Unit = {
    var wait = 0
    while (!dut.io.axi.ar.data.arvalid.peek().litToBoolean && wait < 120) {
      dut.clock.step()
      wait += 1
    }
    dut.io.axi.ar.data.arvalid.expect(true.B)
    dut.io.axi.ar.data.araddr.expect((addr & ~BigInt(63)).U)
    dut.io.axi.ar.data.arlen.expect(15.U)
    dut.io.axi.ar.data.arsize.expect(2.U)
  }

  private def completeLineRead(
      dut: L2CacheTestHarness,
      addr: BigInt,
      words: Seq[BigInt]
  ): Unit = {
    waitForAr(dut, addr)
    dut.io.iRespReady.poke(false.B)
    dut.io.axi.ar.arready.poke(true.B)
    dut.clock.step()
    dut.io.axi.ar.arready.poke(false.B)
    for (beat <- 0 until 16) {
      dut.io.axi.r.data.rvalid.poke(true.B)
      dut.io.axi.r.data.rdata.poke(words(beat).U)
      dut.io.axi.r.data.rlast.poke((beat == 15).B)
      var wait = 0
      while (!dut.io.axi.r.rready.peek().litToBoolean && wait < 80) {
        dut.clock.step()
        wait += 1
      }
      dut.io.axi.r.rready.expect(true.B)
      dut.clock.step()
    }
    dut.io.axi.r.data.rvalid.poke(false.B)
    dut.io.axi.r.data.rlast.poke(false.B)
    dut.io.iRespReady.poke(true.B)
    for (beat <- 0 until 16) {
      var wait = 0
      while (!dut.io.iRespValid.peek().litToBoolean && wait < 80) {
        dut.clock.step()
        wait += 1
      }
      dut.io.iRespValid.expect(true.B)
      dut.io.iRespFullLine.expect(false.B)
      dut.io.iRespLast.expect((beat == 15).B)
      dut.clock.step()
    }
    dut.clock.step(2)
  }

  private def expectLineHit(
      dut: L2CacheTestHarness,
      addr: BigInt,
      words: Seq[BigInt]
  ): Unit = {
    sendIRead(dut, addr)
    var wait = 0
    while (!dut.io.iRespValid.peek().litToBoolean && wait < 80) {
      dut.io.axi.ar.data.arvalid.expect(false.B)
      dut.clock.step()
      wait += 1
    }
    dut.io.iRespValid.expect(true.B)
    dut.io.iRespFullLine.expect(true.B)
    for (word <- 0 until 16) {
      dut.io.iRespWords(word).expect(words(word).U)
    }
    dut.clock.step()
  }

  it should "write every dirty line back, wait for B, and invalidate clean and dirty lines" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      dut.clock.setTimeout(0)
      resetDut(dut)
      val dirtyAddr = BigInt("80000180", 16)
      val dirtyAddr2 = BigInt("800002c0", 16)
      val cleanAddr = BigInt("810104c0", 16)
      val dirtyWords = (0 until 16).map(i => BigInt(0x31000000L + i))
      val dirtyWords2 = (0 until 16).map(i => BigInt(0x32000000L + i))
      val cleanWords = (0 until 16).map(i => BigInt(0x42000000L + i))

      sendPutLine(dut, dirtyAddr, dirtyWords)
      expectLineHit(dut, dirtyAddr, dirtyWords)
      sendPutLine(dut, dirtyAddr2, dirtyWords2)
      expectLineHit(dut, dirtyAddr2, dirtyWords2)
      sendIRead(dut, cleanAddr)
      completeLineRead(dut, cleanAddr, cleanWords)
      expectLineHit(dut, cleanAddr, cleanWords)

      dut.io.maintenanceReqValid.poke(true.B)
      dut.io.maintenanceReqReady.expect(true.B)
      dut.clock.step()

      var waitAw = 0
      while (!dut.io.axi.aw.data.awvalid.peek().litToBoolean && waitAw < 5000) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.clock.step()
        waitAw += 1
      }
      dut.io.axi.aw.data.awvalid.expect(true.B)
      dut.io.axi.aw.data.awaddr.expect((dirtyAddr & ~BigInt(63)).U)
      dut.io.axi.aw.data.awlen.expect(15.U)
      dut.io.axi.aw.data.awsize.expect(2.U)
      dut.io.axi.aw.awready.poke(true.B)
      dut.io.axi.w.wready.poke(true.B)
      for (beat <- 0 until 16) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.io.axi.w.data.wvalid.expect(true.B)
        dut.io.axi.w.data.wdata.expect(dirtyWords(beat).U)
        dut.io.axi.w.data.wstrb.expect(15.U)
        dut.io.axi.w.data.wlast.expect((beat == 15).B)
        dut.clock.step()
        if (beat == 0) dut.io.axi.aw.awready.poke(false.B)
      }
      dut.io.axi.w.wready.poke(false.B)
      for (_ <- 0 until 6) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.clock.step()
      }
      dut.io.axi.b.data.bvalid.poke(true.B)
      dut.io.axi.b.bready.expect(true.B)
      dut.clock.step()
      dut.io.axi.b.data.bvalid.poke(false.B)

      waitAw = 0
      while (!dut.io.axi.aw.data.awvalid.peek().litToBoolean && waitAw < 5000) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.clock.step()
        waitAw += 1
      }
      dut.io.axi.aw.data.awvalid.expect(true.B)
      dut.io.axi.aw.data.awaddr.expect((dirtyAddr2 & ~BigInt(63)).U)
      dut.io.axi.aw.data.awlen.expect(15.U)
      dut.io.axi.aw.data.awsize.expect(2.U)
      dut.io.axi.aw.awready.poke(true.B)
      dut.io.axi.w.wready.poke(true.B)
      for (beat <- 0 until 16) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.io.axi.w.data.wvalid.expect(true.B)
        dut.io.axi.w.data.wdata.expect(dirtyWords2(beat).U)
        dut.io.axi.w.data.wstrb.expect(15.U)
        dut.io.axi.w.data.wlast.expect((beat == 15).B)
        dut.clock.step()
        if (beat == 0) dut.io.axi.aw.awready.poke(false.B)
      }
      dut.io.axi.w.wready.poke(false.B)
      for (_ <- 0 until 4) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.clock.step()
      }
      dut.io.axi.b.data.bvalid.poke(true.B)
      dut.io.axi.b.bready.expect(true.B)
      dut.clock.step()
      dut.io.axi.b.data.bvalid.poke(false.B)

      var waitDone = 0
      while (!dut.io.maintenanceDoneValid.peek().litToBoolean && waitDone < 5000) {
        dut.io.axi.aw.data.awvalid.expect(false.B)
        dut.clock.step()
        waitDone += 1
      }
      dut.io.maintenanceDoneValid.expect(true.B)
      dut.clock.step()
      dut.io.maintenanceReqValid.poke(false.B)
      dut.clock.step(2)

      sendIRead(dut, dirtyAddr)
      completeLineRead(dut, dirtyAddr,
        (0 until 16).map(i => BigInt(0x51000000L + i)))
      sendIRead(dut, dirtyAddr2)
      completeLineRead(dut, dirtyAddr2,
        (0 until 16).map(i => BigInt(0x52000000L + i)))
      sendIRead(dut, cleanAddr)
      waitForAr(dut, cleanAddr)
    }
  }

  it should "finish an older uncached boundary request before scanning the L2" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      dut.clock.setTimeout(0)
      resetDut(dut)
      val cacheAddr = BigInt("82000540", 16)
      val uncacheAddr = BigInt("90000024", 16)
      val cacheWords = (0 until 16).map(i => BigInt(0x61000000L + i))

      sendIRead(dut, cacheAddr)
      waitForAr(dut, cacheAddr)

      dut.io.dReadReq.valid.poke(true.B)
      dut.io.dReadReq.bits.addr.poke(uncacheAddr.U)
      dut.io.dReadReq.bits.uncache.poke(true.B)
      var wait = 0
      while (!dut.io.dReadReq.ready.peek().litToBoolean && wait < 80) {
        dut.clock.step()
        wait += 1
      }
      dut.io.dReadReq.ready.expect(true.B)
      dut.clock.step()
      dut.io.dReadReq.valid.poke(false.B)

      dut.io.maintenanceReqValid.poke(true.B)
      dut.io.maintenanceReqReady.expect(true.B)
      dut.clock.step()

      completeLineRead(dut, cacheAddr, cacheWords)

      wait = 0
      while (!dut.io.axi.ar.data.arvalid.peek().litToBoolean && wait < 160) {
        dut.io.maintenanceDoneValid.expect(false.B)
        dut.clock.step()
        wait += 1
      }
      dut.io.axi.ar.data.arvalid.expect(true.B)
      dut.io.axi.ar.data.araddr.expect(uncacheAddr.U)
      dut.io.axi.ar.data.arlen.expect(0.U)
      dut.io.axi.ar.arready.poke(true.B)
      dut.clock.step()
      dut.io.axi.ar.arready.poke(false.B)

      dut.io.axi.r.data.rvalid.poke(true.B)
      dut.io.axi.r.data.rdata.poke("hdeadbeef".U)
      dut.io.axi.r.data.rlast.poke(true.B)
      wait = 0
      while (!dut.io.axi.r.rready.peek().litToBoolean && wait < 40) {
        dut.clock.step()
        wait += 1
      }
      dut.io.axi.r.rready.expect(true.B)
      dut.clock.step()
      dut.io.axi.r.data.rvalid.poke(false.B)
      dut.io.axi.r.data.rlast.poke(false.B)

      wait = 0
      while (!dut.io.maintenanceDoneValid.peek().litToBoolean && wait < 5000) {
        dut.clock.step()
        wait += 1
      }
      dut.io.maintenanceDoneValid.expect(true.B)
    }
  }
}
