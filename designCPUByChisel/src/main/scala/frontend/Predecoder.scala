package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.mmu._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.icache._
 /*
 1.检测当前携带过来的bpu信息中预测结果是否为跳转。
   1.1 如果预测不跳转：那就检测有效指令中是否有B和Bl两类强跳转：进行判断
         1.1.1 如果没有强跳转：那就放行每一条有效指令，并为每一条指令携带上不跳转的BPU信息供后端核验
         1.1.2 如果有强跳转：  遇到错误，a：截断第一条强跳转后续的指令，保留的指令携带不跳转的BPU信息发往后端 b：发起前端重定向，纠正取指方向为强跳转＋4 c：发去这条强跳转指令的更新bpu的数据
   1.2 如果预测的是跳转：那么首先要做的事就是把这条跳转的指令后续指令都剔除不有效，然后再检测这条预测为指令的前方是否有b或者bl指令：进行判断
         1.2.1 如果预测为跳转的这条指令前方有b或者bl ：遇到错误， a：截断第一条强跳转后续的指令，保留的指令携带不跳转的BPU信息发往后端  b：发起前端重定向，纠正取指方向为强跳转＋4 c:发去这条强跳转指令的更新bpu的数据（非预测的那条指令）
         1.2.2 如果预测为跳转的这条指令前方没有B或者bl：那就检测携带了跳转信息这条指令是否为跳转指令（包括b、bl以及条件跳转等所有跳转指令）：进行判断：
                  1.2.2.1 如果这条指令是跳转指令：判断是否为强跳转指令：
                                      1.2.2.1.1 如果是强跳转指令：判断是否预测跳转目标是否正确：
                                                            1.2.2.1.1.1：强跳转预测目标正确：a：该指令后续指令都无效，b：该指令携带他的跳转信息发往后端  c：该指令前序指令均携带不跳转的信息发往后端  d：更新BPU计数器
                                                            1.2.2.1.1.2：强跳转预测目标错误：a：该指令后续指令都无效，b：该指令携带他的跳转信息发往后端  c：该指令前序指令均携带不跳转的信息发往后端  d：发起前端重定向，纠正取指方向为强跳转目标 e：更新BPU数据
                                      1.2.2.1.2 如果不是强跳转指令，也就是为其他跳转指令（包括jirl）：a：该指令后续指令都无效，b：该指令携带他的跳转信息发往后端  c：该指令前序指令均携带不跳转的信息发往后端 不更新bpu
                  1.2.2.2 如果这条指令不是跳转指令，遇到错误： a：该指令后续指令都无效  b：该指令前序指令均携带不跳转的信息发往后端  c：发起重定向，目标为该指令+4 （虽然该指令后续的pc+4可能就在此周期的预译码，但为了控制简单，此处还是截断+重定向下一pc的方式处理）       d：修正BPU数据，判不valid
 
 
 
 */
class Predecoder(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val flush         = Input(Bool())
    val icacheResp    = Flipped(Decoupled(new IcacheResp))
    val bpuInfo       = Input(new bpuInfoBundle)
    val bpuInfoValid  = Input(Bool())
    val out           = Decoupled(new PredecodeResp)
  })
  dontTouch(io.bpuInfo)
  dontTouch(io.bpuInfoValid)
  dontTouch(io.out)
 
  // ================================================================
  // 第一部分：输入流水线寄存器 —— 只存原始数据，不计算
  // ================================================================
 
  val s_valid    = RegInit(false.B)
  val s_instrs   = Reg(Vec(fetchWidth, UInt(32.W)))
  val s_valids   = Reg(Vec(fetchWidth, Bool()))
  val s_addr     = Reg(UInt(32.W))
  val s_uncached = Reg(Bool())
  val s_mmuError = Reg(new MmuTransError)
  val s_bpu      = Reg(new bpuInfoBundle)
 
  val inFire  = io.icacheResp.valid && io.icacheResp.ready && io.bpuInfoValid
  val outFire = io.out.valid && io.out.ready
 
  io.icacheResp.ready := !s_valid || outFire
 
  when(io.flush) {
    s_valid := false.B
  }.elsewhen(inFire) {
    s_valid    := true.B
    s_instrs   := io.icacheResp.bits.instrs
    s_valids   := io.icacheResp.bits.instvalids
    s_addr     := io.icacheResp.bits.addr
    s_uncached := io.icacheResp.bits.uncached
    s_mmuError := io.icacheResp.bits.mmu_error
    s_bpu      := io.bpuInfo
  }.elsewhen(outFire) {
    s_valid := false.B
  }
 
  // ================================================================
  // 第二部分：组合逻辑 —— 预译码与校验
  // ================================================================
  // 模块职责（仅此三项）：
  //   1. 检测 B/BL 强跳转的预测错误并纠正
  //   2. 检测非跳转指令被预测为跳转并重定向
  //   3. 为每条指令生成独立的 BPU 信息供后端核验
  // 注意：call/ret 等操作已全部剔除
  // ================================================================
 
  // ---- Step 1: 逐条指令基础预译码（纯组合，每信号赋值一次） ----
 
  val pc         = Wire(Vec(fetchWidth, UInt(32.W)))
  val isJalInst  = Wire(Vec(fetchWidth, Bool()))   // B || BL（强跳转）
  val isJirlInst = Wire(Vec(fetchWidth, Bool()))   // JIRL（间接跳转）
  val isBrInst   = Wire(Vec(fetchWidth, Bool()))   // 条件分支 beq/bne/blt/bge/bltu/bgeu
  val isCfiInst  = Wire(Vec(fetchWidth, Bool()))   // 任意控制流指令
  val jalTgt     = Wire(Vec(fetchWidth, UInt(32.W)))  // B/BL 跳转目标（仅 B/BL 有意义）
 
  for (i <- 0 until fetchWidth) {
    val instr  = s_instrs(i)
    val opcode = instr(31, 26)
    val v      = s_valids(i)   // 仅有效指令参与后续计算
 
    pc(i)         := s_addr + (i * 4).U
    isJalInst(i)  := v && (opcode === LoongArch32Opcodes.OPC_B || opcode === LoongArch32Opcodes.OPC_BL)
    isJirlInst(i) := v && (opcode === LoongArch32Opcodes.OPC_JIRL)
    isBrInst(i)   := v && LoongArch32Opcodes.isBranchOpcode(opcode)
    isCfiInst(i)  := isJalInst(i) || isJirlInst(i) || isBrInst(i)
 
    // B/BL 跳转目标：26位偏移符号扩展 << 2 + PC
    val offs26        = Cat(instr(9, 0), instr(25, 10))
    val jalOffsetSext = Cat(Fill(4, Cat(offs26, 0.U(2.W))(27)), Cat(offs26, 0.U(2.W)))
    jalTgt(i)        := Mux(v, pc(i) + jalOffsetSext, 0.U)
  }
 
  // ---- Step 2: 前缀扫描找第一条强跳转 (B/BL) ----
 
  val priorJal = Wire(Vec(fetchWidth + 1, Bool()))
  priorJal(0)  := false.B
  for (i <- 0 until fetchWidth) {
    priorJal(i + 1) := priorJal(i) || isJalInst(i)
  }
 
  val isFirstJal = Wire(Vec(fetchWidth, Bool()))
  for (i <- 0 until fetchWidth) {
    isFirstJal(i) := isJalInst(i) && !priorJal(i)
  }
 
  val hasJal         = priorJal(fetchWidth)
  val firstJalIdx    = MuxCase(0.U, (0 until fetchWidth).map(i => isFirstJal(i) -> i.U))
  val firstJalTarget = MuxCase(0.U, (0 until fetchWidth).map(i => isFirstJal(i) -> jalTgt(i)))
  val firstJalPC     = MuxCase(0.U, (0 until fetchWidth).map(i => isFirstJal(i) -> pc(i)))
 
  // ---- Step 3: BPU 预测分解 ----
 
  val predTaken  = s_bpu.taken
  val predIdx    = s_bpu.takenOffset
  val predTarget = s_bpu.target
 
  // 预测跳转指令的属性（通过 MuxCase 从 per-instruction 信号中选取 predIdx 对应项）
  val predIsJal     = MuxCase(false.B, (0 until fetchWidth).map(i => (i.U === predIdx) -> isJalInst(i)))
  val predIsCfi     = MuxCase(false.B, (0 until fetchWidth).map(i => (i.U === predIdx) -> isCfiInst(i)))
  val predJalTarget = MuxCase(0.U,    (0 until fetchWidth).map(i => (i.U === predIdx) -> jalTgt(i)))
  val predPC        = MuxCase(0.U,    (0 until fetchWidth).map(i => (i.U === predIdx) -> pc(i)))
 
  // 预测跳转位置之前是否存在强跳转
  val hasJalBeforePred = (0 until fetchWidth)
    .map(i => isJalInst(i) && i.U < predIdx)
    .reduce(_ || _)
 
  // 强跳转预测目标是否正确
  val jalTargetCorrect = predIsJal && (predTarget === predJalTarget)
 
  // ---- Step 4: 场景判定（决策树编码，MuxCase 单次赋值） ----
  //
  //   0: 预测不跳转，块内无强跳转                     → 放行            (1.1.1)
  //   1: 预测不跳转，块内有强跳转                     → 重定向到强跳转目标 (1.1.2)
  //   2: 预测跳转，跳转位置前有强跳转                  → 重定向到首条强跳转目标 (1.2.1)
  //   3: 预测跳转，预测指令是强跳转且目标正确           → 无需重定向       (1.2.2.1.1.1)
  //   4: 预测跳转，预测指令是强跳转但目标错误           → 重定向到正确目标  (1.2.2.1.1.2)
  //   5: 预测跳转，预测指令是其他跳转(JIRL/条件分支)    → 无需重定向       (1.2.2.1.2)
  //   6: 预测跳转，预测指令不是跳转指令                 → 重定向到PC+4     (1.2.2.2)
 
  val scenario = MuxCase(0.U(3.W), Seq(
    (!predTaken && !hasJal)                                            -> 0.U,
    (!predTaken && hasJal)                                             -> 1.U,
    (predTaken && hasJalBeforePred)                                    -> 2.U,
    (predTaken && !hasJalBeforePred && predIsJal && jalTargetCorrect)  -> 3.U,
    (predTaken && !hasJalBeforePred && predIsJal && !jalTargetCorrect) -> 4.U,
    (predTaken && !hasJalBeforePred && !predIsJal && predIsCfi)        -> 5.U,
    (predTaken && !hasJalBeforePred && !predIsCfi)                     -> 6.U
  ))
 
  // ---- Step 5: 前端重定向 ----
 
  val needRedirect = scenario === 1.U || scenario === 2.U ||
                     scenario === 4.U || scenario === 6.U || ( s_uncached && s_valid )
 
  val redirectTarget = MuxCase(0.U, Seq(
    ( s_uncached && s_valid && !isFirstJal(0)) -> (s_addr + 4.U),
    ( s_uncached && s_valid && isFirstJal(0)) -> firstJalTarget,

    (scenario === 1.U || scenario === 2.U) -> firstJalTarget,
    (scenario === 4.U)                     -> predJalTarget,
    (scenario === 6.U)                     -> (predPC + 4.U)
  ))
 
  val feRedirect = Wire(new FrontendRedirect)
  feRedirect.valid  := outFire && needRedirect //必须要outfire的时候才能发起重定向，不然如果ibf满了的话，自己这周期的有效指令就被刷了
  feRedirect.target := redirectTarget
 
  // ---- Step 6: BPU 更新 ----
 
  val needBpuUpdate = scenario === 1.U || scenario === 2.U ||
                      scenario === 3.U || scenario === 4.U || scenario === 6.U
 
  val bpuUpdatePC     = Mux(scenario === 1.U || scenario === 2.U, firstJalPC, predPC)
  val bpuUpdateTarget = Mux(scenario === 1.U || scenario === 2.U, firstJalTarget,
                       Mux(scenario === 6.U, predPC + 4.U, predJalTarget))
  val bpuUpdateTaken  = Mux(scenario === 6.U, false.B, true.B)
  val bpuUpdateIsJal  = scenario === 1.U || scenario === 2.U ||
                        scenario === 3.U || scenario === 4.U
  val bpuUpdateOffset = Mux(scenario === 1.U || scenario === 2.U,
                       firstJalPC(fetchOffsetBits + 1, 2),
                       predPC(fetchOffsetBits + 1, 2))
 
  val bpuUpdate = Wire(new BpuUpdateReq)
  bpuUpdate.valid         := s_valid && needBpuUpdate
  bpuUpdate.validEntry    := scenario =/= 6.U
  bpuUpdate.pc            := bpuUpdatePC
  bpuUpdate.target        := bpuUpdateTarget
  bpuUpdate.taken         := bpuUpdateTaken
  bpuUpdate.isJalr        := false.B
  bpuUpdate.isJal         := bpuUpdateIsJal
  bpuUpdate.isCall        := false.B
  bpuUpdate.isRet         := false.B
  bpuUpdate.offset        := bpuUpdateOffset
  bpuUpdate.rasTop        := s_bpu.meta.rasTop
  bpuUpdate.oldPhtCounter := Mux(scenario === 1.U || scenario === 2.U, 0.U,
                               ( s_bpu.meta.phtCounter)
                             )  // 场景3/4/6使用实际计数器
 
  // ---- Step 7: 入队掩码（截断逻辑） ----
  // 场景 0: 不截断，全部放行
  // 场景 1/2: 截断到 firstJalIdx（含），其后的指令无效
  // 场景 3/4/5/6: 截断到 predIdx（含），其后的指令无效
 
  val truncateIdx = MuxCase((fetchWidth - 1).U, Seq(
    (scenario === 1.U || scenario === 2.U) -> firstJalIdx,
    (scenario === 3.U || scenario === 4.U || scenario === 5.U || scenario === 6.U) -> predIdx
  ))
 
  val enqMask = Wire(Vec(fetchWidth, Bool()))
  for (i <- 0 until fetchWidth) {
    enqMask(i) := s_valids(i) && (i.U <= truncateIdx)
  }
 
  // ---- Step 8: 逐条指令输出（独立 BPU 信息 + 预译码信息） ----
 
  val outPdInfo  = Wire(Vec(fetchWidth, new PredecodeInfo))
  val outBpuInfo = Wire(Vec(fetchWidth, new bpuInfoBundle))
 
  for (i <- 0 until fetchWidth) {
    val instr  = s_instrs(i)
    val opcode = instr(31, 26)
    val v      = s_valids(i) && enqMask(i)   // 仅有效且未截断的指令
 
    // ---- 预译码信息 ----
    outPdInfo(i).valid      := v
    outPdInfo(i).isBr       := v && LoongArch32Opcodes.isBranchOpcode(opcode)
    outPdInfo(i).isJal      := v && (opcode === LoongArch32Opcodes.OPC_B || opcode === LoongArch32Opcodes.OPC_BL)
    outPdInfo(i).isJalr     := v && (opcode === LoongArch32Opcodes.OPC_JIRL)
    outPdInfo(i).isCall     := false.B   // 已剔除
    outPdInfo(i).isRet      := false.B   // 已剔除
    outPdInfo(i).jumpTarget := Mux(
      v && (opcode === LoongArch32Opcodes.OPC_B || opcode === LoongArch32Opcodes.OPC_BL),
      jalTgt(i), 0.U
    )
 
    // ---- 逐条独立 BPU 信息 ----
    // 判断该指令是否为"特殊指令"（需要携带跳转信息的指令）
    //   场景 1/2: 第一条强跳转携带 taken=true
    //   场景 3/4/5: 预测跳转指令携带 taken=true
    //   其余: taken=false
    val isSpecialJal  = (scenario === 1.U || scenario === 2.U) && (i.U === firstJalIdx)
    val isSpecialPred = (scenario === 3.U || scenario === 4.U || scenario === 5.U) && (i.U === predIdx)
    val isSpecial     = isSpecialJal || isSpecialPred
 
    outBpuInfo(i).pc          := pc(i)
    outBpuInfo(i).fallThrough := pc(i) + 4.U
    outBpuInfo(i).taken       := isSpecial
    outBpuInfo(i).takenOffset := i.U
    outBpuInfo(i).target      := Mux(isSpecialJal, firstJalTarget,
                             Mux(isSpecialPred,
                               Mux(predIsJal, predJalTarget, predTarget),
                               pc(i) + 4.U))
    outBpuInfo(i).meta        := s_bpu.meta
  }
 
  // ================================================================
  // 第三部分：输出
  // ================================================================
 
  io.out.valid               := s_valid
  io.out.bits.instrs         := s_instrs
  io.out.bits.instvalids     := s_valids
  io.out.bits.pcs            := pc
  io.out.bits.addr           := s_addr
  io.out.bits.uncached       := s_uncached
  io.out.bits.mmu_error      := s_mmuError
  io.out.bits.pdInfo         := outPdInfo
  io.out.bits.bpuInfo        := outBpuInfo
  io.out.bits.enqMask        := enqMask
  io.out.bits.frontendRedirect := feRedirect
  io.out.bits.bpuUpdate      := bpuUpdate
}