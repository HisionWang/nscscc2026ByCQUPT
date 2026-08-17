package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
class FreeList(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    val allocReqs   = Input(Vec(CtrlBlockWidth, Bool()))
    val allocPdest  = Vec(CtrlBlockWidth, Valid(UInt(PhyRegIdxWidth.W)))
    val canAlloc    = Output(Bool())
    val doAlloc     = Input(Bool())
 
    val deallocReqs = Input(Vec(CommitWidth, Valid(UInt(PhyRegIdxWidth.W))))
 
    val snptSave      = Input(Vec(CtrlBlockWidth, Valid(UInt(log2Ceil(SnapshotNum).W))))
 
    val doRecover     = Input(Bool())
    val recoverId     = Input(UInt(log2Ceil(SnapshotNum).W))
 
    val snptInvalidate = Input(Vec(SnapshotNum, Bool()))
  })
 
  val initMask = (~0xffffffffL.U(IntPhyRegs.W)).asUInt
  val freeList = RegInit(UInt(IntPhyRegs.W), initMask)
 
  val allocsAfterBr = RegInit(VecInit(Seq.fill(SnapshotNum)(0.U(IntPhyRegs.W))))
 
  val selPregs      = Wire(Vec(CtrlBlockWidth, UInt(IntPhyRegs.W)))
  val selPregsUint      = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(IntPhyRegs).W) )) 
  val selPregsValid = VecInit(selPregs.map(_.orR))
 
  var iterMask = freeList
  for (i <- 0 until CtrlBlockWidth) {
    selPregs(i) := PriorityEncoderOH(iterMask)
    
    iterMask = iterMask & (~selPregs(i)).asUInt
  }

  for (i <- 0 until CtrlBlockWidth) {
    selPregsUint(i) := OHToUInt(selPregs(i))
  }
  diffDontTouch(selPregsUint)
 
  val regValid   = Seq.fill(CtrlBlockWidth)(RegInit(false.B))
  val regIndices = Seq.fill(CtrlBlockWidth)(RegInit(0.U(PhyRegIdxWidth.W)))
 
  val selPregFire = VecInit(
    (selPregsValid zip regValid zip io.allocReqs).map {
      case ((sv, rv), req) =>
        (!rv || (req && io.doAlloc)) && sv
    }
  )
 
  (regValid zip selPregsValid zip io.allocReqs).foreach {
    case ((rv, sv), req) =>
      rv := sv || (rv && !req)
  }
 
  (regIndices zip selPregs zip selPregFire).foreach {
    case ((ri, sp), fire) =>
      when(fire) { ri := OHToUInt(sp) }
  }
 
  val selMask = (selPregs zip selPregFire).map {
    case (sp, fire) => Mux(fire, sp, 0.U)
  }.reduce(_ | _)
 
  io.canAlloc := VecInit(
    (io.allocReqs zip regValid).map { case (req, v) => !req || v }
  ).asUInt.andR
 
  (io.allocPdest zip regValid zip regIndices).foreach {
    case ((port, v), idx) =>
      port.valid := v
      port.bits  := idx
  }
 
  val allocOHs = regIndices.map(UIntToOH(_)(IntPhyRegs - 1, 0))
 
  val allocMasks = (allocOHs zip io.allocReqs).scanRight(0.U(IntPhyRegs.W)) {
    case ((oh, req), acc) =>
      Mux(req, oh | acc, acc)
  }
 
  // ================================================================
  //  打一拍更新 allocsAfterBr 的逻辑（切断超长组合路径）
  // ================================================================
  // 将慢速路径的分配/保存请求打一拍
  val delayed_snptSave   = RegInit(VecInit(Seq.fill(CtrlBlockWidth)(0.U.asTypeOf(Valid(UInt(log2Ceil(SnapshotNum).W))))))
  val delayed_allocMasks = RegInit(VecInit(Seq.fill(CtrlBlockWidth + 1)(0.U(IntPhyRegs.W))))
  val delayed_doAlloc    = RegInit(false.B)

  delayed_snptSave   := io.snptSave
  delayed_allocMasks := allocMasks
  delayed_doAlloc    := io.doAlloc

  // 计算“带前推”的旁路快照状态 (将上一拍延迟的分配数据融合进当前状态，对组合逻辑直接可见)
  val allocsAfterBr_bypassed = Wire(Vec(SnapshotNum, UInt(IntPhyRegs.W)))
  for (i <- 0 until SnapshotNum) {
    val matchVec = VecInit((0 until CtrlBlockWidth).map(j =>
      delayed_snptSave(j).valid && delayed_snptSave(j).bits === i.U
    )).asUInt

    when(matchVec.orR) {
      allocsAfterBr_bypassed(i) := Mux1H(matchVec,
        (0 until CtrlBlockWidth).map(j => delayed_allocMasks(j + 1))
      )
    }.otherwise {
      val added = Mux(delayed_doAlloc, delayed_allocMasks.head, 0.U(IntPhyRegs.W))
      allocsAfterBr_bypassed(i) := allocsAfterBr(i) | added
    }
  }

  // 提取恢复用的寄存器掩码，使用旁路前推后的最新状态，避免漏恢复
  val recoverDeallocs = Mux(io.doRecover, allocsAfterBr_bypassed(io.recoverId), 0.U(IntPhyRegs.W))
 
  val commitDeallocMask = io.deallocReqs.map { d =>
    Mux(d.valid, UIntToOH(d.bits)(IntPhyRegs - 1, 0), 0.U(IntPhyRegs.W))
  }.reduce(_ | _)
 
  val deallocMask = commitDeallocMask | recoverDeallocs
 
  // 结合当拍的“冲刷”和“释放”操作，更新实际的 allocsAfterBr 寄存器
  for (i <- 0 until SnapshotNum) {
    when(io.snptInvalidate(i)) {
      allocsAfterBr(i) := 0.U
    }.otherwise {
      allocsAfterBr(i) := allocsAfterBr_bypassed(i) & (~recoverDeallocs).asUInt
    }
  }
 
  freeList := ((freeList & (~selMask).asUInt) | deallocMask) & (~1.U(IntPhyRegs.W)).asUInt
}