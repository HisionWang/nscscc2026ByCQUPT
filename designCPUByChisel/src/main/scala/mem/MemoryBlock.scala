package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.rename._
import nscscc.backend.execute._
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  Memory Block —— 内存子系统顶层模块
 * ═══════════════════════════════════════════════════════════════
 *
 *  接收：
 *    · lsEnq          —— Dispatch 的 LSQ 入队请求（LsEnqIO）
 *    · fromMemResult(0) —— 地址通道（Load 地址 + STA 地址，共享）
 *    · fromMemResult(1) —— 数据通道（STD 数据）
 *
 *  内部：
 *    · LoadQueue   —— Load 指令队列
 *    · StoreQueue  —— Store 指令队列
 *    · （未来）Store Buffer、DCache 接口、Forwarding、
 *      违例检测、MMIO 处理等
 *
 *  输出 enqPtr 供 Dispatch 读取，用于交叉引用填写 sqIdx / lqIdx。
 * ═══════════════════════════════════════════════════════════════
 */
class MemoryBlock(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    // ══════════════════════════════════════════════════
    //  Dispatch 入队接口（严格匹配 LsEnqIO 结构）
    // ══════════════════════════════════════════════════
    val lsEnq =  Flipped (new LsEnqIO)
        
    //    new Bundle {
    //  val req       = Flipped(Valid(new LsEnqEntry))
    //  val toLsqData = Flipped(new RenamedInst)
    //  val lqFull    = Output(Bool())
    //  val sqFull    = Output(Bool())
    //}
 
    // ══════════════════════════════════════════════════
    //  执行单元写回接口
    //    fromMemResult(0) = 地址通道（Load + STA）
    //    fromMemResult(1) = 数据通道（STD）
    // ══════════════════════════════════════════════════
    val fromMemResult = Vec(2, Flipped(Decoupled(new ExeResult)))
 
    // ══════════════════════════════════════════════════
    //  EnqPtr 输出（供 Dispatch 读取，用于交叉引用）
    //    Dispatch 读 lqEnqPtr 填入 Store 的 lqIdx
    //    Dispatch 读 sqEnqPtr 填入 Load  的 sqIdx
    // ══════════════════════════════════════════════════
    val lqEnqPtr = Output(UInt(log2Ceil(LqSize).W))
    val sqEnqPtr = Output(UInt(log2Ceil(SqSize).W))
 
    // ══════════════════════════════════════════════════
    //  ROB 提交接口（预留）
    // ══════════════════════════════════════════════════
    val rob = new Bundle {
      val lcommit = Input(Bool())
      val scommit = Input(Bool())
      val robIdx  = Input(UInt(log2Ceil(RobSize).W))
    }
 
    // ══════════════════════════════════════════════════
    //  重定向接口（预留）
    // ══════════════════════════════════════════════════
    val redirect = Flipped(Valid(new Bundle {
      val robIdx = UInt(log2Ceil(RobSize).W)
    }))
 
    // ══════════════════════════════════════════════════
    //  DCache / SBuffer / Forwarding / MMIO（预留）
    // ══════════════════════════════════════════════════
    // TODO: val dcache  = ...
    // TODO: val sbuffer = ...
    // TODO: val forward = ...
    // TODO: val uncache = ...
  })
 
  // ================================================================
  //  实例化 LoadQueue 和 StoreQueue
  // ================================================================
  val loadQueue  = Module(new LoadQueue)
  val storeQueue = Module(new StoreQueue)
 
  // ================================================================
  //  Dispatch 入队路由
  //
  //  · isLoad  → LQ 入队，sqIdx 取 LsEnqEntry.sqIdx（Dispatch 填写）
  //  · isStore → SQ 入队，lqIdx 取 LsEnqEntry.lqIdx（Dispatch 填写）
  //
  //  Dispatch 通过读取 lqEnqPtr / sqEnqPtr 来填写交叉引用：
  //    Load  的 sqIdx = 当前 sqEnqPtr
  //    Store 的 lqIdx = 当前 lqEnqPtr
  // ================================================================
 
  // ---- LQ 入队 ----
  loadQueue.io.enqValid  := io.lsEnq.req.valid && io.lsEnq.req.bits.isLoad
  loadQueue.io.enqRobIdx := io.lsEnq.req.bits.robIdx.value
  loadQueue.io.enqSqIdx  := io.lsEnq.req.bits.sqIdx.value
  loadQueue.io.enqPc     := io.lsEnq.toLsqData.pc
  loadQueue.io.enqPdst   := io.lsEnq.toLsqData.pdst
 
  // ---- SQ 入队 ----
  storeQueue.io.enqValid  := io.lsEnq.req.valid && io.lsEnq.req.bits.isStore
  storeQueue.io.enqRobIdx := io.lsEnq.req.bits.robIdx.value
  storeQueue.io.enqLqIdx  := io.lsEnq.req.bits.lqIdx.value
  storeQueue.io.enqPc     := io.lsEnq.toLsqData.pc
  storeQueue.io.enqPdst   := io.lsEnq.toLsqData.pdst
 
  // ---- Full 信号 ----
  io.lsEnq.lqFull := loadQueue.io.full
  io.lsEnq.sqFull := storeQueue.io.full
 
  // ---- EnqPtr 输出 ----
  io.lqEnqPtr := loadQueue.io.enqPtr
  io.sqEnqPtr := storeQueue.io.enqPtr
 
  // ================================================================
  //  执行单元写回路由
  //
  //  fromMemResult(0) 地址通道：
  //    · uop.ctrl.memRead → Load 地址写入 LQ
  //    · uop.isSta        → STA 地址写入 SQ
  //    两者互斥，同一周期只会出现一种
  //
  //  fromMemResult(1) 数据通道：
  //    · uop.isStd → STD 数据写入 SQ
  // ================================================================
 
  // ---- 地址通道 (fromMemResult(0)) ----
  val addrChannel = io.fromMemResult(0)
  val addrFire    = addrChannel.fire
  val addrUop     = addrChannel.bits.uop
 
  // 默认：不写
  loadQueue.io.addrWriteValid := false.B
  loadQueue.io.addrWriteIdx   := 0.U
  loadQueue.io.addrWriteVaddr := 0.U
 
  storeQueue.io.addrWriteValid := false.B
  storeQueue.io.addrWriteIdx   := 0.U
  storeQueue.io.addrWriteVaddr := 0.U
  storeQueue.io.addrWriteLsuOp := 0.U
 
  when(addrFire) {
    when(addrUop.ctrl.memRead) {
      // Load 地址 → LQ
      loadQueue.io.addrWriteValid := true.B
      loadQueue.io.addrWriteIdx   := addrUop.lqIdx.value
      loadQueue.io.addrWriteVaddr := addrChannel.bits.data
    } .elsewhen(addrUop.isSta) {
      // STA 地址 → SQ
      storeQueue.io.addrWriteValid := true.B
      storeQueue.io.addrWriteIdx   := addrUop.sqIdx.value
      storeQueue.io.addrWriteVaddr := addrChannel.bits.data
      storeQueue.io.addrWriteLsuOp := addrUop.ctrl.lsuOp
    }
  }
 
  // ---- 数据通道 (fromMemResult(1)) ----
  val dataChannel = io.fromMemResult(1)
  val dataFire    = dataChannel.fire
  val dataUop     = dataChannel.bits.uop
 
  storeQueue.io.dataWriteValid := false.B
  storeQueue.io.dataWriteIdx   := 0.U
  storeQueue.io.dataWriteData  := 0.U
 
  when(dataFire && dataUop.isStd) {
    storeQueue.io.dataWriteValid := true.B
    storeQueue.io.dataWriteIdx   := dataUop.sqIdx.value
    storeQueue.io.dataWriteData  := dataChannel.bits.data
  }
 
  // ---- Ready 信号：暂无条件接受 ----
  io.fromMemResult(0).ready := true.B
  io.fromMemResult(1).ready := true.B
 
  // ================================================================
  //  预留接口接线（暂不实现逻辑）
  // ================================================================
 
  // LQ 预留
  loadQueue.io.commitReady    := false.B
  loadQueue.io.redirectValid  := false.B
  loadQueue.io.redirectRobIdx := 0.U
 
  // SQ 预留
  storeQueue.io.commitReady    := false.B
  storeQueue.io.redirectValid  := false.B
  storeQueue.io.redirectRobIdx := 0.U
}