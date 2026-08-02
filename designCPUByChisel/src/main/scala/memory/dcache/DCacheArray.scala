package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.util.SimpleBlockRAM
 
class DCacheArray(implicit p: Parameters) extends NSModule {
  val metaWidth = tagBits    + 1 //2
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
      val wen   = Input(Bool())
    }
    val metaWrite = new Bundle {
      val valid     = Input(Bool())
      val idx       = Input(UInt(idxBits.W))
      val way       = Input(UInt(wayBits.W))
      val metaValid = Input(Bool())
      val dirty     = Input(Bool())
      val tag       = Input(UInt(tagBits.W))
    }
    val hasDirty = Output(Bool())
    val dirtyIdx = Output(UInt(idxBits.W))
    val dirtyWay = Output(UInt(wayBits.W))
  })
  // 在 metaBRAMs/dataBRAMs 声明之前插入
  val validArray = RegInit(VecInit(Seq.fill(nWays)(0.U(nSets.W))))
  val dirtyArray = RegInit(VecInit(Seq.fill(nWays)(0.U(nSets.W))))

  val dirtyWayMask = VecInit((0 until nWays).map(way => dirtyArray(way).orR)).asUInt
  io.hasDirty := dirtyWayMask.orR
  io.dirtyWay := PriorityEncoder(dirtyWayMask)
  io.dirtyIdx := PriorityEncoder(dirtyArray(io.dirtyWay))
  
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

    //val readIdxReg = RegEnable(io.read.idx, io.read.valid)
    val readIdxReg = RegEnable(io.read.idx, 0.U(idxBits.W), io.read.valid)

    readRespData.ways(way).valid := validArray(way)(readIdxReg)  //metaUInt(tagBits + 1)
    readRespData.ways(way).dirty := metaUInt(tagBits)
    readRespData.ways(way).tag   := metaUInt(tagBits - 1, 0)
    readRespData.ways(way).data  := dataBRAMs(way).rd_data
  }
 
  io.read.resp     := readRespData
  io.read.validOut := RegNext(io.read.valid)
 
  val writeWayOneHot = UIntToOH(io.write.way)
  for (way <- 0 until nWays) {
    val waySel = writeWayOneHot(way)
    //val metaWriteData = Cat(true.B, io.write.dirty, io.write.tag)
    val metaWriteData = Cat(io.write.dirty, io.write.tag)  // BRAM 不再存 valid
    metaBRAMs(way).wr_en   := false.B
    metaBRAMs(way).wr_addr := 0.U
    metaBRAMs(way).wr_data := 0.U
    dataBRAMs(way).wr_en   := false.B
    dataBRAMs(way).wr_addr := 0.U
    dataBRAMs(way).wr_data := 0.U
    when(io.write.valid && waySel) {
      validArray(way) := validArray(way).bitSet(io.write.idx, true.B)
      dirtyArray(way) := dirtyArray(way).bitSet(io.write.idx, io.write.dirty)

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
      //val mwData = Cat(io.metaWrite.metaValid, io.metaWrite.dirty, io.metaWrite.tag)
      val mwData = Cat(io.metaWrite.dirty, io.metaWrite.tag) 
      validArray(way) := validArray(way).bitSet(io.metaWrite.idx, io.metaWrite.metaValid)
      dirtyArray(way) := dirtyArray(way).bitSet(io.metaWrite.idx,
        io.metaWrite.metaValid && io.metaWrite.dirty)
      metaBRAMs(way).wr_en   := true.B
      metaBRAMs(way).wr_addr := io.metaWrite.idx
      metaBRAMs(way).wr_data := mwData
    }
  }
}
