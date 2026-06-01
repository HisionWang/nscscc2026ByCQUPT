package nscscc.frontend
 
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config._
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.icache._
 
class Predecoder(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 来自ICache的数据
    val icacheResp = Flipped(Decoupled(new IcacheResp))
    // 对应的BPU预测信息
    val predInfo   = Input(new PredInfoBundle)
    val predInfoValid = Input(Bool())  // 预测信息是否有效
    // 输出
    val out        = Decoupled(new PredecodeResp)
    // 控制信号
    val flush      = Input(Bool())
  })
 
  io.out.bits := DontCare
 
  // ==================== 流水线寄存器 ====================
  val stageValid = RegInit(false.B)
  val stageData  = Reg(new PredecodeResp)
 
  val inFire  = io.icacheResp.valid && io.icacheResp.ready && io.predInfoValid
  val outFire = io.out.valid && io.out.ready
 
  io.icacheResp.ready := !stageValid || outFire
  io.out.valid := stageValid
  io.out.bits  := stageData
 
  // ==================== 预译码组合逻辑 ====================
  when(io.flush) {
    stageValid := false.B
  }.elsewhen(inFire) {
    stageValid := true.B
    val icache = io.icacheResp.bits
    val pred   = io.predInfo
 
    // 透传
    stageData.addr     := icache.addr
    stageData.miss     := icache.miss
    stageData.uncached := icache.uncached
    stageData.mmu_error := icache.mmu_error
    stageData.instrs   := icache.instrs
    stageData.instvalids := icache.instvalids  // 使用原字段名
 
    // 默认: 无前端重定向, 无BPU更新
    stageData.frontendRedirect.valid  := false.B
    stageData.frontendRedirect.target := 0.U
    stageData.bpuUpdate.valid := false.B
    stageData.bpuUpdate := DontCare
 
    // 计算每条指令的PC
    for (i <- 0 until fetchWidth) {
      stageData.pcs(i) := icache.addr + (i * 4).U
    }
 
    // ==================== 指令识别与目标计算 ====================
    // 保存第一个检测到的故障信息
    val firstFaultValid  = WireInit(false.B)
    val firstFaultIdx    = WireInit(0.U(log2Ceil(fetchWidth).W))
    val firstFaultTarget = WireInit(0.U(32.W))
    val firstFaultIsCall = WireInit(false.B)
    val firstFaultIsRet  = WireInit(false.B)
    val firstFaultIsJal  = WireInit(false.B)
    val firstFaultIsJalr = WireInit(false.B)
 
    // 默认enqMask: 所有有效指令都可以入队
    for (i <- 0 until fetchWidth) {
      stageData.enqMask(i) := icache.instvalids(i) && !icache.miss
    }
 
    for (i <- 0 until fetchWidth) {
      val instr = icache.instrs(i)
      val pc    = icache.addr + (i * 4).U
      val isValid = icache.instvalids(i) && !icache.miss
      val info  = stageData.pdInfo(i)
 
      // 默认值
      info.valid      := isValid
      info.isBr       := false.B
      info.isJal      := false.B
      info.isJalr     := false.B
      info.isCall     := false.B
      info.isRet      := false.B
      info.jumpTarget := 0.U
 
      when(isValid) {
        // 提取LoongArch32字段
        val opcode = instr(31, 26)
        val rj     = instr(9, 5)
        val rd     = instr(4, 0)
 
        // ---- 条件分支 ----
        val isBr = LoongArch32Opcodes.isBranchOpcode(opcode)
        info.isBr := isBr
 
        // 条件分支偏移: offs16 = instr[25:10], 符号扩展左移2
        val offs16 = instr(25, 10)
        val brOffset = Cat(offs16, 0.U(2.W))                        // 18 bits
        val brOffsetSext = Cat(Fill(14, brOffset(17)), brOffset)    // 32 bits
        val brTarget = pc + brOffsetSext
        info.jumpTarget := Mux(isBr, brTarget, 0.U)
 
        // ---- 无条件直接跳转 (b/bl) ----
        val isB  = opcode === LoongArch32Opcodes.OPC_B
        val isBl = opcode === LoongArch32Opcodes.OPC_BL
        val isJal = isB || isBl
        info.isJal := isJal
 
        // b/bl偏移: offs26 = instr[25:0], 符号扩展左移2
        val offs26 = instr(25, 0)
        val jalOffset = Cat(offs26, 0.U(2.W))                       // 28 bits
        val jalOffsetSext = Cat(Fill(4, jalOffset(27)), jalOffset)  // 32 bits
        val jalTarget = pc + jalOffsetSext
        when(isJal) {
          info.jumpTarget := jalTarget
        }
 
        // ---- 间接跳转 (jirl) ----
        val isJirl = opcode === LoongArch32Opcodes.OPC_JIRL
        info.isJalr := isJirl
        // jirl目标依赖寄存器, 预译码无法计算
 
        // ---- 函数调用/返回 ----
        // bl 总是保存返回地址到r1
        // jirl rd=r1 也是调用模式
        info.isCall := isBl || (isJirl && rd === 1.U)
        // 典型返回: jirl r0, r1, 0
        info.isRet  := isJirl && rj === 1.U && rd === 0.U
 
        // ==================== BPU预测校验 ====================
        val predTakenThisInst = pred.taken && pred.takenOffset === i.U
 
        // 故障1: JAL/BL必跳, 但BPU说不跳
        val jalFault = (isJal || info.isCall) && !predTakenThisInst
        // 故障2: JIRL必跳, 但BPU说不跳
        val jalrFault = isJirl && !predTakenThisInst
        // 故障3: 非CFI指令, 但BPU说跳
        val notCfiFault = !isBr && !isJal && !isJirl && predTakenThisInst
        // 故障4: 直接跳转目标不对
        val targetFault = (isJal || info.isCall) && predTakenThisInst &&
                          (pred.target =/= jalTarget)
 
        val anyFault = jalFault || jalrFault || notCfiFault || targetFault
 
        // 记录第一个故障(最高优先级: 最低偏移)
        when(anyFault && !firstFaultValid) {
          firstFaultValid  := true.B
          firstFaultIdx    := i.U
          firstFaultIsJal  := isJal
          firstFaultIsJalr := isJirl
          firstFaultIsCall := info.isCall
          firstFaultIsRet  := info.isRet
 
          // 确定正确的重定向目标
          when(jalFault || targetFault) {
            firstFaultTarget := jalTarget   // 直接跳转的正确目标
          }.elsewhen(jalrFault) {
            // jirl目标未知, 后端会再次重定向; 这里暂时用pc+4(不会执行到)
            firstFaultTarget := pc + 4.U
          }.elsewhen(notCfiFault) {
            // 非CFI但预测跳了, 正确目标是fallThrough
            firstFaultTarget := pred.fallThrough
          }
        }
      }
    }
 
    // ==================== 故障处理 ====================
    when(firstFaultValid) {
      // 1. 截断入队: 故障位置之后的指令不进IBuffer
      for (i <- 0 until fetchWidth) {
        when(i.U > firstFaultIdx) {
          stageData.enqMask(i) := false.B
        }
      }
      // 对于notCfiFault, 故障位置本身也不该跳, 但指令本身是有效的
      // 如果是jalFault/jalrFault, 故障位置的那条指令可以入队(后续会重定向)
 
      // 2. 发起前端重定向
      stageData.frontendRedirect.valid  := true.B
      stageData.frontendRedirect.target := firstFaultTarget
 
      // 3. 生成BPU快速更新
      val faultPC = icache.addr + (firstFaultIdx << 2)
      stageData.bpuUpdate.valid  := true.B
      stageData.bpuUpdate.pc     := faultPC
      stageData.bpuUpdate.target := firstFaultTarget
      stageData.bpuUpdate.isJalr := firstFaultIsJalr
      stageData.bpuUpdate.isJal  := firstFaultIsJal
      stageData.bpuUpdate.isCall := firstFaultIsCall
      stageData.bpuUpdate.isRet  := firstFaultIsRet
      stageData.bpuUpdate.offset := firstFaultIdx
      stageData.bpuUpdate.taken  := true.B  // 发现必跳错误, 更新为taken
      stageData.bpuUpdate.rasTop := pred.meta.rasTop
    }
 
  }.elsewhen(outFire) {
    stageValid := false.B
  }
}