package nscscc.mem.dcache
 
import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.backend.decode._
import nscscc.backend.rename._
 
object MshrReqType {
  val width = 2
  val cacheable    = 0.U(width.W)
  val uncacheRead  = 1.U(width.W)
  val uncacheWrite = 2.U(width.W)
}
 
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
 
class DCacheArrayReadData(implicit p: Parameters) extends NSBundle {
  val ways = Vec(nWays, new Bundle {
    val valid = Bool()
    val dirty = Bool()
    val tag   = UInt(tagBits.W)
    val data  = UInt((blockBytes * 8).W)
  })
}