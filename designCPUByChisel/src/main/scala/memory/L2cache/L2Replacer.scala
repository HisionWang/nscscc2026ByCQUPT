package nscscc.mem.L2cache

import chisel3._
import chisel3.util._
import nscscc.config._

class L2Replacer(implicit p: Parameters) extends NSModule {
  require(l2Ways == 8, "L2Replacer V1 requires eight ways")

  val io = IO(new Bundle {
    val lookup = Input(new L2ReplacerLookup)
    val touch = Flipped(Valid(new L2ReplacerTouch))
    val victim = Output(UInt(l2WayBits.W))
  })

  // 每个 set 的 8 路二叉 PLRU 树只需要 7 位。
  val treeState = RegInit(VecInit(Seq.fill(l2Sets)(
    VecInit(Seq.fill(7)(false.B))
  )))
  val lookupTree = treeState(io.lookup.set)

  val victimHigh = lookupTree(0)
  val victimMiddle = Mux(lookupTree(0), lookupTree(2), lookupTree(1))
  val victimLow = Mux(
    lookupTree(0),
    Mux(lookupTree(2), lookupTree(6), lookupTree(5)),
    Mux(lookupTree(1), lookupTree(4), lookupTree(3))
  )
  val plruVictim = Cat(victimHigh, victimMiddle, victimLow)

  // 只要存在 invalid way，就优先选择最低编号 invalid way。
  val firstInvalid = PriorityEncoder(~io.lookup.validMask)
  io.victim := Mux(io.lookup.validMask.andR, plruVictim, firstInvalid)

  when(io.touch.valid) {
    val oldTree = treeState(io.touch.bits.set)
    val nextTree = WireInit(oldTree)
    val way = io.touch.bits.way

    when(!way(2)) {
      nextTree(0) := true.B
      when(!way(1)) {
        nextTree(1) := true.B
        nextTree(3) := !way(0)
      }.otherwise {
        nextTree(1) := false.B
        nextTree(4) := !way(0)
      }
    }.otherwise {
      nextTree(0) := false.B
      when(!way(1)) {
        nextTree(2) := true.B
        nextTree(5) := !way(0)
      }.otherwise {
        nextTree(2) := false.B
        nextTree(6) := !way(0)
      }
    }

    treeState(io.touch.bits.set) := nextTree
  }
}
