package nscscc.backend.execute
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.csr._
import nscscc.backend.decode._
import nscscc.backend.dispatch.DispatchedInst
 
// ═══════════════════════════════════════════════════════════════
//  CSR 执行单元
//
//  支持操作：CSRRD  → 读取CSR旧值 → rd
//            CSRWR  → 将rd旧值写入CSR，CSR旧值 → rd
//            CSRXCHG → 按rj掩码将rd旧值写入CSR对应位，CSR旧值 → rd
//
//  单周期组合逻辑完成。
//  CSR 的真正写操作在提交阶段进行，此处只计算新值并传递。
//
//  LoongArch 规定：
//  - 访问未定义/未实现的CSR：读返回全0，写不修改任何状态
// ═══════════════════════════════════════════════════════════════
class CSRUnit(implicit p: Parameters) extends NSModule with HasCsrParameters {
  val io = IO(new Bundle {
    val valid    = Input(Bool())
    val uop      = Input(new DispatchedInst)
    val rs1      = Input(UInt(XLEN.W))   // CSRWR/CSRXCHG: rd 的旧值
    val rs2      = Input(UInt(XLEN.W))   // CSRXCHG: rj 的掩码值
    val csrRdata = Input(UInt(XLEN.W))   // 从 CSR 寄存器堆读回的数据
 
    val result   = Output(UInt(XLEN.W))  // CSR 旧值 → 写入 rd
    val csrWen   = Output(Bool())        // 是否需要在提交时写 CSR
    val csrWdata = Output(UInt(XLEN.W))  // CSR 新值（提交时写入）
    val timerInfo =        Input(new TimerBundle)
  })
 
  val op     = io.uop.ctrl.csrOp
  val csrOld = io.csrRdata

  val cpuCfg = Module(new CpuCfg)
  cpuCfg.io.addr := io.rs1  // rs1 = rj 的值（配置字号）
  val cpucfgResult = cpuCfg.io.rdata


   // CsrOp.rdcntvl -> io.timerInfo.timer(31,0),
   // CsrOp.rdcntvh  -> io.timerInfo.timer(63,32),
   // CsrOp.rdcntid  -> io.timerInfo.tid,

 
  // ── CSR 新值计算 ──
  // CSRRD:  不写CSR，新值无意义
  // CSRWR:  新值 = rd旧值（rs1）
  // CSRXCHG: 新值 = (rd旧值 & rj掩码) | (CSR旧值 & ~rj掩码)
  //          即掩码为1的位取rd值，掩码为0的位保持CSR原值
  val csrNew = MuxLookup(op, csrOld)(Seq(
    CsrOp.write -> io.rs2,
    CsrOp.xchg  -> ((io.rs1 & io.rs2) | (csrOld & ~io.rs1)),

  ))
 
  // ── 结果：CSR 旧值写入 rd ──
  // CSRRD / CSRWR / CSRXCHG 三种操作的返回值都是 CSR 旧值
  io.result := MuxLookup(op, csrOld)(Seq(
    CsrOp.rdcntvl -> io.timerInfo.timer(31, 0),
    CsrOp.rdcntvh -> io.timerInfo.timer(63, 32),
    CsrOp.rdcntid -> io.timerInfo.tid,
    CsrOp.cpucfg  -> cpucfgResult
  ))

  io.csrWen  := io.uop.ctrl.csrWen //(op === CsrOp.write) || (op === CsrOp.xchg)
  io.csrWdata := csrNew
}