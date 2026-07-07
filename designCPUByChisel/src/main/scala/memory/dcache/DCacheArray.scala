package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.util.SimpleBlockRAM
 
class DCacheArray(implicit p: Parameters) extends NSModule {
  val metaWidth = tagBits + 2
  val dataWidth = blockBytes * 8
 
  val io = IO(new Bundle {
    val read = new Bundle {
      val valid    = Input(Bool())
      val idx      = Input(UInt(idxBits.W))
      val resp     = Output(new DCacheArrayReadData)
      val validOut = Output(Bool())
    }
    val write = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
      val tag   = Input(UInt(tagBits.W))
      val dirty = Input(Bool())
      val data  = Input(UInt(dataWidth.W))
      val wen   = Input(Bool())   // data 写使能
    }
    val metaWrite = new Bundle {
      val valid     = Input(Bool())
      val idx       = Input(UInt(idxBits.W))
      val way       = Input(UInt(wayBits.W))
      val metaValid = Input(Bool())
      val dirty     = Input(Bool())
      val tag       = Input(UInt(tagBits.W))
    }
  })
 
  val metaBRAMs = VecInit(Seq.fill(nWays)(
    Module(new SimpleBlockRAM(depth = nSets, width = metaWidth, readLatency = 1)).io
  ))
  val dataBRAMs = VecInit(Seq.fill(nWays)(
    Module(new SimpleBlockRAM(depth = nSets, width = dataWidth, readLatency = 1)).io
  ))
 
  for (way <- 0 until nWays) {
    metaBRAMs(way).rd_en   := io.read.valid
    metaBRAMs(way).rd_addr := io.read.idx
    dataBRAMs(way).rd_en   := io.read.valid
    dataBRAMs(way).rd_addr := io.read.idx
  }
 
  val readRespData = Wire(new DCacheArrayReadData)
  for (way <- 0 until nWays) {
    val metaUInt = metaBRAMs(way).rd_data
    readRespData.ways(way).valid := metaUInt(tagBits + 1)
    readRespData.ways(way).dirty := metaUInt(tagBits)
    readRespData.ways(way).tag   := metaUInt(tagBits - 1, 0)
    readRespData.ways(way).data  := dataBRAMs(way).rd_data
  }
 
  io.read.resp     := readRespData
  io.read.validOut := RegNext(io.read.valid)
 
  val writeWayOneHot = UIntToOH(io.write.way)
  for (way <- 0 until nWays) {
    val waySel = writeWayOneHot(way)
    val metaWriteData = Cat(true.B, io.write.dirty, io.write.tag)
    metaBRAMs(way).wr_en   := false.B
    metaBRAMs(way).wr_addr := 0.U
    metaBRAMs(way).wr_data := 0.U
    dataBRAMs(way).wr_en   := false.B
    dataBRAMs(way).wr_addr := 0.U
    dataBRAMs(way).wr_data := 0.U
    when(io.write.valid && waySel) {
      metaBRAMs(way).wr_en   := true.B
      metaBRAMs(way).wr_addr := io.write.idx
      metaBRAMs(way).wr_data := metaWriteData
      when(io.write.wen) {
        dataBRAMs(way).wr_en   := true.B
        dataBRAMs(way).wr_addr := io.write.idx
        dataBRAMs(way).wr_data := io.write.data
      }
    }
    val mwSel = UIntToOH(io.metaWrite.way)(way)
    when(io.metaWrite.valid && mwSel && !(io.write.valid && waySel)) {
      val mwData = Cat(io.metaWrite.metaValid, io.metaWrite.dirty, io.metaWrite.tag)
      metaBRAMs(way).wr_en   := true.B
      metaBRAMs(way).wr_addr := io.metaWrite.idx
      metaBRAMs(way).wr_data := mwData
    }
  }
}