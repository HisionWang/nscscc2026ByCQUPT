package nscscc.mem.L2cache

import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.simulator.{VerilatorBackendAnnotation, VerilatorCFlags, VerilatorFlags}
import nscscc.axi._
import nscscc.config._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

// Verilator 5将宽端口表示为VlWide，老版chiseltest的harness无法直接访问。
// 该test-only包装器将两个512位端口拆成16个32位word，不改动L2 RTL。
class L2CacheTestHarness(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val iReq = Flipped(Decoupled(new L2ReadReq(1)))
    val iRespValid = Output(Bool())
    val iRespReady = Input(Bool())
    val iRespId = Output(UInt(1.W))
    val iRespWords = Output(Vec(l2BurstBeats, UInt(XLEN.W)))
    val iRespFullLine = Output(Bool())
    val iRespLast = Output(Bool())

    val dReadReq = Flipped(Decoupled(new L2ReadReq(1)))
    val dReadRespReady = Input(Bool())
    val dWriteReqValid = Input(Bool())
    val dWriteReqReady = Output(Bool())
    val dWriteReqId = Input(UInt(1.W))
    val dWriteReqAddr = Input(UInt(XLEN.W))
    val dWriteReqKind = Input(UInt(L2WriteKind.width.W))
    val dWriteReqSize = Input(UInt(3.W))
    val dWriteReqWords = Input(Vec(l2BurstBeats, UInt(XLEN.W)))
    val dWriteReqStrb = Input(UInt(l2BeatBytes.W))
    val dWriteDoneReady = Input(Bool())

    val axi = new AXI3MasterIO
  })

  val cache = Module(new L2Cache)
  cache.io.icache.req <> io.iReq
  io.iRespValid := cache.io.icache.resp.valid
  cache.io.icache.resp.ready := io.iRespReady
  io.iRespId := cache.io.icache.resp.bits.id
  io.iRespWords := cache.io.icache.resp.bits.data.asTypeOf(
    Vec(l2BurstBeats, UInt(XLEN.W)))
  io.iRespFullLine := cache.io.icache.resp.bits.fullLine
  io.iRespLast := cache.io.icache.resp.bits.last

  cache.io.dcache.read.req <> io.dReadReq
  cache.io.dcache.read.resp.ready := io.dReadRespReady
  cache.io.dcache.write.req.valid := io.dWriteReqValid
  io.dWriteReqReady := cache.io.dcache.write.req.ready
  cache.io.dcache.write.req.bits.id := io.dWriteReqId
  cache.io.dcache.write.req.bits.addr := io.dWriteReqAddr
  cache.io.dcache.write.req.bits.kind := io.dWriteReqKind
  cache.io.dcache.write.req.bits.size := io.dWriteReqSize
  cache.io.dcache.write.req.bits.data := io.dWriteReqWords.asUInt
  cache.io.dcache.write.req.bits.strb := io.dWriteReqStrb
  cache.io.dcache.write.done.ready := io.dWriteDoneReady

  cache.io.maintenance.req.valid := false.B
  cache.io.maintenance.req.bits.op := 0.U
  cache.io.maintenance.req.bits.addr := 0.U
  cache.io.maintenance.done.ready := true.B
  io.axi <> cache.io.axi
}

class L2CacheSpec
    extends AnyFlatSpec
    with ChiselScalatestTester
    with Matchers {
  behavior of "L2Cache"

  private implicit val p: Parameters =
    new Parameters(Map(DebugConfigKeys.EnableDifftest -> true))

  // Verilator 5移除了旧WData别名；包装器已确保顶层无宽端口。
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
    dut.io.dWriteReqStrb.poke(0.U)
    dut.io.dWriteDoneReady.poke(true.B)

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
  }

  private def sendIRead(
      dut: L2CacheTestHarness,
      addr: BigInt,
      id: Int = 0,
      uncache: Boolean = false
  ): Unit = {
    dut.io.iReq.valid.poke(true.B)
    dut.io.iReq.bits.id.poke(id.U)
    dut.io.iReq.bits.addr.poke(addr.U)
    dut.io.iReq.bits.size.poke(2.U)
    dut.io.iReq.bits.uncache.poke(uncache.B)
    var wait = 0
    while (!dut.io.iReq.ready.peek().litToBoolean && wait < 80) {
      dut.clock.step()
      wait += 1
    }
    withClue(s"read request 0x${addr.toString(16)} was not accepted") {
      dut.io.iReq.ready.peek().litToBoolean shouldBe true
    }
    dut.clock.step()
    dut.io.iReq.valid.poke(false.B)
  }

  it should "accept a putLine into the D STB and return it as one full line" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)
      val addr = BigInt("80000180", 16)
      val words = (0 until 16).map(i => BigInt(0x31000000L + i))

      dut.io.dWriteReqValid.poke(true.B)
      dut.io.dWriteReqId.poke(1.U)
      dut.io.dWriteReqAddr.poke(addr.U)
      dut.io.dWriteReqKind.poke(L2WriteKind.putLine)
      for (word <- 0 until 16) dut.io.dWriteReqWords(word).poke(words(word).U)
      dut.io.dWriteReqReady.expect(true.B)
      dut.clock.step()
      dut.io.dWriteReqValid.poke(false.B)

      sendIRead(dut, addr, id = 1)
      var wait = 0
      while (!dut.io.iRespValid.peek().litToBoolean && wait < 40) {
        dut.io.axi.ar.data.arvalid.expect(false.B)
        dut.clock.step()
        wait += 1
      }
      dut.io.iRespValid.expect(true.B)
      dut.io.iRespId.expect(1.U)
      dut.io.iRespFullLine.expect(true.B)
      dut.io.iRespLast.expect(true.B)
      for (word <- 0 until 16) dut.io.iRespWords(word).expect(words(word).U)
    }
  }

  it should "stream a DDR miss to L1, install it, then hit as a full line" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)
      val addr = BigInt("81000440", 16)
      val words = (0 until 16).map(i => BigInt(0x42000000L + i))

      dut.io.iRespReady.poke(false.B)
      sendIRead(dut, addr, id = 1)

      var wait = 0
      while (!dut.io.axi.ar.data.arvalid.peek().litToBoolean && wait < 40) {
        dut.clock.step()
        wait += 1
      }
      dut.io.axi.ar.data.arvalid.expect(true.B)
      dut.io.axi.ar.data.araddr.expect(addr.U)
      dut.io.axi.ar.data.arlen.expect(15.U)
      dut.io.axi.ar.data.arsize.expect(2.U)
      dut.io.axi.ar.arready.poke(true.B)
      dut.clock.step()
      dut.io.axi.ar.arready.poke(false.B)

      for (beat <- 0 until 16) {
        dut.io.axi.r.data.rvalid.poke(true.B)
        dut.io.axi.r.data.rdata.poke(words(beat).U)
        dut.io.axi.r.data.rlast.poke((beat == 15).B)
        dut.io.axi.r.rready.expect(true.B)
        dut.clock.step()
      }
      dut.io.axi.r.data.rvalid.poke(false.B)

      dut.io.iRespReady.poke(true.B)
      for (beat <- 0 until 16) {
        var responseWait = 0
        while (!dut.io.iRespValid.peek().litToBoolean && responseWait < 40) {
          dut.clock.step()
          responseWait += 1
        }
        dut.io.iRespValid.expect(true.B)
        dut.io.iRespId.expect(1.U)
        dut.io.iRespFullLine.expect(false.B)
        dut.io.iRespWords(0).expect(words(beat).U)
        dut.io.iRespLast.expect((beat == 15).B)
        dut.clock.step()
      }

      dut.clock.step(3)
      sendIRead(dut, addr, id = 0)
      wait = 0
      while (!dut.io.iRespValid.peek().litToBoolean && wait < 40) {
        dut.io.axi.ar.data.arvalid.expect(false.B)
        dut.clock.step()
        wait += 1
      }
      dut.io.iRespValid.expect(true.B)
      dut.io.iRespId.expect(0.U)
      dut.io.iRespFullLine.expect(true.B)
      dut.io.iRespLast.expect(true.B)
      for (word <- 0 until 16) dut.io.iRespWords(word).expect(words(word).U)
    }
  }

  it should "serialize later cacheable reads behind an uncached read" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)
      sendIRead(dut, BigInt("1c00102c", 16), uncache = true)

      dut.io.iReq.valid.poke(true.B)
      dut.io.iReq.bits.id.poke(0.U)
      dut.io.iReq.bits.addr.poke(BigInt("80002000", 16).U)
      dut.io.iReq.bits.size.poke(2.U)
      dut.io.iReq.bits.uncache.poke(false.B)
      for (_ <- 0 until 4) {
        dut.io.iReq.ready.expect(false.B)
        dut.clock.step()
      }
    }
  }

  it should "give a same-cycle uncached write exclusive admission" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)

      dut.io.dWriteReqValid.poke(true.B)
      dut.io.dWriteReqId.poke(1.U)
      dut.io.dWriteReqAddr.poke(BigInt("1c002003", 16).U)
      dut.io.dWriteReqKind.poke(L2WriteKind.uncache)
      dut.io.dWriteReqSize.poke(0.U)
      dut.io.dWriteReqWords(0).poke("h7f000000".U)
      dut.io.dWriteReqStrb.poke(8.U)

      dut.io.iReq.valid.poke(true.B)
      dut.io.iReq.bits.id.poke(0.U)
      dut.io.iReq.bits.addr.poke(BigInt("80003000", 16).U)
      dut.io.iReq.bits.size.poke(2.U)
      dut.io.iReq.bits.uncache.poke(false.B)

      dut.io.dWriteReqReady.expect(true.B)
      dut.io.iReq.ready.expect(false.B)
      dut.clock.step()
      dut.io.dWriteReqValid.poke(false.B)
      for (_ <- 0 until 3) {
        dut.io.iReq.ready.expect(false.B)
        dut.clock.step()
      }
    }
  }
  it should "release one of four completed MSHRs while a fifth miss waits at lookup result" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)
      dut.io.iRespReady.poke(false.B)
      val addresses = (0 until 5).map(i => BigInt("82000000", 16) + i * 0x40)

      val fillWords = (0 until 16).map(i => BigInt(0x55000000L + i))
      for (addr <- addresses.take(4)) {
        sendIRead(dut, addr)
        var wait = 0
        while (!dut.io.axi.ar.data.arvalid.peek().litToBoolean && wait < 40) {
          dut.clock.step()
          wait += 1
        }
        withClue(s"miss 0x${addr.toString(16)} did not issue") {
          dut.io.axi.ar.data.arvalid.peek().litToBoolean shouldBe true
        }
        dut.io.axi.ar.data.araddr.expect(addr.U)
        dut.io.axi.ar.arready.poke(true.B)
        dut.clock.step()
        dut.io.axi.ar.arready.poke(false.B)

        for (beat <- 0 until 16) {
          dut.io.axi.r.data.rvalid.poke(true.B)
          dut.io.axi.r.data.rdata.poke((fillWords(beat) + (addr & 0xff)).U)
          dut.io.axi.r.data.rlast.poke((beat == 15).B)
          dut.io.axi.r.rready.expect(true.B)
          dut.clock.step()
        }
        dut.io.axi.r.data.rvalid.poke(false.B)
        dut.io.axi.r.data.rlast.poke(false.B)
        dut.clock.step()
      }

      sendIRead(dut, addresses(4))
      dut.clock.step(5)
      dut.io.axi.ar.data.arvalid.expect(false.B)

      dut.io.iRespReady.poke(true.B)
      var responseBeats = 0
      var cycles = 0
      while (responseBeats < 16 && cycles < 80) {
        if (dut.io.iRespValid.peek().litToBoolean) {
          dut.io.iRespWords(0).expect(fillWords(responseBeats).U)
          responseBeats += 1
        }
        dut.clock.step()
        cycles += 1
      }
      withClue("the fifth lookup result must not block completed MSHR response beats") {
        responseBeats shouldBe 16
      }

      var fifthIssued = false
      cycles = 0
      while (!fifthIssued && cycles < 80) {
        if (dut.io.axi.ar.data.arvalid.peek().litToBoolean) {
          dut.io.axi.ar.data.araddr.expect(addresses(4).U)
          fifthIssued = true
        } else {
          dut.clock.step()
        }
        cycles += 1
      }
      withClue("the fifth miss must issue after the completed MSHR releases") {
        fifthIssued shouldBe true
      }
    }
  }

  it should "give an STB a bounded lookup turn under continuous L1 reads" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)
      val readLines = (0 until 6).map(i => BigInt("84001000", 16) + i * 0x40)
      val stbLines = Seq(BigInt("83002000", 16), BigInt("83002040", 16))
      val thirdLine = BigInt("83002080", 16)

      // 先用putLine安装多条命中行，再形成每拍可接收的普通lookup流。
      for (addr <- readLines) {
        dut.io.dWriteReqValid.poke(true.B)
        dut.io.dWriteReqAddr.poke(addr.U)
        dut.io.dWriteReqKind.poke(L2WriteKind.putLine)
        dut.io.dWriteReqReady.expect(true.B)
        dut.clock.step()
        dut.io.dWriteReqValid.poke(false.B)
        dut.clock.step(8)
      }

      dut.io.iReq.valid.poke(true.B)
      dut.io.dReadReq.valid.poke(true.B)
      var readIndex = 0
      for (addr <- stbLines) {
        dut.io.iReq.bits.addr.poke(readLines(readIndex).U)
        dut.io.dReadReq.bits.addr.poke(readLines(readIndex + 1).U)
        dut.io.dWriteReqValid.poke(true.B)
        dut.io.dWriteReqAddr.poke(addr.U)
        dut.io.dWriteReqKind.poke(L2WriteKind.putLine)
        dut.io.dWriteReqReady.expect(true.B)
        dut.clock.step()
        readIndex += 2
      }

      dut.io.dWriteReqAddr.poke(thirdLine.U)
      var thirdAccepted = false
      var cycles = 0
      while (!thirdAccepted && cycles < 24) {
        dut.io.iReq.bits.addr.poke(readLines(readIndex % readLines.length).U)
        dut.io.dReadReq.bits.addr.poke(readLines((readIndex + 1) % readLines.length).U)
        thirdAccepted = dut.io.dWriteReqReady.peek().litToBoolean
        dut.clock.step()
        readIndex += 2
        cycles += 1
      }
      withClue("continuous L1 lookups must not starve STB installation") {
        thirdAccepted shouldBe true
      }
    }
  }

  it should "block new cacheable admissions while an uncache request waits for drain" in {
    test(new L2CacheTestHarness).withAnnotations(verilator) { dut =>
      resetDut(dut)
      val activeLine = BigInt("85000000", 16)
      val uncacheAddr = BigInt("1f000004", 16)
      val blockedLine = BigInt("85000140", 16)

      // 先保留一个未完成miss，再让uncache请求持续等待排空。
      sendIRead(dut, activeLine)
      dut.clock.step(4)
      dut.io.iReq.valid.poke(true.B)
      dut.io.iReq.bits.addr.poke(uncacheAddr.U)
      dut.io.iReq.bits.uncache.poke(true.B)
      dut.io.dReadReq.valid.poke(true.B)
      dut.io.dReadReq.bits.addr.poke(blockedLine.U)
      dut.io.dReadReq.bits.uncache.poke(false.B)

      dut.io.iReq.ready.expect(false.B)
      dut.io.dReadReq.ready.expect(false.B)
      dut.io.dReadReq.valid.poke(false.B)

      var wait = 0
      while (!dut.io.axi.ar.data.arvalid.peek().litToBoolean && wait < 40) {
        dut.clock.step()
        wait += 1
      }
      dut.io.axi.ar.data.arvalid.expect(true.B)
      dut.io.axi.ar.data.araddr.expect(activeLine.U)
      dut.io.axi.ar.arready.poke(true.B)
      dut.clock.step()
      dut.io.axi.ar.arready.poke(false.B)

      for (beat <- 0 until 16) {
        dut.io.axi.r.data.rvalid.poke(true.B)
        dut.io.axi.r.data.rdata.poke((0x61000000L + beat).U)
        dut.io.axi.r.data.rlast.poke((beat == 15).B)
        dut.io.axi.r.rready.expect(true.B)
        dut.clock.step()
      }
      dut.io.axi.r.data.rvalid.poke(false.B)
      dut.io.axi.r.data.rlast.poke(false.B)

      var uncacheAccepted = false
      wait = 0
      while (!uncacheAccepted && wait < 100) {
        uncacheAccepted = dut.io.iReq.ready.peek().litToBoolean
        dut.clock.step()
        wait += 1
      }
      withClue("waiting uncache must be admitted after old cache work drains") {
        uncacheAccepted shouldBe true
      }
    }
  }

}
