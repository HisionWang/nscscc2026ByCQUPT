file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheArrays.scala
empty definition using pc, found symbol in pc: 
semanticdb not found
empty definition using fallback
non-local guesses:
	 -chisel3/idx.
	 -chisel3/idx#
	 -chisel3/idx().
	 -chisel3/util/idx.
	 -chisel3/util/idx#
	 -chisel3/util/idx().
	 -cacheParams/idx.
	 -cacheParams/idx#
	 -cacheParams/idx().
	 -idx.
	 -idx#
	 -idx().
	 -scala/Predef.idx.
	 -scala/Predef.idx#
	 -scala/Predef.idx().
offset: 2472
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache/ICacheArrays.scala
text:
```scala
// ICacheArrays.scala
package loongarch.cache
 
import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
 
class ICacheMetaArray(implicit p: Parameters) extends NSModule {
  
  val cacheParams = p(ICacheKey)
  import cacheParams._
  
  val io = IO(new Bundle {
    val read = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val data  = Output(Vec(nWays, new Bundle {
        val valid = Bool()
        val tag   = UInt(tagBits.W)
      }))
    }
    
    val write = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
      val tag   = Input(UInt(tagBits.W))
    }
  })
  
  // Meta SRAM
  val metaArray = SyncReadMem(nSets, Vec(nWays, new Bundle {
    val valid = Bool()
    val tag   = UInt(tagBits.W)
  }))
  
  // 读取
  val read_data = metaArray.read(io.read.idx, io.read.valid)
  io.read.data := read_data
  
  // 写入
  when(io.write.valid) {
    val write_data = Wire(Vec(nWays, new Bundle {
      val valid = Bool()
      val tag   = UInt(tagBits.W)
    }))
    write_data := read_data
    write_data(io.write.way).valid := true.B
    write_data(io.write.way).tag := io.write.tag
    
    metaArray.write(io.write.idx, write_data)
  }
}
 
class ICacheDataArray(implicit p: Parameters) extends NSModule {
  
  val cacheParams = p(ICacheKey)
  import cacheParams._
  
  val io = IO(new Bundle {
    val read = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val data  = Output(Vec(nWays, UInt(blockBytes * 8.W)))
    }
    
    val write = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
      val data  = Input(UInt(blockBytes * 8.W))
    }
  })
  
  // Data SRAM
  val dataArray = SyncReadMem(nSets, Vec(nWays, UInt(blockBytes * 8.W)))
  
  // 读取
  val read_data = dataArray.read(io.read.idx, io.read.valid)
  io.read.data := read_data
  
  // 写入
  when(io.write.valid) {
    val write_data = Wire(Vec(nWays, UInt(blockBytes * 8.W)))
    write_data := read_data
    write_data(io.write.way) := io.write.data
    
    dataArray.write(io.write.idx, write_data)
  }
}
 
class ICacheReplacer(implicit p: Parameters) extends NSModule {
  
  val cacheParams = p(ICacheKey)
  import cacheParams._
  
  val io = IO(new Bundle {
    val touch = new Bundle {
      val valid = Input(Bool())
      val idx@@   = Input(UInt(idxBits.W))
      val way   = Input(UInt(wayBits.W))
    }
    
    val victim = new Bundle {
      val req  = Input(Bool())
      val idx  = Input(UInt(idxBits.W))
      val resp = Output(UInt(wayBits.W))
    }
  })
  
  // 简化版PLRU实现
  // 实际应该使用更复杂的PLRU树
  val plruTree = SyncReadMem(nSets, UInt((nWays - 1).W))
  
  when(io.touch.valid) {
    // 更新PLRU状态 (简化版)
    val current = plruTree.read(io.touch.idx)
    plruTree.write(io.touch.idx, current + 1.U)
  }
  
  // 获取替换路 (简化版：轮流替换)
  val victimCounter = RegInit(0.U(wayBits.W))
  when(io.victim.req) {
    victimCounter := victimCounter + 1.U
  }
  
  io.victim.resp := victimCounter
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 