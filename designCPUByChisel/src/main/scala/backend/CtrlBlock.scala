package nscscc.backend
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.frontend.CtrlFlowIO
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.dispatch._
import nscscc.backend.rob._
 
class CtrlBlockIO(implicit p: Parameters) extends NSBundle {
  val in       = Vec(CtrlBlockWidth, Flipped(Decoupled(new CtrlFlowIO)))
  val out      = Vec(IssueQueueIdx.NUM, Decoupled(new DispatchedInst))
  val commit   = Output(Vec(CommitWidth, new RobCommitInfo))
  val redirect = Output(new RedirectInfo)
  val flush    = Input(Bool())
  val extInt   = Input(Bool())
}
 
class CtrlBlock(implicit p: Parameters) extends NSModule {
  val io = IO(new CtrlBlockIO)
 
  // ================================================================
  //  译码级
  // ================================================================
  val decodeStage = Module(new DecodeStage)
  decodeStage.io.in    <> io.in
  decodeStage.io.extInt := io.extInt
  decodeStage.io.flush  := io.flush || io.redirect.valid
 
  // ================================================================
  //  重命名级
  // ================================================================
  val renameStage = Module(new RenameStage)
  renameStage.io.in      <> decodeStage.io.out
  renameStage.io.ratRead <> decodeStage.io.ratRead
  renameStage.io.redirect := io.redirect
  renameStage.io.flush    := io.flush

  // ================================================================
  //  分发级
  // ================================================================
  val dispatchStage = Module(new DispatchStage)
  dispatchStage.io.in       <> renameStage.io.out
  dispatchStage.io.flush    := io.flush
  dispatchStage.io.redirect := io.redirect
  dispatchStage.io.out <> io.out
 
  // IQ 反馈（当前所有队列都可接收）
  for (q <- 0 until IssueQueueIdx.NUM) {
    dispatchStage.io.iqFeedback.canAccept(q) := true.B
  }

 
  // ================================================================
  //  ROB
  // ================================================================
  val rob = Module(new ROB)
 
  // ROB 提交信息 → 重命名级（释放旧物理寄存器 + 更新架构表）
  for (i <- 0 until CommitWidth) {
    renameStage.io.commit(i).valid     := rob.io.commit.valid(i)
    renameStage.io.commit(i).pdst      := rob.io.commit.bits(i).pdst
    renameStage.io.commit(i).oldPdst   := rob.io.commit.bits(i).oldPdst
    renameStage.io.commit(i).ldst      := rob.io.commit.bits(i).ldst
    renameStage.io.commit(i).rfWen     := rob.io.commit.bits(i).rfWen
    renameStage.io.commit(i).isWalk    := rob.io.commit.isWalk
  }
 
  // ROB 提交信息 → 外部（供 CSR 等使用）
  for (i <- 0 until CommitWidth) {
    io.commit(i).valid     := rob.io.commit.valid(i)
    io.commit(i).pdst      := rob.io.commit.bits(i).pdst
    io.commit(i).oldPdst   := rob.io.commit.bits(i).oldPdst
    io.commit(i).ldst      := rob.io.commit.bits(i).ldst
    io.commit(i).rfWen     := rob.io.commit.bits(i).rfWen
    io.commit(i).isWalk    := rob.io.commit.isWalk
  }
 
  // ROB 重定向
  rob.io.flush := io.flush || io.redirect.valid
 
  // 写回口（当前无执行单元，置无效）
  for (i <- 0 until WbBusWidth) {
    rob.io.writeback(i).valid       := false.B
    rob.io.writeback(i).bits.robIdx := 0.U
    rob.io.writeback(i).bits.excpVec := 0.U
    rob.io.writeback(i).bits.isBypass := false.B
  }
 

 
  // ROB 入队连接
  // ❌ 旧写法：直接从 rename 输出入队 ROB
  // rob.io.enq.valid(i) := renameStage.io.out(i).fire
 
  // ✅ 新写法：从 Dispatch 级入队 ROB
  rob.io.enq <> dispatchStage.io.robEnq
 
  // ================================================================
  //  重定向信号汇聚
  //  优先级：ROB 异常重定向 > 外部重定向
  // ================================================================
  io.redirect := rob.io.redirect //Mux(rob.io.redirect.valid, rob.io.redirect,
                // io.redirect)  // 默认透传外部
}