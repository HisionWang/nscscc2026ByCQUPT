package nscscc.frontend.icache
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config.NSModule
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  Cache 替换策略模块（ICache / DCache 共用）
 *
 *  根据 nWays 自动选择最优算法：
 *    nWays = 2 → 1-bit 真 LRU  （每 set 1 bit，记录最近访问路号）
 *    nWays = 4 → 3-bit PLRU 树 （每 set 3 bit，伪二叉树择路）
 * ═══════════════════════════════════════════════════════════════
 */
class CacheReplacer(implicit p: Parameters) extends NSModule {
  
  val io = IO(new Bundle {
    val touch  = Flipped(new victimChange)
    val victim = Flipped(new victimRead)
    val flush  = new Bundle {
      val valid = Input(Bool())
      val idx   = Input(UInt(idxBits.W))
    }
  })
  
  // Victim read is intentionally split into two stages:
  // 1) latch req/idx, 2) read replacement state combinationally from the
  //    registered index so the response is still available in the next cycle.
  val victimReqReg = RegInit(false.B)
  val victimIdxReg = RegInit(0.U(idxBits.W))
  val victimResp = WireDefault(0.U(wayBits.W))

  victimReqReg := io.victim.req
  when(io.victim.req) {
    victimIdxReg := io.victim.idx
  }
  
  if (nWays == 2) {
    // ════════════════════════════════════════════════════════
    //  2路组相联：1-bit 真 LRU
    //
    //  原理：2路只有两种状态，1 bit 即可完美记录"最近使用"关系
    //    bit = 0 → way0 最近访问，victim = way1
    //    bit = 1 → way1 最近访问，victim = way0
    //
    //  优势：最简硬件、零判断误差（2路下 PLRU ≡ 真 LRU）
    // ════════════════════════════════════════════════════════
    val lastUsed = RegInit(VecInit(Seq.fill(nSets)(0.U(1.W))))
    
    // Touch：记录刚访问的路号
    when(io.touch.valid) {
      lastUsed(io.touch.idx) := io.touch.way   // way 是 0 或 1，直接写入
    }
    
    // Victim：选"非最近使用"的路
    victimResp := ~lastUsed(victimIdxReg) // ~0 = 1, ~1 = 0，即"另一路"
    
    // Flush：重置为 0（默认 victim = way1）
    when(io.flush.valid) {
      lastUsed(io.flush.idx) := 0.U(1.W)
    }
    
  } else if (nWays == 4) {
    // ════════════════════════════════════════════════════════
    //  4路组相联：3-bit PLRU 伪二叉树
    //
    //  树结构：        bit0
    //               /      \
    //           bit1        bit2
    //          /    \      /    \
    //        way0  way1  way2  way3
    //
    //  bit=0 指向左子树更近，bit=1 指向右子树更近
    //  victim = 沿着 bit 指向的"更远"方向走到叶节点
    // ════════════════════════════════════════════════════════
    val plruTree = RegInit(VecInit(Seq.fill(nSets)(0.U(3.W))))
    
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
    
    def getVictim(plru: UInt): UInt = {
      val plru0 = plru(0)
      val plru1 = plru(1)
      val plru2 = plru(2)
      Mux(!plru0, Mux(!plru1, 0.U, 1.U), Mux(!plru2, 2.U, 3.U))
    }
    
    when(io.touch.valid) {
      plruTree(io.touch.idx) := updatePLRU(plruTree(io.touch.idx), io.touch.way)
    }
    
    victimResp := getVictim(plruTree(victimIdxReg))
    
    when(io.flush.valid) {
      plruTree(io.flush.idx) := 0.U
    }
  }
  
  io.victim.resp := victimResp //Mux(victimReqReg, victimResp, 0.U)
}