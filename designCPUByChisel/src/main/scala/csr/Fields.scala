// package nscscc.csr
// 
// import chisel3._
// import nscscc.csr.Field


// sealed trait CsrAccess
// object CsrAccess {
//   case object RW extends CsrAccess  // 读写
//   case object R  extends CsrAccess  // 只读，读返回真实值，写忽略
//   case object RO extends CsrAccess  // 读恒0，写忽略
//   case object W1 extends CsrAccess  // 写1触发副作用，读恒0（副作用在CsrFile实现）
// }
// 
// class CsrField(h: Int, l: Int, val access: CsrAccess = CsrAccess.RW)
//   extends Field(h, l) {
// 
//   import CsrAccess._
// 
//   def readVal: UInt = access match {
//     case RW | R => bits
//     case RO | W1 => 0.U(len.W)
//   }
// 
//   override def bind(u: UInt): Unit = access match {
//     case RW => bits := u(hsb, lsb)
//     case _  =>
//   }
// 
//   override def := (u: UInt): Unit = access match {
//     case RW => bits := u
//     case _  =>
//   }
// }

// abstract class CsrBundle(implicit p: Parameters) extends BundleSkel {
//   val writable: Boolean
//   def resetVal: UInt = 0.U(XLEN.W)
// 
//   // 从 Bundle 元素中提取所有 Field，按位置排序
//   private def sortedFields: Seq[Field] = {
//     val fs = this.getElements.collect { case f: Field => f }
//                  .sortWith(_.hsb > _.hsb)
//     // 检查字段不重叠
//     fs.sliding(2).foreach {
//       case Seq(hi, lo) =>
//         require(hi.lsb > lo.hsb,
//           s"Field overlap in ${this.getClass.getSimpleName}: " +
//           s"[${hi.hsb}:${hi.lsb}] and [${lo.hsb}:${lo.lsb}]")
//       case _ =>
//     }
//     fs
//   }
// 
//   // 自动拼接：字段按位置排列，缝隙填0，read-only 字段用 readVal（CsrField 才有）
//   def toUInt: UInt = {
//     val parts = collection.mutable.ArrayBuffer[UInt]()
//     var cursor = XLEN
//     for (f <- sortedFields) {
//       val gap = cursor - f.hsb - 1
//       if (gap > 0) parts += 0.U(gap.W)
//       parts += (f match {
//         case cf: CsrField => cf.readVal
//         case _            => f.bits
//       })
//       cursor = f.lsb
//     }
//     if (cursor > 0) parts += 0.U(cursor.W)
//     Cat(parts.toSeq)
//   }
// 
//   // 软件写：通过每个字段的 bind 方法，access 决定是否实际写入
//   def bindFrom(u: UInt): this.type = {
//     if (writable) {
//       this.getElements.foreach {
//         case f: Field => f.bind(u)
//         case _ =>
//       }
//     }
//     this
//   }
// 
//   // 复位值切片初始化
//   def init: this.type = {
//     val w = Wire(this)
//     val rv = resetVal
//     w.getElements.foreach {
//       case f: Field => f.bits := rv(f.hsb, f.lsb)
//       case _ =>
//     }
//     w.asInstanceOf[this.type]
//   }
// }

// object CsrBundles {
//  import CsrAccess._
//
//  class CrmdBundle extends CsrBundle {
//    val writable = true
//    val plv  = new CsrField(1, 0, RW)
//    val ie   = new CsrField(2, 2, RW)
//    val da   = new CsrField(3, 3, RW)
//    val pg   = new CsrField(4, 4, RW)
//    val datf = new CsrField(6, 5, RW)
//    val datm = new CsrField(8, 7, RW)
//    // 自动填充 [31:9]=0，不需要 fieldLayout
//    override def resetVal = "h0000_0008".U(XLEN.W)
//  }
// }
//

// class CsrFile(implicit p: Parameters) extends NSModule {
//   val io = IO(new CsrFileIo)
// 
//   // 和之前完全一样
//   val crmd      = RegInit(new CrmdBundle().init)
//   val prmd      = RegInit(new PrmdBundle().init)
//   val ecfg      = RegInit(new EcfgBundle().init)
//   val estat     = RegInit(new EstatBundle().init)
//   val era       = RegInit(new EraBundle().init)
