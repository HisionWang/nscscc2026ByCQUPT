 
import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
import ICacheBunble._
class ICacheReplacer(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    // Hit时更新替换状态
    val touch = Flipped(new victimChange)
    
    // Miss时获取victim way
    val victim = Flipped(new victimRead)
    
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
    newPLRU := 0.U
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