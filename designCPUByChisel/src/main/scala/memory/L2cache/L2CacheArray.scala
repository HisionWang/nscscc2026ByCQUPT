package nscscc.mem.L2cache

import chisel3._
import chisel3.util._
import nscscc.config._

class L2DataRAMBlackBox(val depth: Int, val width: Int)(implicit p: Parameters)
    extends BlackBox {
  private val addrWidth = log2Ceil(depth)

  override def desiredName: String = s"L2_bram_${depth}x${width}"

  val io = IO(new Bundle {
    val clka = Input(Clock())
    val ena = Input(Bool())
    val wea = Input(Bool())
    val addra = Input(UInt(addrWidth.W))
    val dina = Input(UInt(width.W))

    val clkb = Input(Clock())
    val rstb = Input(Bool())
    val enb = Input(Bool())
    val addrb = Input(UInt(addrWidth.W))
    val doutb = Output(UInt(width.W))
  })
}

// 数据RAM专用封装：仿真与REGOUT=1的Vivado IP都保持总读延迟两拍。
class L2DataRAM(val depth: Int, val width: Int)(implicit p: Parameters)
    extends NSModule {
  private val addrWidth = log2Ceil(depth)

  val io = IO(new Bundle {
    val write = Flipped(Valid(new Bundle {
      val addr = UInt(addrWidth.W)
      val data = UInt(width.W)
    }))
    val read = new Bundle {
      val enable = Input(Bool())
      val addr = Input(UInt(addrWidth.W))
      val data = Output(UInt(width.W))
    }
  })

  if (EnableDifftest) {
    val memory = SyncReadMem(depth, UInt(width.W))
    when(io.write.valid) {
      memory.write(io.write.bits.addr, io.write.bits.data)
    }

    val memoryData = memory.read(io.read.addr, io.read.enable)
    val readEnableD1 = RegNext(io.read.enable, false.B)
    io.read.data := RegEnable(memoryData, 0.U(width.W), readEnableD1)
  } else {
    val memory = Module(new L2DataRAMBlackBox(depth, width))
    memory.io.clka := clock
    memory.io.ena := io.write.valid
    memory.io.wea := io.write.valid
    memory.io.addra := io.write.bits.addr
    memory.io.dina := io.write.bits.data

    memory.io.clkb := clock
    memory.io.rstb := reset.asBool
    memory.io.enb := io.read.enable
    memory.io.addrb := io.read.addr
    io.read.data := memory.io.doutb
  }
}

class L2CacheArray(implicit p: Parameters) extends NSModule {
  require(l2ReadLatency == 2, "L2CacheArray V1 requires a two-cycle read")
  require(l2Sets == 512 && l2Ways == 8 && l2LineBits == 512)

  val io = IO(new L2ArrayIO)

  // valid/dirty需要响应CPU warm reset，不依赖BRAM COE。
  val validBits = RegInit(VecInit(Seq.fill(l2Ways)(0.U(l2Sets.W))))
  val dirtyBits = RegInit(VecInit(Seq.fill(l2Ways)(0.U(l2Sets.W))))

  val dataRams = Seq.fill(l2Ways)(Module(new L2DataRAM(l2Sets, l2LineBits)))
  val tagRams = Seq.fill(l2Ways)(SyncReadMem(l2Sets, UInt(l2TagBits.W)))

  val sameSetWrite =
    io.write.valid && io.write.bits.set === io.read.req.bits.set
  io.read.req.ready := !sameSetWrite
  val readFire = io.read.req.fire

  val readValidD1 = RegNext(readFire, false.B)
  val readValidD2 = RegNext(readValidD1, false.B)
  val readSetD1 = RegEnable(io.read.req.bits.set, 0.U, readFire)
  val readSetD2 = RegEnable(readSetD1, 0.U, readValidD1)

  io.read.resp.valid := readValidD2
  io.read.resp.bits.set := readSetD2

  val writeWayOH = UIntToOH(io.write.bits.way, l2Ways)

  for (way <- 0 until l2Ways) {
    val wayWrite = io.write.valid && writeWayOH(way)

    dataRams(way).io.read.enable := readFire
    dataRams(way).io.read.addr := io.read.req.bits.set
    dataRams(way).io.write.valid := wayWrite && io.write.bits.dataWen
    dataRams(way).io.write.bits.addr := io.write.bits.set
    dataRams(way).io.write.bits.data := io.write.bits.data

    when(wayWrite) {
      tagRams(way).write(io.write.bits.set, io.write.bits.tag)
      validBits(way) := validBits(way).bitSet(
        io.write.bits.set,
        io.write.bits.valid
      )
      dirtyBits(way) := dirtyBits(way).bitSet(
        io.write.bits.set,
        io.write.bits.valid && io.write.bits.dirty
      )
    }

    val tagDataD1 = tagRams(way).read(io.read.req.bits.set, readFire)
    val tagDataD2 = RegEnable(tagDataD1, 0.U, readValidD1)
    // metadata也随lookup流水两拍，避免后一拍同set写入撕裂响应快照。
    val validDataD1 = RegEnable(validBits(way)(io.read.req.bits.set), false.B, readFire)
    val validDataD2 = RegEnable(validDataD1, false.B, readValidD1)
    val dirtyDataD1 = RegEnable(dirtyBits(way)(io.read.req.bits.set), false.B, readFire)
    val dirtyDataD2 = RegEnable(dirtyDataD1, false.B, readValidD1)

    io.read.resp.bits.ways(way).valid := validDataD2
    io.read.resp.bits.ways(way).dirty :=
      validDataD2 && dirtyDataD2
    io.read.resp.bits.ways(way).tag := tagDataD2
    io.read.resp.bits.ways(way).data := dataRams(way).io.read.data
  }
}
