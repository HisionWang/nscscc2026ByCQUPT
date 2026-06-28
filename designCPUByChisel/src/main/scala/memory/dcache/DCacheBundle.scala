package nscscc.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
 
// MSHR 请求类型
object MshrReqType {
  val width = 3
  val refillLoad  = 0.U(width.W)
  val refillStore = 1.U(width.W)
  val writeback   = 2.U(width.W)
  val uncacheRead = 3.U(width.W)
  val uncacheWrite = 4.U(width.W)
}
 
// DCache Meta 表项
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
 
// Array 读取响应数据
class DCacheArrayReadData(implicit p: Parameters) extends NSBundle {
  val ways = Vec(nWays, new Bundle {
    val valid = Bool()
    val dirty = Bool()
    val tag   = UInt(tagBits.W)
    val data  = UInt((blockBytes * 8).W)
  })
}
 
// MSHR 请求（从流水线发往 MSHR）
class MshrRequest(implicit p: Parameters) extends NSBundle {
  val reqType     = UInt(MshrReqType.width.W)
  val paddr       = UInt(XLEN.W)
  val lqIdx       = UInt(log2Ceil(LqSize).W)
  val sqIdx       = UInt(log2Ceil(SqSize).W)
  val robIdx      = new RobPtr(RobSize)
  val lsuOp       = UInt(LsuOp.width.W)
  val storeData   = UInt(XLEN.W)
  val victimWay   = UInt(wayBits.W)
  val victimDirty = Bool()
  val victimTag   = UInt(tagBits.W)
  val victimData  = UInt((blockBytes * 8).W)
  val cacheable   = Bool()
}