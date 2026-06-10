package nscscc.icache

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.mmu.MmuTransError
import nscscc.config.NSModule
import nscscc.config.NSBundle
class SimpleMMU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val mmu = Flipped(new MMURead)
  })
  
  // 内部寄存器：延迟2个周期
  val stage1_valid = RegInit(false.B)
  val stage1_vaddr = Reg(UInt(32.W))
  val stage2_valid = RegInit(false.B)
  val stage2_vaddr = Reg(UInt(32.W))
  
  // 请求处理
  io.mmu.toMmu.ready := true.B
  when(io.mmu.toMmu.valid) {
    stage1_valid := true.B
    stage1_vaddr := io.mmu.toMmu.bits.vaddr
  }.otherwise {
    stage1_valid := false.B
  }
  
  // 第二级流水
  stage2_valid := stage1_valid
  stage2_vaddr := stage1_vaddr
  
  // 响应输出
  io.mmu.fromMmu.valid := stage1_valid
  io.mmu.fromMmu.bits.paddr := stage1_vaddr  // 恒等映射
  io.mmu.fromMmu.bits.cacheable := true.B   // 默认cached
  io.mmu.fromMmu.bits.hasError := false.B   // 默认cached
  io.mmu.fromMmu.bits.error := 0.U.asTypeOf(new MmuTransError)      // 默认无错误
  
  println("SimpleMMU instantiated with 2-cycle latency")
}