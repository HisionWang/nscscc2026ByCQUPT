package nscscc.icache

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.mmu.MmuTransError
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.mmu._
class SimpleMMU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val mmuReq  =Flipped( Decoupled(new SqToMmuReq) )
    val mmuResp =  Decoupled(new MmuToSqResp)

  })
  
  // 内部寄存器：延迟2个周期
  val stage1_valid = RegInit(false.B)
  val stage1_vaddr = Reg(UInt(32.W))
  val stage1_sq = Reg(UInt(log2Ceil(SqSize).W))
  val stage2_valid = RegInit(false.B)
  val stage2_vaddr = Reg(UInt(32.W))
  val stage2_sq = Reg(UInt(log2Ceil(SqSize).W))

  
  // 请求处理
  io.mmuReq.ready := true.B
  when(io.mmuReq.valid) {
    stage1_valid := true.B
    stage1_vaddr := io.mmuReq.bits.vaddr
    //stage1_sq := io.mmuReq.bits.sqIdx
  }.otherwise {
    stage1_valid := false.B
  }
  
  // 第二级流水
  stage2_valid := stage1_valid
  stage2_vaddr := stage1_vaddr
  
  // 响应输出
  io.mmuResp.valid := stage1_valid
  io.mmuResp.bits.paddr := stage1_vaddr  // 恒等映射
  //io.mmuResp.bits.sqIdx := stage1_sq  // 恒等映射
  io.mmuResp.bits.cacheable := stage1_vaddr(31,16) =/= 0xbfaf.U    //true.B   // 默认cached
  io.mmuResp.bits.hasError := false.B   // 默认cached
  io.mmuResp.bits.error := 0.U.asTypeOf(new MmuTransError)      // 默认无错误
}