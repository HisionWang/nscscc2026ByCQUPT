package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.mmu._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.icache._
 
class Predecoder(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val flush         = Input(Bool())
    val icacheResp    = Flipped(Decoupled(new IcacheResp))
    val bpuInfo      = Input(new bpuInfoBundle)
    val bpuInfoValid = Input(Bool())

    val out           = Decoupled(new PredecodeResp)
    
  })
 
  // ================================================================
  // 第一部分：输入寄存器 —— 只存原始数据，不计算
  // ================================================================
 
  val s_pd_valid    = RegInit(false.B)
  val s_pd_instrs   = Reg(Vec(fetchWidth, UInt(32.W)))
  val s_pd_valids   = Reg(Vec(fetchWidth, Bool()))
  val s_pd_addr     = Reg(UInt(32.W))
  //val s_pd_miss     = Reg(Bool())
  val s_pd_uncached = Reg(Bool())
  val s_pd_mmuError = Reg(new MmuTransError)
  val s_pd_bpu     = Reg(new bpuInfoBundle)
 
  val inFire  = io.icacheResp.valid && io.icacheResp.ready && io.bpuInfoValid
  val outFire = io.out.valid && io.out.ready
 
  // 输入ready: 寄存器为空 或 输出被接收
  io.icacheResp.ready := !s_pd_valid || outFire
 
  // 状态转移
  when(io.flush) {
    s_pd_valid := false.B
  }.elsewhen(inFire) {
    s_pd_valid    := true.B
    s_pd_instrs   := io.icacheResp.bits.instrs
    s_pd_valids   := io.icacheResp.bits.instvalids
    s_pd_addr     := io.icacheResp.bits.addr
    //s_pd_miss     := io.icacheResp.bits.miss
    s_pd_uncached := io.icacheResp.bits.uncached
    s_pd_mmuError := io.icacheResp.bits.mmu_error
    s_pd_bpu     := io.bpuInfo
  }.elsewhen(outFire) {
    s_pd_valid := false.B
  }
 
  // ================================================================
  // 第二部分：组合逻辑 —— 全部从寄存器读，在寄存器后计算
  // ================================================================
 
  // ---- 每条指令的预译码结果 ----
  val pdInfo  = Wire(Vec(fetchWidth, new PredecodeInfo))
  val pcs     = Wire(Vec(fetchWidth, UInt(32.W)))
 
  // ---- 每条指令的故障信号 ----
  val faultValid  = Wire(Vec(fetchWidth, Bool()))
  val faultTarget = Wire(Vec(fetchWidth, UInt(32.W)))
  val faultIsCall = Wire(Vec(fetchWidth, Bool()))
  val faultIsRet  = Wire(Vec(fetchWidth, Bool()))
  val faultIsJal  = Wire(Vec(fetchWidth, Bool()))
  val faultIsJalr = Wire(Vec(fetchWidth, Bool()))
 
  // ---- 入队掩码 ----
  val enqMask = Wire(Vec(fetchWidth, Bool()))
  for (i <- 0 until fetchWidth) {
    enqMask(i) := s_pd_valids(i)
  }
 
  // ---- 前端重定向 & BPU更新 ----
  val feRedirect = Wire(new FrontendRedirect)
  feRedirect.valid  := false.B
  feRedirect.target := 0.U
 
  val bpuUpdate = Wire(new BpuUpdateReq)
  bpuUpdate.valid := false.B
  bpuUpdate := DontCare
 
  // ================================================================
  // 逐条指令预译码（从 s1 寄存器读取）
  // ================================================================
 
  for (i <- 0 until fetchWidth) {
    val instr   = s_pd_instrs(i)
    val pc      = s_pd_addr + (i * 4).U
    val isValid = s_pd_valids(i)
 
    pcs(i) := pc
 
    pdInfo(i).valid      := isValid
    pdInfo(i).isBr       := false.B
    pdInfo(i).isJal      := false.B
    pdInfo(i).isJalr     := false.B
    pdInfo(i).isCall     := false.B
    pdInfo(i).isRet      := false.B
    pdInfo(i).jumpTarget := 0.U
 
    faultValid(i)  := false.B
    faultTarget(i) := 0.U
    faultIsCall(i) := false.B
    faultIsRet(i)  := false.B
    faultIsJal(i)  := false.B
    faultIsJalr(i) := false.B
 
    when(isValid) {
      val opcode = instr(31, 26)
      val rj     = instr(9, 5)
      val rd     = instr(4, 0)
 
      // ==== 指令类型识别 ====
      val isBr   = LoongArch32Opcodes.isBranchOpcode(opcode)
      val isB    = opcode === LoongArch32Opcodes.OPC_B
      val isBl   = opcode === LoongArch32Opcodes.OPC_BL
      val isJal  = isB || isBl
      val isJirl = opcode === LoongArch32Opcodes.OPC_JIRL
      val isCall = isBl || (isJirl && rd === 1.U)
      val isRet  = isJirl && rj === 1.U && rd === 0.U
 
      pdInfo(i).isBr   := isBr
      pdInfo(i).isJal  := isJal
      pdInfo(i).isJalr := isJirl
      pdInfo(i).isCall := isCall
      pdInfo(i).isRet  := isRet
 
      // ==== 跳转目标 ====
      val offs16       = instr(25, 10)
      val brOffsetSext = Cat(Fill(14, Cat(offs16, 0.U(2.W))(17)), Cat(offs16, 0.U(2.W)))
      val brTarget     = pc + brOffsetSext
 
      val offs26       = instr(25, 0)
      val jalOffsetSext= Cat(Fill(4, Cat(offs26, 0.U(2.W))(27)), Cat(offs26, 0.U(2.W)))
      val jalTarget    = pc + jalOffsetSext
 
      pdInfo(i).jumpTarget := MuxCase(0.U, Seq(
        isBr  -> brTarget,
        isJal -> jalTarget
      ))
 
      // ==== BPU校验 ====
      val predTakenHere = s_pd_bpu.taken && s_pd_bpu.takenOffset === i.U
 
      val jalFault    = (isJal || isCall) && !predTakenHere
      val jalrFault   = isJirl && !predTakenHere
      val notCfiFault = !isBr && !isJal && !isJirl && predTakenHere
      val targetFault = (isJal || isCall) && predTakenHere && (s_pd_bpu.target =/= jalTarget)
 
      faultValid(i)  := jalFault || jalrFault || notCfiFault || targetFault
      faultIsJal(i)  := isJal
      faultIsJalr(i) := isJirl
      faultIsCall(i) := isCall
      faultIsRet(i)  := isRet
 
      faultTarget(i) := MuxCase(0.U, Seq(
        jalFault    -> jalTarget,
        targetFault -> jalTarget,
        jalrFault   -> (pc + 4.U),
        notCfiFault -> s_pd_bpu.fallThrough
      ))
    }
  }
 
  // ================================================================
  // 前缀扫描找第一个故障（无组合环路）
  // ================================================================
 
  val priorFault = Wire(Vec(fetchWidth + 1, Bool()))
  priorFault(0) := false.B
  for (i <- 0 until fetchWidth) {
    priorFault(i + 1) := priorFault(i) || faultValid(i)
  }
 
  val isFirstFault = Wire(Vec(fetchWidth, Bool()))
  for (i <- 0 until fetchWidth) {
    isFirstFault(i) := faultValid(i) && !priorFault(i)
  }
 
  val firstFaultIdx    = WireInit(0.U(fetchOffsetBits.W))
  val firstFaultTarget = WireInit(0.U(32.W))
  val firstFaultIsCall = WireInit(false.B)
  val firstFaultIsRet  = WireInit(false.B)
  val firstFaultIsJal  = WireInit(false.B)
  val firstFaultIsJalr = WireInit(false.B)
  val anyFault         = WireInit(false.B)
 
  for (i <- 0 until fetchWidth) {
    when(isFirstFault(i)) {
      anyFault         := true.B
      firstFaultIdx    := i.U
      firstFaultTarget := faultTarget(i)
      firstFaultIsCall := faultIsCall(i)
      firstFaultIsRet  := faultIsRet(i)
      firstFaultIsJal  := faultIsJal(i)
      firstFaultIsJalr := faultIsJalr(i)
    }
  }
 
  // ================================================================
  // 故障处理
  // ================================================================
 
  when(anyFault) {
    for (i <- 0 until fetchWidth) {
      when(i.U > firstFaultIdx) { enqMask(i) := false.B }
    }
    feRedirect.valid  := true.B
    feRedirect.target := firstFaultTarget
 
    val faultPC = s_pd_addr + Cat(firstFaultIdx, 0.U(2.W))
    bpuUpdate.valid  := true.B
    bpuUpdate.pc     := faultPC
    bpuUpdate.target := firstFaultTarget
    bpuUpdate.isJalr := firstFaultIsJalr
    bpuUpdate.isJal  := firstFaultIsJal
    bpuUpdate.isCall := firstFaultIsCall
    bpuUpdate.isRet  := firstFaultIsRet
    bpuUpdate.offset := firstFaultIdx
    bpuUpdate.taken  := true.B
    bpuUpdate.rasTop := s_pd_bpu.meta.rasTop
  }
 
  // ================================================================
  // 第三部分：输出 —— 组合逻辑结果直出
  // ================================================================
 
  io.out.valid               := s_pd_valid
  io.out.bits.instrs         := s_pd_instrs
  io.out.bits.instvalids     := s_pd_valids
  io.out.bits.pcs            := pcs
  io.out.bits.addr           := s_pd_addr
  //io.out.bits.miss           := s_pd_miss
  io.out.bits.uncached       := s_pd_uncached
  io.out.bits.mmu_error      := s_pd_mmuError
  io.out.bits.pdInfo         := pdInfo
  io.out.bits.enqMask        := enqMask
  io.out.bits.frontendRedirect := feRedirect
  io.out.bits.bpuUpdate      := bpuUpdate
}