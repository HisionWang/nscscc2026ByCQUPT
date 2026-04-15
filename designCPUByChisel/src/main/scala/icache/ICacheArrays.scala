 
import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
 
 
class ICacheMetaArray(implicit p: Parameters) extends NSModule {

  val io = IO(new Bundle {
    // 读取端口
    val read = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val data  = Output(Vec(nWays, new Bundle {
        val valid = Bool()
        val tag   = UInt(tagBits.W)
      }))
    }
    
    // 写入端口
    val write = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
      val tag   = Input(UInt(tagBits.W))
      val data  = Input(Vec(nWays, new Bundle {
        val valid = Bool()
        val tag   = UInt(tagBits.W)
      }))
    }
    
    // Flush端口
    val flush = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
    }
  })
  
  // === SRAM实现 ===
  // 使用SyncReadMem实现meta array
  class MetaEntry extends Bundle {
    val valid = Bool()
    val tag   = UInt(tagBits.W)
  }
  
  val metaArray = SyncReadMem(nSets, Vec(nWays, new MetaEntry))
  
  // === 读取逻辑 ===
  val read_data = Wire(Vec(nWays, new MetaEntry))
  
  when(io.read.valid) {
    read_data := metaArray.read(io.read.idx, true.B)
  }.otherwise {
    read_data := 0.U.asTypeOf(Vec(nWays, new MetaEntry))
  }
  
  // 输出读取数据
  for (i <- 0 until nWays) {
    io.read.data(i).valid := read_data(i).valid
    io.read.data(i).tag   := read_data(i).tag
  }
  
  // === 写入逻辑 ===
  when(io.write.valid) {
    val write_data = Wire(Vec(nWays, new MetaEntry))
    val current_data = metaArray.read(io.write.idx, false.B)
    
    for (i <- 0 until nWays) {
      when(i.U === io.write.way) {
        write_data(i).valid := io.write.data(i).valid
        write_data(i).tag   := io.write.data(i).tag
      }.otherwise {
        write_data(i).valid := current_data(i).valid
        write_data(i).tag   := current_data(i).tag
      }
    }
    
    metaArray.write(io.write.idx, write_data)
  }
  
  // === Flush逻辑 ===
  when(io.flush.valid) {
    val flush_data = Wire(Vec(nWays, new MetaEntry))
    for (i <- 0 until nWays) {
      flush_data(i).valid := false.B
      flush_data(i).tag   := 0.U
    }
    metaArray.write(io.flush.idx, flush_data)
  }
  
  println("ICacheMetaArray instantiated:")
  println(s"  Sets: $nSets, Ways: $nWays, TagBits: $tagBits")
}
 

class ICacheDataArray(implicit p: Parameters) extends NSModule {
  

  val io = IO(new Bundle {
    // 读取端口
    val read = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val data  = Output(Vec(nWays, UInt((blockBytes * 8).W)))
    }
    
    // 写入端口
    val write = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
      val data  = Input(UInt((blockBytes * 8).W))
    }
    
    // Flush端口
    val flush = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
    }
  })
  
  // === SRAM实现 ===
  val dataArray = SyncReadMem(nSets, Vec(nWays, UInt((blockBytes * 8).W)))
  
  // === 读取逻辑 ===
  val read_data = Wire(Vec(nWays, UInt((blockBytes * 8).W)))
  
  when(io.read.valid) {
    read_data := dataArray.read(io.read.idx, true.B)
  }.otherwise {
    read_data := 0.U.asTypeOf(Vec(nWays, UInt((blockBytes * 8).W)))
  }
  
  io.read.data := read_data
  
  // === 写入逻辑 ===
  when(io.write.valid) {
    val write_data = Wire(Vec(nWays, UInt((blockBytes * 8).W)))
    val current_data = dataArray.read(io.write.idx, false.B)
    
    for (i <- 0 until nWays) {
      when(i.U === io.write.way) {
        write_data(i) := io.write.data
      }.otherwise {
        write_data(i) := current_data(i)
      }
    }
    
    dataArray.write(io.write.idx, write_data)
  }
  
  // === Flush逻辑 ===
  when(io.flush.valid) {
    val flush_data = Wire(Vec(nWays, UInt((blockBytes * 8).W)))
    for (i <- 0 until nWays) {
      flush_data(i) := 0.U
    }
    dataArray.write(io.flush.idx, flush_data)
  }
  
  println("ICacheDataArray instantiated:")
  println(s"  Sets: $nSets, Ways: $nWays, BlockBits: ${blockBytes * 8}")
}
 

 
class ICacheReplacer(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    // Hit时更新替换状态
    val touch = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
    }
    
    // Miss时获取victim way
    val victim = new Bundle {
      val req  = Input(Bool())
      val idx  = Input(UInt(idxBits.W))
      val resp = Output(UInt(wayBits.W))
    }
    
    // Flush替换状态
    val flush = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
    }
  })
  
  // === Pseudo-LRU实现 ===
  // 对于4路组相联，使用3个bit的PLRU树结构
  //       bit0
  //      /    \
  //   bit1    bit2
  //   / \     / \
  //  w0 w1  w2 w3
  
  val plruTree = SyncReadMem(nSets, UInt(3.W))
  

  // === PLRU更新逻辑 ===
  def updatePLRU(oldPLRU: UInt, way: UInt): UInt = {
    val newPLRU = Wire(UInt(3.W))
    
    // 将 way 转换为 UInt(2.W) 进行匹配
    switch(way) {
      is(0.U) {
        newPLRU := Cat(1.U(1.W), 1.U(1.W), oldPLRU(2))
      }
      is(1.U) {
        newPLRU := Cat(1.U(1.W), 0.U(1.W), oldPLRU(2))
      }
      is(2.U) {
        newPLRU := Cat(0.U(1.W), oldPLRU(1), 1.U(1.W))
      }
      is(3.U) {
        newPLRU := Cat(0.U(1.W), oldPLRU(1), 0.U(1.W))
      }
    }
    newPLRU
  }
  
  // === PLRU Victim选择逻辑 ===
  def getVictim(plru: UInt): UInt = {
    val victim = WireDefault(0.U(wayBits.W))
    
    // 方法1：使用 Mux 链代替 switch
    val plru0 = plru(0)  // 这是 UInt(1.W)
    val plru1 = plru(1)  // 这是 UInt(1.W)
    val plru2 = plru(2)  // 这是 UInt(1.W)
    
    // 使用 Mux 实现 PLRU 选择逻辑
    when(plru0 === 0.U) {
      // 左子树
      victim := Mux(plru1 === 0.U, 0.U, 1.U)
    }.otherwise {
      // 右子树
      victim := Mux(plru2 === 0.U, 2.U, 3.U)
    }
    victim
  }

  
  
  // === Touch逻辑 ===
  when(io.touch.valid) {
    val currentPLRU = plruTree.read(io.touch.idx)
    val newPLRU = updatePLRU(currentPLRU, io.touch.way)
    plruTree.write(io.touch.idx, newPLRU)
  }
  
  // === Victim选择逻辑 ===
  val victimRespReg = RegInit(0.U(wayBits.W))
  
  when(io.victim.req) {
    val currentPLRU = plruTree.read(io.victim.idx)
    victimRespReg := getVictim(currentPLRU)
  }
  
  // 输出响应
  io.victim.resp := victimRespReg
  
  // === Flush逻辑 ===
  when(io.flush.valid) {
    // 重置PLRU状态到初始值
    plruTree.write(io.flush.idx, 0.U)
  }
  
  //println("ICacheReplacer instantiated:")
  println(s"  Sets: $nSets, Ways: $nWays, IdxBits: $idxBits, WayBits: $wayBits")
  println(s"  Replacer: PLRU (4-way)")
}