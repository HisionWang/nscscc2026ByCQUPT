// designCPUByChisel/src/main/scala/backend/Rob.scala
package nscscc.backend.rob
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.dispatch._
import nscscc.backend.rename._
import nscscc.backend.decode._
import nscscc.backend.execute._
import nscscc.util.CircularQueuePtr
 
/**
 * ═══════════════════════════════════════════════════════════════
 *  重排序缓冲区（ROB）—— 重构版
 * ═══════════════════════════════════════════════════════════════
 *
 *  【重定向冲刷机制】（学习香山）
 *    使用 redirectBegin/redirectEnd 两个寄存器标记冲刷范围，
 *    下一周期逐条判断每个 entry 是否落入该范围来清除 valid。
 *    优点：避免当周期遍历全部 entry 的组合逻辑长路径。
 *
 *    对于分支误预测（不刷自己）：
 *      redirectBegin = mispredRobIdx.value  （保留误预测指令自身）
 *      redirectEnd   = enqPtr.value         （刷到当前入队位置）
 *    范围内 (begin, end) 的条目被清除。
 */
 
// ROB 内部表项
class RobEntryInner(implicit p: Parameters) extends NSBundle {
  val pc          = UInt(XLEN.W)
  val inst        = UInt(XLEN.W)
  val fuType      = UInt(FuType.width.W)
  val pdst        = UInt(PhyRegIdxWidth.W)
  val oldPdst     = UInt(PhyRegIdxWidth.W)
  val ldst        = UInt(5.W)
  val rfWen       = Bool()
  val rfdata      = UInt(XLEN.W)
  val memRead     = Bool()
  val memWrite    = Bool()
  val memVaddr    = UInt(XLEN.W)
  val memPaddr    = UInt(XLEN.W)
  val storeData   = UInt(XLEN.W)
  val sqIdx       = new SqPtr(SqSize)
  val csrWen      = Bool()
  val csrOp    = UInt(CsrOp.width.W)
  val csrWaddr    = UInt(csrAddrLen.W)
  val csrWdata    = UInt(XLEN.W)
  val isPriv      = Bool()
  val excpVec     = UInt(ExceptionCode.width.W)
  val robIdx   = new RobPtr(RobSize)
  val writtenBack = Bool()
  val valid       = Bool()

}

class RobCommitIO(implicit p: Parameters) extends NSBundle {
  val valid     = Vec(CommitWidth, Output(Bool()))
  val bits      = Vec(CommitWidth, Output(new RobEntryInner))
  val isWalk    = Output(Bool())
}
class RobCommitToSq(implicit p: Parameters) extends NSBundle {
  val valid     = Vec(CommitWidth, Output(Bool()))
  val bits      = Vec(CommitWidth, Output(new RobEntryInner))
}

class RobCommitToCsr(implicit p: Parameters) extends NSBundle {
  
 // val pc          = UInt(XLEN.W)

  val csrWen      = Bool()
  val csrWaddr    = UInt(csrAddrLen.W)
  val csrWdata    = UInt(XLEN.W)
}


 
class ROB(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val flush      = Input(Bool())
    val enq        = new RobEnqIO
    val commit     = new RobCommitIO
    val commitToSq = new RobCommitToSq
    val commitToCsr = new RobCommitToCsr
    val redirect   = new RobRedirectIO
    val writeback  = Input(Vec(WbBusWidth, Valid(new RobWriteback)))
 
    // ── 新增：来自 BRU 的误预测重定向 ──
    val bruInfo    =Flipped ( ValidIO( new redirectInfoFromBru ))    // 误预测重定向
  })
 
  // ================================================================
  //  1. 指针类型
  // ================================================================
  class RobPtrInner extends CircularQueuePtr[RobPtrInner](RobSize)
 
  // ================================================================
  //  2. 存储体 + 头尾指针
  // ================================================================
  val entries = Reg(Vec(RobSize, new RobEntryInner))
  dontTouch(entries)
 
  val deqPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
  val enqPtr = RegInit({
    val p = Wire(new RobPtrInner); p.value := 0.U; p.flag := false.B; p
  })
 
  // ================================================================
  //  3. 空满判断
  // ================================================================
  val empty = deqPtr === enqPtr
  val full  = (deqPtr.value === enqPtr.value) && (deqPtr.flag =/= enqPtr.flag)
  val count = enqPtr.distanceTo(deqPtr)
 
  // ================================================================
  //  4. 入队逻辑（Dispatch 写入）
  // ================================================================
  val enqValidCount = PopCount(io.enq.valids)
  io.enq.canEnq := !full && (count +& enqValidCount <= RobSize.U)
 
  var enqOffset = 0.U(log2Ceil(RobSize).W)
  for (i <- 0 until CtrlBlockWidth) {
    val writeIdx = (enqPtr.value + enqOffset)(log2Ceil(RobSize) - 1, 0)
 
    when(io.enq.valid(i) && io.enq.canEnq) {
      entries(writeIdx).pc          := io.enq.bits(i).pc
      entries(writeIdx).inst        := io.enq.bits(i).inst
      entries(writeIdx).pdst        := io.enq.bits(i).pdst
      entries(writeIdx).oldPdst     := io.enq.bits(i).oldPdst
      entries(writeIdx).ldst        := io.enq.bits(i).ldst
      entries(writeIdx).rfWen       := io.enq.bits(i).rfWen
      entries(writeIdx).memRead     := io.enq.bits(i).memRead
      entries(writeIdx).memWrite    := io.enq.bits(i).memWrite
      entries(writeIdx).memVaddr    := 0.U
      entries(writeIdx).memPaddr    := 0.U
      entries(writeIdx).storeData   := 0.U
      entries(writeIdx).csrWen      := io.enq.bits(i).csrWen
      entries(writeIdx).csrWaddr    := io.enq.bits(i).csrWaddr
      //entries(writeIdx).csrWdata    := 0.U
      entries(writeIdx).csrOp       := io.enq.bits(i).csrOp


      entries(writeIdx).isPriv      := io.enq.bits(i).isPriv
      entries(writeIdx).fuType      := io.enq.bits(i).fuType
      entries(writeIdx).excpVec     := io.enq.bits(i).excpVec
      entries(writeIdx).writtenBack := false.B
      entries(writeIdx).valid       := true.B
    }
 
    enqOffset = enqOffset + io.enq.valid(i).asUInt
  }
 
  when(io.enq.canEnq && enqValidCount.orR && io.enq.valid(0)) {
    enqPtr := enqPtr + enqValidCount
  }
 
  // ================================================================
  //  5. 写回逻辑（执行单元标记完成）
  // ================================================================
  for (wb <- io.writeback) {
    when(wb.valid) {
      entries(wb.bits.robIdx.value).writtenBack := true.B
      entries(wb.bits.robIdx.value).rfdata := wb.bits.rfdata
      when(wb.bits.memValid) {
        entries(wb.bits.robIdx.value).memRead   := wb.bits.isMemRead
        entries(wb.bits.robIdx.value).memWrite  := wb.bits.isMemWrite
        entries(wb.bits.robIdx.value).memVaddr  := wb.bits.memVaddr
        entries(wb.bits.robIdx.value).memPaddr  := wb.bits.memPaddr
        entries(wb.bits.robIdx.value).storeData := wb.bits.memStoreData
      }
      entries(wb.bits.robIdx.value).sqIdx := wb.bits.sqIdx

      entries(wb.bits.robIdx.value).csrWdata := wb.bits.csrWdata
      //entries(wb.bits.robIdx.value).sqIdx := wb.bits.sqIdx
      // 如果有异常，更新异常向量
      when(wb.bits.excpVec.orR) {
        entries(wb.bits.robIdx.value).excpVec := wb.bits.excpVec
      }
    }
  }
 
  // ================================================================
  //  6. 提交逻辑（从头部按序提交已写回且无异常的指令）
  // ================================================================
  val commitCandidates = Wire(Vec(CommitWidth, new RobEntryInner))
  val commitValids     = Wire(Vec(CommitWidth, Bool()))
  var prevCanCommit = true.B
  for (i <- 0 until CommitWidth) {
    val idx   = (deqPtr.value + i.U)(log2Ceil(RobSize) - 1, 0)
    val entry = entries(idx)
 
    val thisReady = entry.valid && entry.writtenBack
    val hasExcp   = entry.excpVec.orR
 
    commitValids(i) := prevCanCommit && thisReady
 
    commitCandidates(i).pdst     := entry.pdst
    commitCandidates(i).oldPdst  := entry.oldPdst
    commitCandidates(i).ldst     := entry.ldst
    commitCandidates(i).rfWen    := entry.rfWen
    commitCandidates(i).pc       := entry.pc
    commitCandidates(i).inst     := entry.inst
    commitCandidates(i).rfdata   := entry.rfdata

    //SQ的
    commitCandidates(i).sqIdx   := entry.sqIdx
    commitCandidates(i).memWrite   := entry.memWrite
    commitCandidates(i).memRead    := entry.memRead
    commitCandidates(i).memVaddr   := entry.memVaddr
    commitCandidates(i).memPaddr   := entry.memPaddr
    commitCandidates(i).storeData  := entry.storeData

    commitCandidates(i).csrWen     := entry.csrWen
    commitCandidates(i).csrOp     := entry.csrOp
    commitCandidates(i).csrWaddr   := entry.csrWaddr
    commitCandidates(i).csrWdata := entry.csrWdata
    commitCandidates(i).isPriv     := entry.isPriv
    commitCandidates(i).fuType     := entry.fuType
    commitCandidates(i).excpVec    := entry.excpVec

    commitCandidates(i).robIdx    := DontCare
    
    commitCandidates(i).writtenBack    := DontCare
    commitCandidates(i).valid    := DontCare

    // 累积条件：前序都能提交 && 本身就绪（异常也算就绪，但会停止后续）
    prevCanCommit = prevCanCommit && thisReady
  }
 
  for (i <- 0 until CommitWidth) {
    io.commit.valid(i) := commitValids(i)
    io.commit.bits(i)  := commitCandidates(i)
    io.commitToSq.valid(i) := commitCandidates(i).memWrite && commitValids(i)
    io.commitToSq.bits(i)  := commitCandidates(i)

  }
  io.commit.isWalk := false.B

// ================================================================
//  CSR 提交输出
// ================================================================
io.commitToCsr.csrWen   := false.B
io.commitToCsr.csrWaddr := 0.U
io.commitToCsr.csrWdata := 0.U
 
var hasPrevCsrWrite = false.B
var csrHasPrevExcp = false.B

for (i <- 0 until CommitWidth) {

  val isCsrCommit = commitValids(i) && commitCandidates(i).csrWen
 
  // 本条是 CSR 写 且 前面没有 CSR 写 → 这是第一条 CSR 写
  val isFirstCsrWrite = isCsrCommit && !hasPrevCsrWrite  && !csrHasPrevExcp
 
  when(isFirstCsrWrite) {
    io.commitToCsr.csrWen   := true.B
    io.commitToCsr.csrWaddr := commitCandidates(i).csrWaddr
    io.commitToCsr.csrWdata := commitCandidates(i).csrWdata
  }
 
  hasPrevCsrWrite = hasPrevCsrWrite || isCsrCommit
  csrHasPrevExcp     = csrHasPrevExcp || (commitValids(i) && commitCandidates(i).excpVec.orR)
}

 
  val commitCount = PopCount(commitValids)
  for (i <- 0 until CommitWidth) {
    val idx = (deqPtr.value + i.U)(log2Ceil(RobSize) - 1, 0)
    when(commitValids(i)) {
      entries(idx).valid := false.B
    }
  }
  when(commitCount.orR) {
    deqPtr := deqPtr + commitCount
  }
 
  // ================================================================
  //  7. 异常重定向输出（保持原逻辑）
  // ================================================================
  io.redirect.valid    := false.B
  io.redirect.robIdx   := 0.U.asTypeOf(new RobPtr(RobSize))
  io.redirect.flushSelf := true.B
  io.redirect.pc       := 0.U
  io.redirect.excpVec  := 0.U
  io.redirect.isEbreak := false.B
 
  for (wb <- io.writeback) {
    when(wb.valid && wb.bits.excpVec.orR) {
      io.redirect.valid    := true.B
      io.redirect.robIdx   := wb.bits.robIdx
      io.redirect.flushSelf := true.B
      io.redirect.excpVec  := entries(wb.bits.robIdx.value).excpVec
      io.redirect.pc       := entries(wb.bits.robIdx.value).pc
    }
  }
 
  // ================================================================
  //  8. 重定向冲刷逻辑（学习香山 redirectBegin/redirectEnd 方式）
  //
  //  【核心思想】
  //    当 BRU 发出误预测信号时，不立即遍历所有 entry 清除，
  //    而是记录冲刷范围 [redirectBegin, redirectEnd)，
  //    在下一周期逐条判断每个 entry 是否落入该范围。
  //    这样将组合逻辑从"当周期全部比较"拆分为"寄存+逐条比较"，
  //    时序更友好。
  //
  //  【分支误预测的冲刷范围】
  //    误预测指令自身不刷（它在正确路径上，只是后续走错了）：
  //      redirectBegin = robIdx.value   （不含自身，开区间起点）
  //      redirectEnd   = enqPtr.value   （当前入队位置，开区间终点）
  //    范围 (begin, end) 内的条目被清除。
  //
  //  【环形区间判断】
  //    若 end > begin：正常区间，i > begin && i < end
  //    若 end <= begin：环绕区间，i > begin || i < end
  //    特殊情况 redirectAll：begin 与 end 重合且环绕（整个 ROB 都要刷）
  // ================================================================
 
  // 8-1. 寄存冲刷范围（香山风格：当周期锁存，下一周期执行清除）
  val redirectValidReg = RegInit(false.B)
  val redirectBegin    = Reg(UInt(log2Ceil(RobSize).W))
  val redirectEnd      = Reg(UInt(log2Ceil(RobSize).W))
  val redirectAll      = RegInit(false.B)
 
  // 8-2. 当 BRU 发出误预测重定向时，锁存冲刷范围
  //
  //  分支误预测：不刷自己（flushSelf = false）
  //    begin = robIdx.value  （保留误预测指令自身）
  //    end   = enqPtr.value  （当前尾指针位置）
  //
  //  特殊情况 redirectAll：
  //    当 robIdx == enqPtr 且 flag 不同时，说明误预测指令是 ROB 中
  //    唯一的指令，但它之后没有其他条目需要刷，所以 redirectAll = false。
  //    实际上分支误预测不会出现全刷的场景（至少误预测指令自身在 ROB 中）。
  val doRedirect = io.bruInfo.bits.doRedirect && io.bruInfo.valid
  val doRedirectSelf = false.B
  val RedirectRobIdx = io.bruInfo.bits.robIdx

  when(doRedirect) {
    // 分支误预测：不刷自己
    // begin = robIdx.value，表示从 robIdx 之后开始刷
    redirectBegin := RedirectRobIdx.value
    redirectEnd   := enqPtr.value
    // 对于分支误预测，这不会发生，但防御性处理
    redirectAll :=  doRedirectSelf && (RedirectRobIdx.value === enqPtr.value) && (RedirectRobIdx.flag ^ enqPtr.flag)

    //redirectValidReg := true.B
  }
 
  // 8-3. 更新每个 entry 的 valid 位
  //
  //  优先级（从高到低）：
  //    ① 全局冲刷（io.flush）：全部清零
  //    ② 入队写入：置 true（但重定向当周期禁止入队）
  //    ③ 提交清除：置 false
  //    ④ 重定向范围清除：落入 (begin, end) 区间的置 false
  //
  //  香山的写法中，重定向当周期 (io.redirect.valid) 禁止入队，
  //  避免新入队的条目在同一周期被误刷。
  for (i <- 0 until RobSize) {
    // 入队命中：该条目在本周期被新写入
    val validPrefixSum = Wire(Vec(CtrlBlockWidth + 1, UInt(log2Ceil(CtrlBlockWidth + 1).W)))
    validPrefixSum(0) := 0.U
    for (j <- 0 until CtrlBlockWidth) {
      validPrefixSum(j + 1) := validPrefixSum(j) + io.enq.valid(j).asUInt
    }

    // 然后在循环内，enqOH 改为：
    val enqOH = VecInit(
      (0 until CtrlBlockWidth).map(j => {
        val allocPtr = (enqPtr.value + validPrefixSum(j))(log2Ceil(RobSize) - 1, 0)
        io.enq.valid(j) && io.enq.canEnq && allocPtr === i.U
      })
    )
 
    // 提交命中
    val commitCond = commitValids.zipWithIndex.map { case (v, j) =>
      v && ((deqPtr.value + j.U)(log2Ceil(RobSize) - 1, 0) === i.U)
    }.reduce(_ || _)
 
    // 重定向范围命中：entry i 落入 (redirectBegin, redirectEnd) 区间
    val needFlush = redirectValidReg && (
      redirectAll ||                           // 全刷
      Mux(redirectEnd > redirectBegin,         // 正常区间
        i.U > redirectBegin && i.U < redirectEnd,
        i.U > redirectBegin || i.U < redirectEnd  // 环绕区间
      )
    )
 
    // 状态转移
    when(io.flush) {
      // ① 全局冲刷
      entries(i).valid := false.B
    }.elsewhen(enqOH.asUInt.orR && !doRedirect) {
      // ② 入队写入（重定向当周期禁止入队，防止新条目被误刷）
      entries(i).valid := true.B
    }.elsewhen(commitCond) {
      // ③ 提交清除
      entries(i).valid := false.B
    }.elsewhen(needFlush) {
      // ④ 重定向范围清除
      entries(i).valid := false.B
    }
  }
 
  // 8-4. 重定向后恢复 enqPtr
  //
  //  分支误预测：enqPtr 回退到误预测指令的下一个位置
  //  （robIdx + 1，因为误预测指令自身保留）
  //
  //  注意：这里的 enqPtr 恢复必须在当周期完成，
  //  否则下一周期的入队会写到错误的位置。
  when(doRedirect) {
    // 误预测指令自身保留，enqPtr 指向它的下一个位置
    val newEnqPtr = Wire(new RobPtrInner)
    when(doRedirectSelf){
      newEnqPtr := RedirectRobIdx
    }.otherwise{
      newEnqPtr := RedirectRobIdx + 1.U
    }
    
    // flag 处理：如果 robIdx.value 是 RobSize-1，则翻转 flag
    //newEnqPtr.flag := RedirectRobIdx.flag ^
    //  (RedirectRobIdx.value === (RobSize - 1).U)
 
    enqPtr := newEnqPtr
 
    // 清除 redirectValidReg：新的冲刷范围已锁存
    // （如果本周期同时有 bruRedirect，上面的 when 会重新置 true）
    redirectValidReg := true.B
  }.elsewhen(redirectValidReg) {
    // 冲刷完成一周期后清除标记
    redirectValidReg := false.B
  }
 
  // ================================================================
  //  9. 全局冲刷（保持原有逻辑，优先级最高）
  // ================================================================
  when(io.flush) {
    for (i <- 0 until RobSize) {
      entries(i).valid := false.B
    }
    deqPtr.value := 0.U
    deqPtr.flag  := false.B
    enqPtr.value := 0.U
    enqPtr.flag  := false.B
    redirectValidReg := false.B
  }
}
