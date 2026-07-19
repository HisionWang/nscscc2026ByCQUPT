package nscscc.icache

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config.NSModule
class ICacheReplacer(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    val touch  = Flipped(new victimChange)
    val victim = Flipped(new victimRead)
    val flush  = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
    }
  })
  
  // === 用 RegInit(Vec) 替代 SyncReadMem，上电自动全 0 ===
  val plruTree = RegInit(VecInit(Seq.fill(nSets)(0.U(3.W))))
  
  // === PLRU更新逻辑（不变）===
  def updatePLRU(oldPLRU: UInt, way: UInt): UInt = {
    val newPLRU = Wire(UInt(3.W))
    newPLRU := 0.U
    switch(way) {
      is(0.U) { newPLRU := Cat(oldPLRU(2), 1.U(1.W), 1.U(1.W)) }
      is(1.U) { newPLRU := Cat(oldPLRU(2), 0.U(1.W), 1.U(1.W)) }
      is(2.U) { newPLRU := Cat(1.U(1.W), oldPLRU(1), 0.U(1.W)) }
      is(3.U) { newPLRU := Cat(0.U(1.W), oldPLRU(1), 0.U(1.W)) }
    }
    newPLRU
  }
  
  // === Victim选择逻辑（不变）===
  def getVictim(plru: UInt): UInt = {
    val plru0 = plru(0)
    val plru1 = plru(1)
    val plru2 = plru(2)
    Mux(!plru0, Mux(!plru1, 0.U, 1.U), Mux(!plru2, 2.U, 3.U))
  }
  
  // === Touch：同步写 ===
  when(io.touch.valid) {
    plruTree(io.touch.idx) := updatePLRU(plruTree(io.touch.idx), io.touch.way)
  }
  
  // === Victim选择：同步读 ===
  val victimRespReg = RegInit(0.U(wayBits.W))
  when(io.victim.req) {
    victimRespReg := getVictim(plruTree(io.victim.idx))
  }
  io.victim.resp := victimRespReg
  
  // === Flush ===
  when(io.flush.valid) {
    plruTree(io.flush.idx) := 0.U
  }
}