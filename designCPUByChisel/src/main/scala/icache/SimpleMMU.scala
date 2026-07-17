package nscscc.icache

import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.mmu.MmuTransError
import nscscc.config.NSModule
import nscscc.config.NSBundle
import nscscc.mmu._
import nscscc.backend.decode._
class DcacheMmuTransError(implicit p: Parameters) extends NSBundle {
  /* tlbRefill : refill
   * excpPif   : tlb hit but invalid
   * excpPpi   : unprivilege
   */
  val excpTlbRefill = Bool()
  val excpTlbPif    = Bool()
  val excpTlbPpi    = Bool()
  val excpAdef      = Bool()
  val excpAle      = Bool()
  def getAnyError: Bool = excpTlbRefill || excpTlbPif || excpTlbPpi || excpAdef || excpAle
}

class SimpleMMU(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    val mmuReq  =Flipped( Decoupled(new SqToMmuReq) )
    val mmuResp =  Decoupled(new MmuToSqResp)

  })
  
  // 内部寄存器：延迟2个周期
  val stage1_valid = RegInit(false.B)
  val stage1_vaddr = RegInit(0.U(32.W))
  val stage1_sq    = RegInit(0.U(log2Ceil(SqSize).W))
  val stage1_lsuOp = RegInit(0.U(LsuOp.width.W))
  val stage2_valid = RegInit(false.B)
  val stage2_vaddr = RegInit(0.U(32.W))
  val stage2_lsuOp = RegInit(0.U(LsuOp.width.W))
  val stage2_sq    = RegInit(0.U(log2Ceil(SqSize).W))

  
  // 请求处理
  io.mmuReq.ready := true.B
  when(io.mmuReq.valid) {
    stage1_valid := true.B
    stage1_vaddr := io.mmuReq.bits.vaddr
    stage1_lsuOp := io.mmuReq.bits.lsuOp
    //stage1_sq := io.mmuReq.bits.sqIdx
  }.otherwise {
    stage1_valid := false.B
  }
  
  // 第二级流水
  stage2_valid := stage1_valid
  stage2_vaddr := stage1_vaddr
  stage2_lsuOp := stage1_lsuOp

  val DcacheMmuError = WireDefault(0.U.asTypeOf(new DcacheMmuTransError))
  //根据stage1_lsuOp和stage1_vaddr判断是否有异常
  //其中stage1_lsuOp的样子是：
  /*
  object LsuOp {
  val width = 4
  val none = 0.U(width.W)
  val ldb  = 1.U(width.W)
  val ldh  = 2.U(width.W)
  val ldw  = 3.U(width.W)
  val stb  = 4.U(width.W)
  val sth  = 5.U(width.W)
  val stw  = 6.U(width.W)
  val ldbu = 7.U(width.W)
  val ldhu = 8.U(width.W)
 }
  
  */
  
  // 根据 stage1_lsuOp 和 stage1_vaddr 判断是否有异常
  // 1. 识别访存宽度
  val isHalfWord = stage1_lsuOp === LsuOp.ldh || stage1_lsuOp === LsuOp.sth || stage1_lsuOp === LsuOp.ldhu
  val isWord     = stage1_lsuOp === LsuOp.ldw || stage1_lsuOp === LsuOp.stw

  // 2. 判断是否非对齐
  val unalignedHalf = isHalfWord && stage1_vaddr(0) =/= 0.U
  val unalignedWord = isWord     && stage1_vaddr(1, 0) =/= 0.U

  // 3. 赋值异常信号（必须确保当前流水级是 valid 的，否则会产生伪异常）
  DcacheMmuError.excpAle := (unalignedHalf || unalignedWord) && stage1_valid



  
  // 响应输出
  io.mmuResp.valid := stage1_valid
  io.mmuResp.bits.paddr := stage1_vaddr  // 恒等映射
  //io.mmuResp.bits.sqIdx := stage1_sq  // 恒等映射
  io.mmuResp.bits.cacheable := stage1_vaddr(31,16) =/= 0xbfaf.U    //true.B   // 默认cached
  io.mmuResp.bits.hasError := false.B   // 默认cached
  io.mmuResp.bits.error := DcacheMmuError      // 默认无错误
}