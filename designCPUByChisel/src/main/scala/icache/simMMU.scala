package nscscc.icache

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
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
  when(io.mmu.req.valid) {
    stage1_valid := true.B
    stage1_vaddr := io.mmu.req.vaddr
  }.otherwise {
    stage1_valid := false.B
  }
  
  // 第二级流水
  stage2_valid := stage1_valid
  stage2_vaddr := stage1_vaddr
  
  // 响应输出
  io.mmu.resp.valid := stage1_valid
  io.mmu.resp.data.paddr := stage1_vaddr  // 恒等映射
  io.mmu.resp.data.uncached := false.B   // 默认cached
  io.mmu.resp.data.error := false.B      // 默认无错误
  
  println("SimpleMMU instantiated with 2-cycle latency")
}
