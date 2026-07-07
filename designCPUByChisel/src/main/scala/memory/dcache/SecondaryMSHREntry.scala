package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.axi._

// ================================================================
//  二级 MSHR 表项：合并等待 + Replay
// ================================================================
class SecondaryMSHREntry(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val req = Flipped(Decoupled(new SecondaryAllocReq))
 
    // 唤醒
    val wakeup     = Input(Valid(UInt(1.W)))  // 正常唤醒：primary fetchDone
    val fastWakeup = Input(Valid(UInt(1.W)))  // 快速唤醒：分配同周期 primary 完成
 
    // Replay
    val replay = Decoupled(new ReplayReq)
 
    // 状态
    val busy      = Output(Bool())
    val isStore   = Output(Bool())
    val blockAddr = Output(UInt((tagBits + idxBits).W))
    val primaryId = Output(UInt(1.W))
 
    // Redirect
    val redirect = Input(Valid(new Bundle {
      val robIdx = new RobPtr(RobSize)
    }))
  })
 
  val s_idle :: s_waiting :: s_ready :: Nil = Enum(3)
  val state = RegInit(s_idle)
 
  val reqReg       = Reg(new ReplayReq)
  val primaryIdReg = Reg(UInt(1.W))
  val flushedReg   = RegInit(false.B)
 
  io.busy      := state =/= s_idle
  io.isStore   := reqReg.isStore
  io.blockAddr := reqReg.paddr(31, blockOffBits)
  io.primaryId := primaryIdReg
 
  // 接收请求
  io.req.ready := state === s_idle
  val primaryDone = io.fastWakeup.valid && io.fastWakeup.bits === io.req.bits.primaryId
  when(io.req.fire) {
    reqReg       := io.req.bits.replayReq
    primaryIdReg := io.req.bits.primaryId
    flushedReg   := false.B
    state := Mux(primaryDone, s_ready, s_waiting)
  }
 
  // 正常唤醒
  when(io.wakeup.valid && io.wakeup.bits === primaryIdReg && state === s_waiting) {
    state := s_ready
  }
 
  // Redirect：仅 flush Load，Store 不可被 flush
  when(io.redirect.valid && state =/= s_idle && !reqReg.isStore) {
    when(reqReg.robIdx.isAfter(io.redirect.bits.robIdx)) {
      flushedReg := true.B
    }
  }
 
  // Replay 输出
  io.replay.valid := state === s_ready && !flushedReg
  io.replay.bits  := reqReg
 
  when(state === s_ready && (io.replay.fire || flushedReg)) {
    state := s_idle
    flushedReg := false.B
  }
}