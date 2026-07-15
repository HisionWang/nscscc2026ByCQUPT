package nscscc.backend.execute
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
import nscscc.backend.dispatch.DispatchedInst
import nscscc.backend.rename.RedirectInfo
import nscscc.frontend.BpuUpdateReq
 
// ═══════════════════════════════════════════════════════════════
//  分支执行单元
//
//  支持操作：jirl, b, bl, beq, bne, blt, bge, bltu, bgeu
//  单拍组合逻辑完成
//
//  职责：
//    1. 计算分支实际 taken 与目标地址
//    2. 与 BPU 预测值比对，仅在误预测时发起重定向
//    3. 无论预测正确与否，为每条有效分支指令生成 BPU 更新数据
//  注意：B/BL 的重定向与 BPU 更新已由前端预译码处理，此处跳过
// ═══════════════════════════════════════════════════════════════
 
class redirectInfoFromBru(implicit p: Parameters) extends NSBundle {
  val doRedirect = Bool()
  val snptId     = UInt(log2Ceil(SnapshotNum).W)
  val robIdx     = new RobPtr(RobSize)
  val target     = UInt(XLEN.W)
}
 
class redirectInfoToModule(implicit p: Parameters) extends NSBundle {
  val doRedirect = Bool()
  val flushSelf  = Bool()
 
  // 如果是来自于BRU的重定向:
  val fromBru = Bool()
  val snptId  = UInt(log2Ceil(SnapshotNum).W)
  val robIdx  = new RobPtr(RobSize)
 
  // 如果是来自于Rob的重定向:
  val fromRob = Bool()
 
  // 重定向目标
  val target = UInt(XLEN.W)
}
 
class BRU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val valid     = Input(Bool())
    val uop       = Input(new DispatchedInst)
    val rs1       = Input(UInt(XLEN.W))
    val rs2       = Input(UInt(XLEN.W))
    val result    = Output(UInt(XLEN.W))                        // 写回目标寄存器的值（如 BL 的 PC+4）
    val bruInfo   = ValidIO(new redirectInfoFromBru)             // 误预测重定向
    val isBranch  = Output(Bool())                               // 是否为分支指令
    val taken     = Output(Bool())                               // 分支是否 taken
    val bpuUpdate = Output(new BpuUpdateReq)                    // BPU 更新数据（始终发出）
  })
  dontTouch(io.uop)
 
  val op   = io.uop.ctrl.bruOp
  val src1 = io.rs1
  val src2 = io.rs2
  val pc   = io.uop.pc
 
  // ── 条件判断 ──
  val eq  = src1 === src2
  val ne  = !eq
  val lt  = src1.asSInt < src2.asSInt
  val ge  = !lt
  val ltu = src1 < src2
  val geu = !ltu
 
  // ── 分支是否 taken（实际值） ──
  val branchTaken = MuxCase(false.B, Seq(
    (op === BruOp.jirl) -> true.B,
    (op === BruOp.b)    -> true.B,
    (op === BruOp.bl)   -> true.B,
    (op === BruOp.beq)  -> eq,
    (op === BruOp.bne)  -> ne,
    (op === BruOp.blt)  -> lt,
    (op === BruOp.bge)  -> ge,
    (op === BruOp.bltu) -> ltu,
    (op === BruOp.bgeu) -> geu
  ))
 
  // ── 目标地址计算（实际值） ──
  val imm          = io.uop.imm
  val jirlTarget   = (src1 + imm)(XLEN - 1, 0)
  val branchTarget = (pc + imm)(XLEN - 1, 0)
  val target       = Mux(op === BruOp.jirl, jirlTarget, branchTarget)
 
  // ── 写回值 ──
  val linkResult = pc + 4.U
  io.result := Mux(op === BruOp.bl || op === BruOp.jirl, linkResult, 0.U)
 
  // ── 指令类型标记 ──
  io.isBranch := op =/= BruOp.none
  io.taken    := branchTaken
 
  // ══════════════════════════════════════════════════════════════
  //  误预测判定
  //
  //  BPU 预测值: bpuTaken / bpuTarget
  //  实际执行值: branchTaken / target
  //
  //  三种误预测情况：
  //    mispredTaken    : 预测不跳转，实际跳转       → 重定向到实际目标
  //    mispredNotTaken : 预测跳转，实际不跳转       → 重定向到 PC+4
  //    mispredTarget   : 预测跳转且实际跳转，目标错误 → 重定向到实际目标
  // ══════════════════════════════════════════════════════════════
 
  val bpuTaken  = io.uop.bpuInfo.taken
  val bpuTarget = io.uop.bpuInfo.target
 
  val mispredTaken    = !bpuTaken && branchTaken
  val mispredNotTaken = bpuTaken && !branchTaken
  val mispredTarget   = bpuTaken && branchTaken && (bpuTarget =/= target)
  val mispredict      = mispredTaken || mispredNotTaken || mispredTarget
 
  // B/BL (isJal) 的误预测已由前端预译码处理，BRU 不再发起重定向
  val isBranch = io.valid && io.isBranch && !io.uop.pdInfo.isJal
  val needRedirect = io.valid && io.isBranch && mispredict && !io.uop.pdInfo.isJal
 
  // 重定向目标：实际跳转 → target，实际不跳转 → PC+4
  val redirectTarget = Mux(branchTaken, target, pc + 4.U)
 
  // ── 重定向输出 ──
  io.bruInfo.valid           := isBranch
  io.bruInfo.bits.doRedirect := needRedirect
  io.bruInfo.bits.robIdx     := io.uop.robIdxFull
  io.bruInfo.bits.target     := redirectTarget
  io.bruInfo.bits.snptId     := io.uop.snptId.bits
 
  // ══════════════════════════════════════════════════════════════
  //  BPU 更新
  //
  //  无论预测正确与否，只要执行了有效的分支指令就发出更新数据。
  //  B/BL 的更新由预译码负责，此处跳过（避免重复写入）。
  // ══════════════════════════════════════════════════════════════
 
  val needBpuUpdate = isBranch
 
  io.bpuUpdate.valid              := needBpuUpdate
  io.bpuUpdate.validEntry         := true.B
  io.bpuUpdate.pc            := pc
  io.bpuUpdate.taken         := branchTaken
  io.bpuUpdate.target        := target                        // 实际跳转目标（始终填入，供 BTB 记录）
  io.bpuUpdate.oldPhtCounter :=  io.uop.bpuInfo.meta.phtCounter //Mux(io.uop.bpuInfo.meta.valid, io.uop.bpuInfo.meta.phtCounter, 2.U)
  io.bpuUpdate.isJalr        := io.uop.pdInfo.isJalr
  io.bpuUpdate.isJal         := io.uop.pdInfo.isJal
  io.bpuUpdate.isCall        := false.B                       // 已剔除
  io.bpuUpdate.isRet         := false.B                       // 已剔除
  io.bpuUpdate.offset        := pc(fetchOffsetBits + 1, 2)    // 指令在取指块内的偏移
  io.bpuUpdate.rasTop        := io.uop.bpuInfo.meta.rasTop
}