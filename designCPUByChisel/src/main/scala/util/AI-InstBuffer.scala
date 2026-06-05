package nscscc.util

// 文件: cpu/frontend/InstBuffer.scala
 
package cpu.frontend
 
import chisel3._
import chisel3.util._
import nscscc.util.CircularQueue
 
/**
 * 指令缓冲区 (Instruction Buffer)
 *
 * 【在CPU中的位置】
 *   前端流水线: IFU(取指) → [InstBuffer] → IDU(译码)
 *
 * 【作用】
 *   IFU和IDU的吞吐量不同（IFU可能一次取4条指令，IDU可能一次译码2条），
 *   InstBuffer就是它们之间的"蓄水池"：
 *   - IFU产生的指令多时，存在buffer里慢慢消化
 *   - IFU暂时取不到指令时（icache miss），buffer里还有存货给IDU用
 *
 * 【设计参数】
 *   entries: 缓冲区深度，默认32（必须是2的幂）
 *   fetchWidth: IFU每周期最多送入几条指令
 *   decodeWidth: IDU每周期最多取走几条指令
 */
class InstBufferEntry extends Bundle {
  /** 指令本身的32位编码 */
  val inst    = UInt(32.W)
  /** 这条指令的PC值 */
  val pc      = UInt(64.W)
  /** 这条指令是否有效（可能取到了无效位置） */
  val valid   = Bool()
  /** 是否是预测的分支跳转指令 */
  val brTaken = Bool()
  /** 如果是分支，跳转目标地址 */
  val brTarget = UInt(64.W)
}
 
class InstBuffer(
  val fetchWidth:  Int = 4,   // IFU每周期送入4条指令
  val decodeWidth: Int = 2,   // IDU每周期取走2条指令
  val entries:     Int = 32   // 缓冲32条指令
) extends Module {
  val io = IO(new Bundle {
    /** 来自IFU的指令输入，fetchWidth路 */
    val in  = Vec(fetchWidth,  Flipped(DecoupledIO(new InstBufferEntry)))
    /** 送往IDU的指令输出，decodeWidth路 */
    val out = Vec(decodeWidth, DecoupledIO(new InstBufferEntry))
    /** 缓冲区是否为空（前端饥饿信号，用于性能监控） */
    val isEmpty = Output(Bool())
    /** 缓冲区是否快满了（反压信号，告诉IFU别再取了） */
    val almostFull = Output(Bool())
  })
 
  // ---- 使用 CircularQueue ----
  // 就这么一行！队列的所有管理逻辑（指针、空满、入队出队）都被封装了
  val queue = Module(new CircularQueue(
    gen     = new InstBufferEntry,
    entries = entries,
    enqWidth = fetchWidth,
    deqWidth = decodeWidth
  ))
 
  // 连接入队端口
  for (i <- 0 until fetchWidth) {
    queue.io.enq(i) <> io.in(i)
  }
 
  // 连接出队端口
  for (i <- 0 until decodeWidth) {
    io.out(i) <> queue.io.deq(i)
  }
 
  // 状态信号
  io.isEmpty    := queue.io.empty
  io.almostFull := queue.io.count > (entries - fetchWidth).U
}