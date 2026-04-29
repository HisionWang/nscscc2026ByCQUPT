import chisel3._
import chisel3.util._
import config.Parameters
import config._
import config.NSModule
import config.NSBundle

class arrayReadData(implicit p: Parameters) extends  NSBundle{

  val cacheLine = 
    Vec(nWays, new Bundle { 
      val has  = Bool()
      val tag  = UInt(tagBits.W)
      val data = UInt((blockBytes * 8).W)
    })
}

class ICacheArrayRead(implicit p: Parameters) extends NSBundle {

  val req   = new Bundle{
    val valid = Output(Bool())
    val idx = Output(UInt(idxBits.W))
  }

  val resp    = new Bundle{
    val valid = Input(Bool())
    val data  = Input(new arrayReadData)
  }

}

class ICacheArrayWrite(implicit p: Parameters) extends NSBundle {

    val valid = Output( Bool() )
    val idx   = Output( UInt(idxBits.W) )
    val way = Output(UInt(wayBits.W))
    val tag   = Output( UInt(tagBits.W) )
    val data  = Output( UInt((blockBytes * 8).W) )

}

class victimRead(implicit p: Parameters) extends NSBundle {

    val req  = Output(Bool())
    val idx  = Output(UInt(idxBits.W))
    val resp = Input(UInt(wayBits.W))
}

class victimChange(implicit p: Parameters) extends NSBundle {

    val valid = Output(Bool())
    val idx   = Output(UInt(idxBits.W))
    val way   = Output(UInt(wayBits.W))
}

class MMURead(implicit p: Parameters) extends NSBundle {
  // 请求
  val req = Output(new Bundle {
    val vaddr = UInt(32.W)     // 虚拟地址
    val valid = Bool()         // 转换请求有效
  })
  // 响应
  val resp = Input(new Bundle {
    val valid    = Bool()      // 转换结果有效
    val data =  new Bundle {
        val paddr    = UInt(32.W)  // 物理地址
        val uncached = Bool()      // 是否为uncached访问
        val error    = Bool()      // 转换错误(如TLB缺失)，我不清楚是否只有这一个异常，如果有很多那这个信号的位数不止一位
    }
  })
}