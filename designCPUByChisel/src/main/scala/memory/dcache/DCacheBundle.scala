package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
 
// ===== MSHR 请求类型 =====
object MshrReqType {
  val width = 3
  val refillLoad   = 0.U(width.W)
  val refillStore  = 1.U(width.W)
  val uncacheRead  = 2.U(width.W)
  val uncacheWrite = 3.U(width.W)
}
 
// ===== DCache Meta 表项 =====
class DCacheMetaEntry(implicit p: Parameters) extends NSBundle {
  val valid = Bool()
  val dirty = Bool()
  val tag   = UInt(tagBits.W)
  def toUInt: UInt = Cat(valid, dirty, tag)
  def fromUInt(value: UInt): DCacheMetaEntry = {
    val result = Wire(new DCacheMetaEntry)
    result.valid := value(tagBits + 1)
    result.dirty := value(tagBits)
    result.tag   := value(tagBits - 1, 0)
    result
  }
  def metaWidth: Int = tagBits + 2
}
 
// ===== Array 读取响应 =====
class DCacheArrayReadData(implicit p: Parameters) extends NSBundle {
  val ways = Vec(nWays, new Bundle {
    val valid = Bool()
    val dirty = Bool()
    val tag   = UInt(tagBits.W)
    val data  = UInt((blockBytes * 8).W)
  })
}
 
// ===== 流水线→MSHR 的 Miss 请求 =====
class MissReq(implicit p: Parameters) extends NSBundle {
  val paddr       = UInt(XLEN.W)
  val lqIdx       = UInt(log2Ceil(LqSize).W)
  val sqIdx       = UInt(log2Ceil(SqSize).W)
  val robIdx      = new RobPtr(RobSize)
  val lsuOp       = UInt(LsuOp.width.W)
  val storeData   = UInt(XLEN.W)
  val victimWay   = UInt(wayBits.W)   // 由 S0 Replacer 决定
  val isLoad      = Bool()
  val isStore     = Bool()
  val cacheable   = Bool()
}
 
// ===== MSHR→流水线的 Replay 请求 =====
class ReplayReq(implicit p: Parameters) extends NSBundle {
  val paddr       = UInt(XLEN.W)
  val lqIdx       = UInt(log2Ceil(LqSize).W)
  val sqIdx       = UInt(log2Ceil(SqSize).W)
  val robIdx      = new RobPtr(RobSize)
  val lsuOp       = UInt(LsuOp.width.W)
  val storeData   = UInt(XLEN.W)
  val isLoad      = Bool()
  val isStore     = Bool()
}
 
// ===== 二级 MSHR 分配请求 =====
class SecondaryAllocReq(implicit p: Parameters) extends NSBundle {
  val replayReq   = new ReplayReq
  val primaryId   = UInt(log2Ceil(2).W)
}