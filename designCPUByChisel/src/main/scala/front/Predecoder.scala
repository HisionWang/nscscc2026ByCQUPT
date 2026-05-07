import chisel3._
import chisel3.util._
import config.Parameters
import config.NSModule
import config.NSBundle
import ICacheBunble._
// 专用跳转预译码信息
class PredecodeInfo(implicit p: Parameters) extends NSBundle {
  // 指令类型快速识别
  val isJAL     = Bool()  // 直接跳转
  val isJALR    = Bool()  // 间接跳转
  val isBranch  = Bool()  // 条件分支
  val isCall    = Bool()  // 调用 (JAL with rd=x1/5)
  val isReturn  = Bool()  // 返回 (JALR with rs1=x1/5, rd=x0, imm=0)

  // 目标地址计算信息
  val branchOffset = SInt(13.W)  // B-Type 偏移量（12位符号扩展 + 1位对齐）
  val jalOffset    = SInt(21.W)  // J-Type 偏移量（20位符号扩展 + 1位对齐）
  val immIJ        = SInt(12.W)  // I-Type/JALR 立即数（12位符号扩展）

  // 寄存器信息（用于JALR和分支）
  val rs1         = UInt(5.W)   // 基址寄存器（用于JALR）
  val rs2         = UInt(5.W)   // 源寄存器2（用于分支比较）
  val branchFunct3 = UInt(3.W)  // 分支条件码

  // 原始PC（用于目标地址计算）
  val pc          = UInt(32.W)
}

// 模块输出接口
class PredecodeResp(implicit p: Parameters) extends NSBundle {
  val insts        = Output( Vec(fetchWidth, UInt(32.W)))       // 原始指令（透传）
  val instvalids   = Output( Vec(fetchWidth, Bool()))           // 指令有效位（透传）
  val jumpInfo     = Output( Vec(fetchWidth, new PredecodeInfo)) // 跳转预译码信息
  val hasJump      = Output( Vec(fetchWidth, Bool()))           // 标记该指令是否为任何类型的跳转
  val addr         = Output( UInt(32.W))                        // 虚拟地址（透传）
  val miss         = Output( Bool())                            // 缓存缺失（透传）
  val uncached     = Output( Bool())                            // 非缓存访问（透传）
  val mmu_error    = Output( Bool())                            // MMU异常（透传）
}

// 专用跳转预译码模块
class Predecoder(implicit p: Parameters) extends NSModule {

  val io = IO(new Bundle {
    // 输入接口
    val in = Flipped(DecoupledIO(new IcacheResp))
    // 输出接口
    val out = DecoupledIO(new PredecodeResp)
    // 控制信号
    val flush = Input(Bool())
  })

  // ==================== 一级流水线寄存器 ====================
  val stageValid = RegInit(false.B)
  val stageData = Reg(new PredecodeResp)

  // ==================== 流水线控制逻辑 ====================
  val inFire = io.in.valid && io.in.ready
  val outFire = io.out.valid && io.out.ready

  // 输入就绪条件：阶段寄存器为空 或 数据已被下游接收
  io.in.ready := !stageValid || outFire
  io.out.valid := stageValid
  io.out.bits := stageData

  // ==================== 流水线更新逻辑 ====================
  when(io.flush) {
    // 刷新时清空流水线
    stageValid := false.B
  }.elsewhen(inFire) {
    // 有新的有效输入，锁存并进行预译码
    stageValid := true.B
    val icache = io.in.bits

    // 透传原始数据
    stageData.insts := icache.instrs
    stageData.instvalids := icache.instvalids
    stageData.addr := icache.addr
    stageData.miss := icache.miss
    stageData.uncached := icache.uncached
    stageData.mmu_error := icache.mmu_error

    // 对每条有效指令进行快速跳转预译码
    for (i <- 0 until fetchWidth) {
      val instr = icache.instrs(i)
      val pc = icache.addr + (i * 4).U
      val info = stageData.jumpInfo(i)
      val isValid = icache.instvalids(i)

      // 默认值：非跳转指令
      when(!isValid) {
        stageData.hasJump(i) := false.B
        info := 0.U.asTypeOf(new PredecodeInfo)
        info.pc := pc
      }.otherwise {
        // 提取关键字段（仅需 opcode 和部分必要位）
        val opcode = instr(6, 0)
        val rd = instr(11, 7)
        val funct3 = instr(14, 12)
        val rs1 = instr(19, 15)
        val rs2 = instr(24, 20)

        // 保存PC用于目标地址计算
        info.pc := pc

        // --- 快速指令类型识别（并行判断）---
        val isJAL    = (opcode === "b1101111".U)  // JAL
        val isJALR   = (opcode === "b1100111".U) && (funct3 === 0.U)  // JALR
        val isBranch = (opcode === "b1100011".U)  // 条件分支

        info.isJAL    := isJAL
        info.isJALR   := isJALR
        info.isBranch := isBranch

        // 特殊调用/返回模式识别
        info.isCall   := isJAL && (rd === 1.U || rd === 5.U)  // JAL with rd=x1(ra) or x5(t0)
        info.isReturn := isJALR && (rs1 === 1.U || rs1 === 5.U) && 
                        (rd === 0.U) && (instr(31, 20) === 0.U)  // JALR x0, rs1(x1/x5), 0

        // --- 提取目标地址计算信息 ---
        // 1. 提取分支偏移量（B-type: imm[12|10:5|4:1|11]）
        val bImm12 = instr(31)
        val bImm11 = instr(7)
        val bImm10_5 = instr(30, 25)
        val bImm4_1 = instr(11, 8)
        val bImmRaw = Cat(bImm12, bImm11, bImm10_5, bImm4_1, 0.U(1.W))
        info.branchOffset := Cat(Fill(19, bImmRaw(11)), bImmRaw).asSInt // 符号扩展为13位

        // 2. 提取JAL偏移量（J-type: imm[20|10:1|11|19:12]）
        val jImm20 = instr(31)
        val jImm19_12 = instr(19, 12)
        val jImm11 = instr(20)
        val jImm10_1 = instr(30, 21)
        val jImmRaw = Cat(jImm20, jImm19_12, jImm11, jImm10_1, 0.U(1.W))
        info.jalOffset := Cat(Fill(11, jImmRaw(20)), jImmRaw).asSInt // 符号扩展为21位

        // 3. 提取I-Type/JALR立即数（I-type: imm[11:0]）
        info.immIJ := Cat(Fill(20, instr(31)), instr(31, 20)).asSInt // 符号扩展为12位

        // --- 保存寄存器信息 ---
        info.rs1 := rs1
        info.rs2 := rs2
        info.branchFunct3 := funct3

        // 标记该指令是否为任何类型的跳转
        stageData.hasJump(i) := isJAL || isJALR || isBranch

        // --- 调试输出 ---
        //when(isJAL || isJALR || isBranch) {
        //  printf(p"[JumpPredecoder] PC=0x${Hexadecimal(pc)}: ")
        //  when(isJAL) {
        //    printf(p"JAL, offset=0x${Hexadecimal(info.jalOffset.asUInt)}, ")
        //    when(info.isCall) { printf("(CALL) ") }
        //  }
        //  when(isJALR) {
        //    printf(p"JALR, rs1=x${info.rs1}, imm=0x${Hexadecimal(info.immIJ.asUInt)}, ")
        //    when(info.isReturn) { printf("(RET) ") }
        //  }
        //  when(isBranch) {
        //    printf(p"B${funct3}, rs1=x${info.rs1}, rs2=x${info.rs2}, offset=0x${Hexadecimal(info.branchOffset.asUInt)}")
        //  }
        //  printf("\n")
        //}
      }
    }

    // 流水线接收日志
    printf(p"[JumpPredecoder] Stage fired. Base PC=0x${Hexadecimal(icache.addr)}, " +
           p"jumps detected at indices: ${stageData.hasJump.asUInt}\n")

  }.elsewhen(outFire) {
    // 数据被下游接收，清空本级
    stageValid := false.B
  }

  // ==================== 模块实例化信息 ====================
  println("JumpPredecoder instantiated:")
  println(s"  Fetch Width: $fetchWidth")
  println(s"  Pipeline Stages: 1")
  println(s"  Focus: Control-flow instructions (JAL, JALR, Branch) only")
  println(s"  Output: Target offset, register indices, quick call/return detection")
}