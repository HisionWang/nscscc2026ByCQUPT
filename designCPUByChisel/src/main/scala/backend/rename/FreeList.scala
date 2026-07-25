// designCPUByChisel/src/main/scala/backend/rename/FreeList.scala
package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  空闲物理寄存器列表（FreeList）—— 重构版
 * ═══════════════════════════════════════════════════════════════
 *
 *  【关键改动】
 *  1. 快照索引从 brTag 改为 snptId，与 RAT/SnapshotManager 统一
 *  2. allocsAfterBr 按统一的 snptId 索引，由 SnapshotManager 控制无效化
 *  3. 误预测恢复时归还 allocsAfterBr(recoverId)，并从所有更老槽位中移除已归还的寄存器
 *  4. 显式的无效化处理：被释放的槽位清零 allocsAfterBr
 *
 *  【预缓存与恢复的交互】
 *    预缓存 (regIndices/regValid) 在恢复时不需要特殊处理：
 *    - 已分配且被消耗的寄存器：在 allocsAfterBr 中，会被归还
 *    - 已预缓存但未消耗的寄存器：仍然是空闲的，可被正确路径使用
 *    - 归还的寄存器加回位图后，下一周期预缓存会自动从新位图补充
 */
class FreeList(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    // ── 分配侧 ──
    val allocReqs   = Input(Vec(CtrlBlockWidth, Bool()))
    val allocPdest  = Vec(CtrlBlockWidth, Valid(UInt(PhyRegIdxWidth.W)))
    val canAlloc    = Output(Bool())
    val doAlloc     = Input(Bool())
 
    // ── 释放侧（ROB 提交）──
    val deallocReqs = Input(Vec(CommitWidth, Valid(UInt(PhyRegIdxWidth.W))))
 
    // ── 快照保存（来自 SnapshotManager）──
    val snptSave      = Input(Vec(CtrlBlockWidth, Valid(UInt(log2Ceil(SnapshotNum).W))))
 
    // ── 快照恢复（来自 SnapshotManager）──
    val doRecover     = Input(Bool())
    val recoverId     = Input(UInt(log2Ceil(SnapshotNum).W))
 
    // ── 快照无效化（来自 SnapshotManager）──
    val snptInvalidate = Input(Vec(SnapshotNum, Bool()))
 
    // ── 全局冲刷 ──
    //val flush         = Input(Bool())
  })
 
  // ================================================================
  //  1. 核心位图：bit[i]=1 表示 pi 空闲，p0 恒不空闲
  // ================================================================
  val initMask = (~0xffffffffL.U(IntPhyRegs.W)).asUInt
  val freeList = RegInit(UInt(IntPhyRegs.W), initMask)
 
  // ================================================================
  //  2. 快照：allocsAfterBr(snptId) = 该快照之后分配的寄存器 OH 集合
  // ================================================================
  val allocsAfterBr = RegInit(VecInit(Seq.fill(SnapshotNum)(0.U(IntPhyRegs.W))))
 
  // ================================================================
  //  3. 迭代 mask 分配候选（组合逻辑，不变）
  // ================================================================
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
 
  // ================================================================
  //  4. 预缓存机制（不变）
  // ================================================================
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
 
  // ================================================================
  //  5. 分配结果输出（不变）
  // ================================================================
  io.canAlloc := VecInit(
    (io.allocReqs zip regValid).map { case (req, v) => !req || v }
  ).asUInt.andR
 
  (io.allocPdest zip regValid zip regIndices).foreach {
    case ((port, v), idx) =>
      port.valid := v
      port.bits  := idx
  }
 
  // ================================================================
  //  6. allocMasks：前缀扫描（不变，但用途更清晰）
  //
  //  allocOHs(i) = 通道 i 预缓存寄存器的 OH
  //  allocMasks(k) = 通道 k 及之后所有通道分配集合的并集
  //  allocMasks(CtrlBlockWidth) = 0
  //
  //  用途：
  //    新快照在通道 k 初始化时 → allocsAfterBr = allocMasks(k+1)
  //      （该分支之后、同周期内的分配）
  //    非匹配槽位累积 → | allocMasks(0)（本周期所有新分配）
  // ================================================================
  val allocOHs = regIndices.map(UIntToOH(_)(IntPhyRegs - 1, 0))
 
  val allocMasks = (allocOHs zip io.allocReqs).scanRight(0.U(IntPhyRegs.W)) {
    case ((oh, req), acc) =>
      Mux(req && io.doAlloc, oh | acc, acc)
  }
  // allocMasks(0) = 全部通道分配的并集
  // allocMasks(k+1) = 通道 k+1 及之后的并集（即通道 k 之后的分配）
 
  // ================================================================
  //  7. 误预测恢复：计算需要归还的寄存器集合
  //    recoverDeallocs = allocsAfterBr(recoverId)
  //    这些寄存器是在该分支之后分配的，误预测时应全部归还
  // ================================================================
  val recoverDeallocs = Mux(io.doRecover, allocsAfterBr(io.recoverId), 0.U(IntPhyRegs.W))
 
  // 提交时释放的旧物理寄存器
  val commitDeallocMask = io.deallocReqs.map { d =>
    Mux(d.valid, UIntToOH(d.bits)(IntPhyRegs - 1, 0), 0.U(IntPhyRegs.W))
  }.reduce(_ | _)
 
  val deallocMask = commitDeallocMask | recoverDeallocs
 
  // ================================================================
  //  8. 更新 allocsAfterBr
  //
  //  三种情况（按优先级从高到低）：
  //    (a) 槽位被无效化 → 清零
  //    (b) 新快照分配到该槽位 → 初始化为该分支之后的分配集合
  //    (c) 正常累积 → 添加本周期新分配，移除已归还的寄存器
  //
  //  关于 (c) 中 & (~recoverDeallocs)：
  //    误预测归还的寄存器必须从所有更老的有效槽位中移除，
  //    否则后续更老分支误预测时会双重归还。
  //    例：slot0={p40,p42}, slot1={p42}，slot1 误预测归还 p42，
  //    若不从 slot0 移除 p42，后续 slot0 误预测会再次归还 p42。
  // ================================================================
  for (i <- 0 until SnapshotNum) {
    // 检查是否有通道在本槽位分配新快照
    val matchVec = VecInit((0 until CtrlBlockWidth).map(j =>
      io.snptSave(j).valid && io.snptSave(j).bits === i.U
    )).asUInt
 
    when(io.snptInvalidate(i)) {
      // (a) 槽位被无效化：清零
      allocsAfterBr(i) := 0.U
 
    }.elsewhen(matchVec.orR) {
      // (b) 新快照分配：初始化为该分支之后的分配集合
      //     使用 Mux1H 选择对应通道的 allocMasks
      //     通道 j 的快照 → allocsAfterBr = allocMasks(j+1)
      //     即该分支之后（不含自身）的同周期分配
      allocsAfterBr(i) := Mux1H(matchVec,
        (0 until CtrlBlockWidth).map(j => allocMasks(j + 1))
      )
 
    }.otherwise {
      // (c) 正常累积：添加本周期新分配，移除已归还寄存器
      allocsAfterBr(i) := (allocsAfterBr(i) & (~recoverDeallocs).asUInt) | allocMasks.head
    }
  }
 
  // ================================================================
  //  9. 更新 freeList 位图
  //    新 freeList = 旧 freeList
  //              - 本周期预缓存消耗的（selMask）
  //              + 本周期释放的（deallocMask = 提交 + 误预测归还）
  //    注意：恢复时归还的寄存器通过 deallocMask 加回位图，
  //    预缓存在下一周期会自动从新位图补充候选，无需特殊处理
  // ================================================================
  //when(io.flush) {
  //  // 全局冲刷：等待外部根据架构表逐步归还
  //  freeList := freeList
  //}.otherwise {
    freeList := ((freeList & (~selMask).asUInt) | deallocMask) & (~1.U(IntPhyRegs.W)).asUInt
  //}
}
