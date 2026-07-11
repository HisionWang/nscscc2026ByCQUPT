// designCPUByChisel/src/main/scala/backend/rename/SnapshotManager.scala
package nscscc.backend.rename
 
import chisel3._
import chisel3.util._
import nscscc.config._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  快照管理单元（SnapshotManager）
 * ═══════════════════════════════════════════════════════════════
 *
 *  【职责】
 *    统一管理 RAT 和 FreeList 的快照槽位分配与释放。
 *    RAT 与 FreeList 的快照槽位一一对应，由本模块统一编号。
 *
 *  【核心数据结构】
 *    valids:  槽位有效位
 *    younger: 年龄矩阵，younger(i)(j)=1 表示槽位 j 比槽位 i 更年轻
 *             误预测时，根据此矩阵一次性释放所有更年轻的槽位
 *
 *  【分配规则】
 *    每条需要快照的指令分配唯一的 snptId（= 槽位编号）。
 *    若剩余空间不足，阻塞流水线（allocOk=false）。
 *
 *  【释放规则】
 *    - 分支正确预测：仅释放该槽位
 *    - 分支误预测：释放该槽位 + 所有更年轻槽位（年龄矩阵查找）
 *      同时输出恢复信号 doRecover + recoverId
 */
class SnapshotManager(implicit p: Parameters) extends NSModule with HasCoreParameters {
 
  val io = IO(new Bundle {
    // ── 分配请求（来自 RenameStage）──
    val doAllocReqs   = Input(Vec(CtrlBlockWidth, Bool()))   // 每条通道是否需要快照
    val allocReqs   = Input(Vec(CtrlBlockWidth, Bool()))   // 每条通道是否需要快照
    val allocOk     = Output(Bool())                       // 剩余空间是否足够
    val allocIds    = Output(Vec(CtrlBlockWidth, Valid(UInt(log2Ceil(SnapshotNum).W))))
    val remaining   = Output(UInt(log2Ceil(SnapshotNum + 1).W))
 
    // ── 分支解析（来自后端 BRU/ROB）──
    val resolve     = Flipped(Valid(new SnapshotResolveInfo))
    // 异常重定向时清完
    val resolveAllSs = Input(Bool())
 
    // ── 恢复/无效化信号（输出到 RAT 和 FreeList）──
    val doRecover       = Output(Bool())                     // 误预测恢复
    val recoverId       = Output(UInt(log2Ceil(SnapshotNum).W))
    val invalidateSlots = Output(Vec(SnapshotNum, Bool()))   // 本周期需要无效化的所有槽位
  })
 
  // ================================================================
  //  1. 槽位有效位
  // ================================================================
  val valids = RegInit(VecInit.fill(SnapshotNum)(false.B))
 
  // ================================================================
  //  2. 年龄矩阵
  //    younger(i)(j) = true 表示槽位 j 比 i 更年轻（在 i 之后分配）
  //    当槽位 i 发生误预测时，所有 younger(i)(j)=true 的 j 都应被释放
  // ================================================================
  val younger = RegInit(VecInit(Seq.fill(SnapshotNum)(
    VecInit(Seq.fill(SnapshotNum)(false.B))
  )))
 
  // ================================================================
  //  3. 容量统计
  // ================================================================
  val validCount = PopCount(valids)
  io.remaining := SnapshotNum.U - validCount
 
  val allocCount = PopCount(io.allocReqs)
  // 保守策略：使用旧 valids 计算剩余空间，本周期释放的槽位下周期才可用
  io.allocOk := (allocCount <= (SnapshotNum.U - validCount))
 
  // ================================================================
  //  4. 空闲槽位查找（优先编码，为每个可能的分配序号预计算）
  // ================================================================
  val snapFreeMask = VecInit((0 until SnapshotNum).map(i => !valids(i))).asUInt
  dontTouch(snapFreeMask)
  // allocSlotId(k) = 第 k 个空闲槽位的编号
  val allocSlotId = Wire(Vec(CtrlBlockWidth, UInt(log2Ceil(SnapshotNum).W)))
  var search = snapFreeMask
  for (k <- 0 until CtrlBlockWidth) {
    val sel = PriorityEncoderOH(search)
    allocSlotId(k) := OHToUInt(sel)
    search = search & (~sel).asUInt
  }
 
  // 为每条通道计算前缀和，确定该通道应使用第几个空闲槽位
  val allocPrefixSum = Wire(Vec(CtrlBlockWidth + 1, UInt(log2Ceil(CtrlBlockWidth + 1).W)))
  allocPrefixSum(0) := 0.U
  for (i <- 0 until CtrlBlockWidth) {
    allocPrefixSum(i + 1) := allocPrefixSum(i) + io.doAllocReqs(i).asUInt
  }
 
  // 输出：每条通道分配到的 snptId
  for (i <- 0 until CtrlBlockWidth) {
    io.allocIds(i).valid := io.doAllocReqs(i) && io.allocOk
    io.allocIds(i).bits  := allocSlotId(allocPrefixSum(i))
  }
 
  // ================================================================
  //  5. 分支解析：计算需要无效化的槽位
  // ================================================================
  val resolveValid = io.resolve.valid
  val resolveId    = io.resolve.bits.snptId
  val resolveMis   = io.resolve.bits.isMispredict
 
  // 若解析的槽位已经无效（可能被更早的误预测释放了），忽略此次解析
  val resolveSlotValid = valids(resolveId)
 
  val shouldInvalidate = Wire(Vec(SnapshotNum, Bool()))
  for (i <- 0 until SnapshotNum) {
    shouldInvalidate(i) :=  (resolveSlotValid && resolveValid &&  
          // 误预测：释放自己 + 所有更年轻的槽位
          ((resolveMis && (i.U === resolveId || younger(resolveId)(i))) ||
          // 正确预测：仅释放自己
           (!resolveMis && i.U === resolveId))) || io.resolveAllSs
        

    
  }
 
  io.invalidateSlots := shouldInvalidate
  io.doRecover       := resolveValid && resolveMis && resolveSlotValid //这是恢复物理寄存器的
  io.recoverId       := resolveId
 
  // ================================================================
  //  6. 更新 valids 和年龄矩阵
  //    策略：先计算释放后的状态，再叠加分配
  // ================================================================
 
  // 6-1. 释放后的 valids
  val validsAfterInv = Wire(Vec(SnapshotNum, Bool()))
  for (i <- 0 until SnapshotNum) {
    validsAfterInv(i) := valids(i) && !shouldInvalidate(i)
  }
 
  // 6-2. 释放后的年龄矩阵（清除被释放槽位的所有行和列）
  val youngerAfterInv = Wire(Vec(SnapshotNum, Vec(SnapshotNum, Bool())))
  for (i <- 0 until SnapshotNum) {
    for (j <- 0 until SnapshotNum) {
      youngerAfterInv(i)(j) := Mux(
        shouldInvalidate(i) || shouldInvalidate(j),
        false.B,
        younger(i)(j)
      )
    }
  }
 
  // 6-3. 最终状态（叠加分配）
  val finalValids  = WireInit(validsAfterInv)
  val finalYounger = WireInit(youngerAfterInv)
 
  for (i <- 0 until CtrlBlockWidth) {
    when(io.doAllocReqs(i) && io.allocOk) {
      val newSlot = allocSlotId(allocPrefixSum(i))
 
      // 标记新槽位为有效
      finalValids(newSlot) := true.B
 
      // 新槽位比所有当前有效的旧槽位都年轻
      for (j <- 0 until SnapshotNum) {
        when(validsAfterInv(j) && j.U =/= newSlot) {
          finalYounger(j)(newSlot) := true.B
        }
      }
 
      // 同周期分配的先后排序：后分配的比先分配的更年轻
      for (k <- 0 until i) {
        when(io.doAllocReqs(k) && io.allocOk) {
          val prevSlot = allocSlotId(allocPrefixSum(k))
          finalYounger(prevSlot)(newSlot) := true.B
        }
      }
    }
  }
 
  // 6-4. 写回寄存器
  valids  := finalValids
  younger := finalYounger
}