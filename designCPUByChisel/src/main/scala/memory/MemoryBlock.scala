package nscscc.mem
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.execute._
import nscscc.mmu._
 
class MemoryBlock(implicit p: Parameters) extends NSModule {
 
  val io = IO(new Bundle {
    // ══════════════════════════════════════════
    //  Dispatch 入队
    // ══════════════════════════════════════════
    val lsEnq = new Bundle {
      val req       = Flipped(Valid(new LsEnqEntry))
      val toLsqData = Flipped(new RenamedInst)
      val lqFull    = Output(Bool())
      val sqFull    = Output(Bool())
    }
 
    // ══════════════════════════════════════════
    //  执行单元写回
    // ══════════════════════════════════════════
    val fromExeResult = Vec(2, Flipped(Decoupled(new ExeResult)))
 
    // ══════════════════════════════════════════
    //  后端写回输出
    // ══════════════════════════════════════════
    val toWbResult = Vec(2, Decoupled(new ExeResult))
 
    // ══════════════════════════════════════════
    //  EnqPtr 输出
    // ══════════════════════════════════════════
    val lqEnqPtr = Output(UInt(log2Ceil(LqSize).W))
    val sqEnqPtr = Output(UInt(log2Ceil(SqSize).W))
 
    // ══════════════════════════════════════════
    //  DCache 接口
    // ══════════════════════════════════════════
    //val dcacheLqReq  = Decoupled(new Bundle {
    //  val lqIdx = UInt(log2Ceil(LqSize).W)
    //  val vaddr = UInt(XLEN.W)
    //})
    //val dcacheLqResp = Flipped(Decoupled(new Bundle {
    //  val lqIdx   = UInt(log2Ceil(LqSize).W)
    //  val data    = UInt(XLEN.W)
    //  val paddr   = UInt(XLEN.W)
    //  val excpVec = UInt(ExceptionCode.width.W)
    //}))
    //val dcacheSqReq  = Decoupled(new Bundle {
    //  val paddr = UInt(XLEN.W)
    //  val data  = UInt(XLEN.W)
    //  val mask  = UInt((XLEN / 8).W)
    //})
 
    // ══════════════════════════════════════════
    //  MMU 接口（使用与 IcacheToMmu/MmuToIcache
    //  同构但带 sqIdx 的 SqToMmuReq/MmuToSqResp）
    // ══════════════════════════════════════════
    val mmu = new Bundle {
      val toMmu   = Decoupled(new SqToMmuReq)
      val fromMmu = Flipped(Decoupled(new MmuToSqResp))
    }
 
    // ══════════════════════════════════════════
    //  ROB 提交接口
    // ══════════════════════════════════════════
    val robCommit = Vec(CommitWidth ,new Bundle {
      val valid = Input(Bool())
      val sqIdx = Input(UInt(log2Ceil(SqSize).W))
    })
 
    // ══════════════════════════════════════════
    //  重定向接口（预留）
    // ══════════════════════════════════════════
    val redirect = Flipped(Valid(new Bundle {
      val robIdx = UInt(log2Ceil(RobSize).W)
    }))
  })
 
  // ================================================================
  //  实例化 LQ 和 SQ
  // ================================================================
  val loadQueue  = Module(new LoadQueue)
  val storeQueue = Module(new StoreQueue)
 
  // ================================================================
  //  Dispatch 入队路由
  // ================================================================
  loadQueue.io.enq.valid  := io.lsEnq.req.valid && io.lsEnq.req.bits.isLoad
  loadQueue.io.enq.robIdx := io.lsEnq.req.bits.robIdx
  loadQueue.io.enq.sqIdx  := io.lsEnq.req.bits.sqIdx.value
  loadQueue.io.enq.pc     := io.lsEnq.toLsqData.pc
  loadQueue.io.enq.pdst   := io.lsEnq.toLsqData.pdst
  loadQueue.io.enq.rfWen  := io.lsEnq.toLsqData.ctrl.rfWen
  loadQueue.io.enq.lsuOp  := io.lsEnq.toLsqData.ctrl.lsuOp
  loadQueue.io.enq.fuType := io.lsEnq.toLsqData.ctrl.fuType
 
  storeQueue.io.enq.valid  := io.lsEnq.req.valid && io.lsEnq.req.bits.isStore
  storeQueue.io.enq.robIdx := io.lsEnq.req.bits.robIdx
  storeQueue.io.enq.lqIdx  := io.lsEnq.req.bits.lqIdx.value
  storeQueue.io.enq.pc     := io.lsEnq.toLsqData.pc
  storeQueue.io.enq.pdst   := io.lsEnq.toLsqData.pdst
  storeQueue.io.enq.rfWen  := io.lsEnq.toLsqData.ctrl.rfWen
  storeQueue.io.enq.lsuOp  := io.lsEnq.toLsqData.ctrl.lsuOp
  storeQueue.io.enq.fuType := io.lsEnq.toLsqData.ctrl.fuType
 
  io.lsEnq.lqFull := loadQueue.io.full
  io.lsEnq.sqFull := storeQueue.io.full
  io.lqEnqPtr     := loadQueue.io.enqPtr
  io.sqEnqPtr     := storeQueue.io.enqPtr
 
  // ================================================================
  //  SQ → LQ 排序信息
  // ================================================================
  loadQueue.io.sqOldestRobIdx := storeQueue.io.oldestRobIdx
  loadQueue.io.sqEmpty        := storeQueue.io.sqEmpty
 
  // ================================================================
  //  执行单元地址/数据通道路由
  // ================================================================
  val addrChannel = io.fromExeResult(0)
  val addrFire    = addrChannel.fire
  val addrUop     = addrChannel.bits.uop
 
  val dataChannel = io.fromExeResult(1)
  val dataFire    = dataChannel.fire
  val dataUop     = dataChannel.bits.uop
 
  // LQ 地址写入
  loadQueue.io.addrWrite.valid := addrFire && addrUop.ctrl.memRead
  loadQueue.io.addrWrite.idx   := addrUop.lqIdx.value
  loadQueue.io.addrWrite.vaddr := addrChannel.bits.data
 
  // SQ 地址写入（STA）
  storeQueue.io.addrWrite.valid := addrFire && addrUop.isSta
  storeQueue.io.addrWrite.idx   := addrUop.sqIdx.value
  storeQueue.io.addrWrite.vaddr := addrChannel.bits.data
 
  // SQ 数据写入（STD）
  storeQueue.io.dataWrite.valid := dataFire && dataUop.isStd
  storeQueue.io.dataWrite.idx   := dataUop.sqIdx.value
  storeQueue.io.dataWrite.data  := dataChannel.bits.data
 
  io.fromExeResult(0).ready := true.B
  io.fromExeResult(1).ready := true.B
 
  // ================================================================
  //  DCache 接口直连
  // ================================================================
  loadQueue.io.dcacheReq.ready := 0.U
  loadQueue.io.dcacheResp.valid := false.B
  loadQueue.io.dcacheResp.bits.data := 0.U
  loadQueue.io.dcacheResp.bits.excpVec := 0.U
  loadQueue.io.dcacheResp.bits.lqIdx := 0.U
  loadQueue.io.dcacheResp.bits.paddr := 0.U
  storeQueue.io.dcacheReq.ready := true.B

  dontTouch(loadQueue.io.dcacheReq)
  dontTouch(storeQueue.io.dcacheReq)
 
  // ================================================================
  //  MMU 接口直连（SqToMmuReq / MmuToSqResp）
  // ================================================================
  storeQueue.io.mmuReq  <> io.mmu.toMmu
  io.mmu.fromMmu        <> storeQueue.io.mmuResp
 
  // ================================================================
  //  ROB 提交直连
  // ================================================================
  storeQueue.io.robCommit <> io.robCommit
 
  // ================================================================
  //  后端写回输出
  // ================================================================
  io.toWbResult(0) <> loadQueue.io.outResult
  io.toWbResult(1) <> storeQueue.io.outResult
}