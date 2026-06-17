package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  空闲物理寄存器列表（FreeList）
 * ═══════════════════════════════════════════════════════════════
 *
 *  【参考】iFuCore FreeList.scala（位图式，带分支快照）
 *
 *  【核心数据结构】
 *    freeList: UInt(IntPhyRegs.W)
 *      位图，bit[i]=1 表示物理寄存器 pi 空闲可分配
 *      p0 永远不参与分配（bit0 恒为 0，对应 r0 恒零）
 *
 *  【分配策略：迭代 mask + 预缓存】（iFuCore 风格）
 *    · 使用迭代 mask 依次为各通道找最低空闲位（独热码）
 *    · regIndices/regValid 缓存已找好的候选，避免关键路径上有全位图扫描
 *    · 每周期只要缓存被消耗（req=true）或为空，就从位图补充新候选
 *
 *  【分支快照：allocsAfterBr】（iFuCore 风格）
 *    · allocsAfterBr(brTag)：自该分支之后被分配出去的寄存器 OH 集合
 *    · 误预测时：把 allocsAfterBr(errBrTag) 中的寄存器全部归还 freeList
 *    · O(1) 恢复，不需要逐条回退
 * ═══════════════════════════════════════════════════════════════
 */
class FreeList(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    val allocReqs   = Input(Vec(CtrlBlockWidth, Bool()))
    val allocPdest  = Vec(CtrlBlockWidth, Valid(UInt(PhyRegIdxWidth.W)))
    val canAlloc    = Output(Bool())
    val doAlloc     = Input(Bool())
  
    // ── 释放侧（ROB 提交） ──
    val deallocReqs = Input(Vec(CommitWidth, Valid(UInt(PhyRegIdxWidth.W))))
  
    // ── 分支快照相关 ──
    val renBrTags   = Input(Vec(CtrlBlockWidth, Valid(UInt(log2Ceil(SnapshotNum).W))))
    val brMispredict = Input(Bool())
    val brMispredTag = Input(UInt(log2Ceil(SnapshotNum).W))
  
    // ── 全局冲刷 ──
    val flush       = Input(Bool())
  })
 
  // ================================================================
  //  1. 核心位图：初始时 p0~p31 非空闲（分配给 x0~x31），其余全空闲
  //  使用 0xFFFFFFFFL 掩盖低 32 位，取反后即低 32 位为 0，高位为 1
  // ================================================================
  val initMask = (~0xffffffffL.U(IntPhyRegs.W)).asUInt
  val freeList = RegInit(UInt(IntPhyRegs.W), initMask)
 
  // ================================================================
  //  2. 分支快照：记录每个 brTag 之后分配出去的寄存器集合
  // ================================================================
  //val allocsAfterBr = Reg(Vec(SnapshotNum, UInt(IntPhyRegs.W)))
  val allocsAfterBr = RegInit(VecInit(Seq.fill(SnapshotNum)(0.U(IntPhyRegs.W))))
 
  // ================================================================
  //  3. 迭代 mask 分配候选（组合逻辑）
  //  通道 0 从 freeList 找最低空闲位
  //  通道 1 从 freeList & ~selPregs(0) 找，以此类推
  // ================================================================
  val selPregs      = Wire(Vec(CtrlBlockWidth, UInt(IntPhyRegs.W)))
  val selPregsValid = VecInit(selPregs.map(_.orR))
 
  var iterMask = freeList
  for (i <- 0 until CtrlBlockWidth) {
    selPregs(i) := PriorityEncoderOH(iterMask)
    iterMask = iterMask & (~selPregs(i)).asUInt
  }
 
  // ================================================================
  //  4. 预缓存机制：避免关键路径上有组合逻辑链
  // ================================================================
  val regValid  = Seq.fill(CtrlBlockWidth)(RegInit(false.B))
  val regIndices = Seq.fill(CtrlBlockWidth)(Reg(UInt(PhyRegIdxWidth.W)))
 
  // selPregFire(i)：第 i 通道是否需要补充新候选
  val selPregFire = VecInit(
    (selPregsValid zip regValid zip io.allocReqs).map {
      case ((selPregsValid, regValid), req) =>
        (!regValid || (req && io.doAlloc)) && selPregsValid
    }
  )
 
  // 更新缓存有效性
  (regValid zip selPregsValid zip io.allocReqs).foreach {
    case ((regValid, selPregsValid), req) =>
      regValid := selPregsValid || (regValid && !req)
      // 新选 OR 保持原值
  }
 
  // 补充新候选
  (regIndices zip selPregs zip selPregFire).foreach {
    case ((regIndices, selPreg), selPregFire) =>
      when(selPregFire) { regIndices := OHToUInt(selPreg) }
  }

  //更新候选的freeList
  val selMask = (selPregs zip selPregFire).map {
    case (selPregs, selPregFire) => Mux(selPregFire, selPregs, 0.U)
  }.reduce(_ | _)
 
  // ================================================================
  //  5. 分配结果输出
  //  canAlloc：所有有分配请求的通道都有有效候选
  // ================================================================
  io.canAlloc := VecInit(
    (io.allocReqs zip regValid).map { case (req, valid) => !req || valid }
  ).asUInt.andR
 
  (io.allocPdest zip regValid zip regIndices).foreach {
    case ((port, valid), idx) =>
      port.valid := valid
      port.bits  := idx
  }
 
  // ================================================================
  //  6. allocsAfterBr 维护（iFuCore 原版逻辑）
  //
  //  allocOHs(i): 第 i 通道分配出去的寄存器 OH
  //  allocMasks:  前缀 OR 扫描，allocMasks(k) = 前 k 个通道分配集合的并集
  //  当通道 i 携带 brTag 时，用 allocMasks(i+1) 初始化 allocsAfterBr(brTag)
  //  其他槽位保持原值 + 新增分配 - 误预测归还
  // ================================================================
  val allocOHs = regIndices.map(UIntToOH(_)(IntPhyRegs - 1, 0))
  // scanRight：allocMasks(0) = 所有通道的并集，allocMasks(CtrlBlockWidth) = 0
  val allocMasks = (allocOHs zip io.allocReqs).scanRight(0.U(IntPhyRegs.W)) {
    case ((oh, req), acc) =>
      Mux(req && io.doAlloc, oh | acc, acc)
  }
 
  // 误预测归还：把 allocsAfterBr(errBrTag) 中的寄存器全部释放
  val brDeallocs = Mux(
    io.brMispredict,
    allocsAfterBr(io.brMispredTag),
    0.U(IntPhyRegs.W)
  )
 
  // 提交时释放的旧物理寄存器
  val commitDeallocMask = io.deallocReqs.map { d =>
    Mux(d.valid, UIntToOH(d.bits)(IntPhyRegs - 1, 0), 0.U(IntPhyRegs.W))
  }.reduce(_ | _)
 
  val deallocMask = commitDeallocMask | brDeallocs
 
  // 本周期实际消耗的寄存器掩码

 
  // 更新 allocsAfterBr
  for (i <- 0 until SnapshotNum) {
    val matchVec = VecInit(io.renBrTags.map(t => t.valid && t.bits === i.U)).asUInt
    allocsAfterBr(i) := Mux(
      matchVec.orR,
      // 该分支之后（含该分支所在通道之后）的分配集合
      // allocMasks 下标 k 对应"前 k 个通道分配集合"，reverse 后 Mux1H
      Mux1H(matchVec, allocMasks.slice(1, CtrlBlockWidth + 1).toSeq),
      // 保持原值 + 新分配 - 误预测归还
      (allocsAfterBr(i) & (~brDeallocs).asUInt) | allocMasks.head
    )
  }
 
  // ================================================================
  //  7. 更新 freeList 位图
  //  新 freeList = 旧 freeList
  //              - 本周期预缓存消耗的（selMask）
  //              + 本周期释放的（deallocMask）
  //              & ~bit0（p0 永不空闲）
  // ================================================================
  when(io.flush) {
    // 全局冲刷：释放所有非架构映射的物理寄存器
    // 具体回收逻辑由外部根据架构表重建，这里简单保留当前状态
    // 实际项目中应由 ROB 在 flush 时将所有飞行中指令的 pdst 归还
    freeList := freeList  // 保持，等待外部逐步归还
  }.otherwise {
    freeList := ((freeList & (~selMask).asUInt) | deallocMask) & (~1.U(IntPhyRegs.W)).asUInt
  }
}