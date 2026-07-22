// FreeList IO 新增端口
class FreeListIO(implicit p: Parameters) extends NSBundle {
  // ... 原有端口保持不变 ...
  val allocReqs    = Vec(CtrlBlockWidth, Input(Bool()))
  val allocPdest   = Vec(CtrlBlockWidth, Output(Valid(UInt(PhyRegIdxWidth.W))))
  val canAlloc     = Output(Bool())
  val doAlloc      = Input(Bool())
  
  val deallocReqs  = Vec(CommitWidth, Input(Valid(UInt(PhyRegIdxWidth.W))))  // archCommit归还
  
  // ★ 新增：紧急归还端口（分发级/Buffer刷新直接归还）
  val urgentDealloc = Vec(CtrlBlockWidth * 2, Input(Valid(UInt(PhyRegIdxWidth.W))))
  
  // 快照相关端口保持不变
  val snptSave       = Input(Vec(CtrlBlockWidth, Valid(UInt(log2Ceil(SnapshotNum).W))))
  val doRecover      = Input(Bool())
  val recoverId      = Input(UInt(log2Ceil(SnapshotNum).W))
  val snptInvalidate = Input(Vec(SnapshotNum, Bool()))
}
 
// FreeList 内部逻辑修改：
// 在空闲列表的回写逻辑中，urgentDealloc 的优先级高于 deallocReqs
// 因为 urgentDealloc 是分发级/Buffer的刷新归还，需要立即生效以保证后续分配的正确性
 
// 具体修改：在freeList的空闲指针推进和回写逻辑中，将urgentDealloc的归还数量
// 累加到可用容量中。这需要在freeList内部增加对urgentDealloc的处理。
 
// ★ 关键：urgentDealloc归还的物理寄存器直接写入freeList的环形缓冲区，
// 优先级高于deallocReqs（archCommit），因为刷新归还必须立即生效

//由于 FreeList 的内部实现比较复杂（环形缓冲区 + 快照），具体的 urgentDealloc 处理逻辑需要在 FreeList 的空闲指针管理部分增加：

// 在 FreeList 内部（伪代码，需根据实际FreeList实现调整）：
 
// 统计 urgentDealloc 归还的数量
//val urgentDeallocCount = PopCount(io.urgentDealloc.map(_.valid))
// 
//// 统计 deallocReqs 归还的数量
//val deallocCount = PopCount(io.deallocReqs.map(_.valid))
 
// 空闲容量计算时需要考虑 urgentDealloc
// canAlloc 的判断需要确保有足够的空闲物理寄存器
// freeList的可用数量 = 基础可用数 + urgentDeallocCount + deallocCount（下一周期生效）
 
// urgentDealloc 的物理寄存器写入空闲列表的尾部
// 需要扩展写入端口或在一个周期内处理多个写入
//⚠ 注意：FreeList 的具体实现需要根据你的 
//FreeList.scala 原代码进行调整。关键原则是：

//urgentDealloc 的归还必须在当拍生效（因为后续分配可能立即需要这些寄存器）
//urgentDealloc 的优先级高于 deallocReqs（archCommit归还下一周期才生效也可以，但urgent必须当拍生效）
//如果 FreeList 使用快照机制，urgentDealloc 归还的寄存器也需要正确地反映在快照恢复后的状态中

