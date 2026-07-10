package nscscc.config
import chisel3._
import chisel3.util._
import nscscc.config.Parameters
import nscscc.config.NSBundle
 import nscscc.CoreSimu.config
 
object ExcType extends Enumeration {
  type ExcType = Value
  // 枚举值 = 位向量位号 = 优先级（0最高）
  val INT    = Value(0)   // 中断
  val ADEF   = Value(1)   // IF: 指令地址非对齐
  val TLBR_I = Value(2)   // IF: 取指TLB重填
  val PIF    = Value(3)   // IF: 取旨页失效
  val PPI_I  = Value(4)   // IF: 取旨特权级违规
  val SYS    = Value(5)   // ID: syscall
  val BRK    = Value(6)   // ID: break
  val INE    = Value(7)   // ID: 指令不存在
  val IPE    = Value(8)   // ID: 指令特权级违规
  val ALE    = Value(9)   // EX: 数据地址非对齐
  val RESV   = Value(10)  // 保留
  val TLBR_D = Value(11)  // MEM: 数据TLB重填
  val PME    = Value(12)  // MEM: 页修改异常
  val PPI_D  = Value(13)  // MEM: 数据特权级违规
  val PIS    = Value(14)  // MEM: 存储页失效
  val PIL    = Value(15)  // MEM: 加载页失效
 
  /** 位号 → ECODE 映射（纯 Scala Int，对应 LA32 手册 / la500 csr.h） */
  def ecodeInt(exc: ExcType): Int = exc match {
    case INT    => 0x00 //中断。
    case PIL    => 0x01 //load操作页无效例外
    case PIS    => 0x02 // store操作页无效例外
    case PIF    => 0x03 //取指操作页无效例外
    case PME    => 0x04 //页修改例外
    case TLBR_I => 0x3f // TLB 重填例外
    case PPI_I  => 0x07 //页特权等级不合规例外
    case PPI_D  => 0x07 //页特权等级不合规例外
    case ADEF   => 0x08 //取指地址错例外
    case ALE    => 0x09 //地址非对齐例外
    case SYS    => 0x0b
    case BRK    => 0x0c
    case INE    => 0x0d
    case IPE    => 0x0e
    case TLBR_D => 0x3f //TLB 重填例外
    case RESV   => 0x00
  }
 
  /** 哪些异常需要写入 BADV（纯 Scala Boolean） */
  def needsBadv(exc: ExcType): Boolean = exc match {
    case ADEF | ALE | TLBR_I | TLBR_D | PIF | PIS | PIL | PPI_I | PPI_D | PME => true
    case _ => false
  }
 
  /** 哪些异常是 TLB 重填类（纯 Scala Boolean） */
  def isTlbRefill(exc: ExcType): Boolean = exc match {
    case TLBR_I | TLBR_D => true
    case _ => false
  }
 
  /** 哪些异常是数据类（需用 badv 而非 pc） */
  def isDataExc(exc: ExcType): Boolean = exc.id >= TLBR_D.id
}

import ExcType._

class ExceptionBundle extends Bundle {
  val excpVec = UInt(16.W)
 
  /** 是否有任何异常 */
  def hasException: Bool = excpVec =/= 0.U
 
  /** 按枚举名查询某位 */
  def has(exc: ExcType): Bool = excpVec(exc.id)
 
 
  def mergeMany(base: UInt, pairs: (Bool, ExcType)*): UInt = {
    pairs.foldLeft(base) { case (vec, (cond, exc)) =>
      vec | Mux(cond, 1.U << exc.id.U, 0.U)
    }
  }

 
  /** 透传并追加新异常（返回新的 ExceptionBundle） */
//  def merge(exc: ExcType): ExceptionBundle = {
//    val out = Wire(new ExceptionBundle)
//    out.excpVec := setOn( ,exc)
//    out
//  }
 
  /** 优先级编码：返回最高优先级异常的位号（0 = 最高） */
  def highestPriority: UInt = {
    MuxCase(0.U, (0 until 16).reverse.map { i =>
      excpVec(i) -> i.U
    })
  }
 
  /** 直接输出最高优先级异常的 ECODE */
  def ecode: UInt = {
    val pri = highestPriority
    MuxLookup(pri, 0.U, ExcType.values.toSeq.map { exc =>
      exc.id.U -> ExcType.ecodeInt(exc).U(6.W)
    })
  }
 
  /** 是否为 TLB 重填异常 */
  def isTlbRefill: Bool = has(TLBR_I) || has(TLBR_D)
 
  /** 取最高优先级异常对应的 BADV 写入值 */
  def badvSelect(pc: UInt, badv: UInt): UInt = {
    val pri = highestPriority
    Mux(pri >= ExcType.TLBR_D.id.U, badv, pc)
  }
 
  /** 取最高优先级异常的 VPPN */
  def vppnSelect(pc: UInt, badv: UInt): UInt = {
    badvSelect(pc, badv)(31, 13)
  }
}
 
object ExceptionBundle {
  def default: ExceptionBundle = {
    val e = Wire(new ExceptionBundle)
    e.excpVec := 0.U
    e
  }
}