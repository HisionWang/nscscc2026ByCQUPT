package nscscc.csr

import chisel3._
import chisel3.util._
import nscscc.config.Parameters

/* 
 * "W1: 软件写 1 有效。软件对这些域写 0 不会将其清 0，且不产生其它任何副作用。
 *  同时，定义为该属性的域的读出值没有任何软件意义，软件应该无视这些读出值。"
 *  TICLR.CLR 、LLBCTL.WCLLB
 *  由于写不会产生改变其值的副作用，因此实际上 wen=false
 */
// 默认RW，若为RO、W1需指定wen=false
// W1可直接不定义对应字段，写1时在CsrFile实现具体的效果即可
class CsrField(h: Int, l: Int, val wen: Boolean = true)
  extends Field(h, l)

/* CsrBundle
 * CSR寄存器的Bundle基类，包含字段定义和拼接逻辑
 * @writable: 是否可写
 * @fieldLayout: 字段布局，定义每个字段在32-bit中的位置和对应的bits
 * @toUInt: 将各字段拼接成32-bit的值
 * @bindFrom: 从32-bit的值中提取各字段的值并赋值
 * 
 * Usage: toUInt和bindFrom仅提供CSR整体读写的便利实现，为csr.rw指令提供
 * 若代码中需要使用到具体字段，任然需要直接访问对应字段
 */
abstract class CsrBundle(implicit p: Parameters) extends BundleSkel
{
  // TODO: 按照规范定义的CSR, 指定是否可写, 提供对应的字段声明，
  // 并实现fieldLayout, 部分字段涉及到特殊拼接，需单独定义。
  val writable: Boolean
  // val field1, fileds, ...
  
  // 和Field的lsb、hsb有点重复了
  protected def fieldLayout: List[((Int, Int), UInt)]

  // 将各字段拼接成32-bit的值，所有可读字段
  def toUInt: UInt = Cat(fieldLayout.map(_._2))
  // Note: writable指定CSR是否软件可写，bindFrom的实现任需考虑具体字段是否可写
  // 硬件读写特定字段时， 虽然有时候也能用, 但不要使用toUInt和bindFrom
  def bindFrom(u: UInt): this.type = {
    if (writable) {
      this.getElements.collect {
        case f: CsrField if f.wen => f.bind(u)
      }
    }
    this
  }
}

object CsrBundles {
  class CrmdBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val plv  = new CsrField(1, 0)
    val ie   = new CsrField(2, 2)
    val da   = new CsrField(3, 3)
    val pg   = new CsrField(4, 4)
    val datf = new CsrField(6, 5)
    val datm = new CsrField(8, 7)

    protected val fieldLayout = List(
      (31, 9) -> 0.U(23.W),
      (8,  7) -> datm.bits,
      (6,  5) -> datf.bits,
      (4,  4) -> pg.bits,
      (3,  3) -> da.bits,
      (2,  2) -> ie.bits,
      (1,  0) -> plv.bits
    )
  }

  class PrmdBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val pplv = new CsrField(1, 0)
    val pie  = new CsrField(2, 2)

    protected val fieldLayout = List(
      (31, 3) -> 0.U(29.W),
      (2,  2) -> pie.bits,
      (1,  0) -> pplv.bits
    )
  }

  class EcfgBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val lie0 = new CsrField(9, 0)
    val lie1 = new CsrField(12, 11)

    protected val fieldLayout = List(
      (31, 13) -> 0.U(19.W),
      (12, 11) -> lie1.bits,
      (10, 10) -> 0.U(1.W),
      (9,   0) -> lie0.bits
    )

    def lie: UInt = Cat(lie1.bits, 0.U(1.W), lie0.bits)
  }

  class EstatBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val is0      = new CsrField(1,  0 , wen = true)
    val is1      = new CsrField(9,  2 , wen = false)
    val is2      = new CsrField(11, 11, wen = false)
    val is3      = new CsrField(12, 12, wen = false)
    val ecode    = new CsrField(21, 16, wen = false)
    val esubcode = new CsrField(30, 22, wen = false)

    protected val fieldLayout = List(
      (31, 31) -> 0.U(1.W),
      (30, 22) -> esubcode.bits,
      (21, 16) -> ecode.bits,
      (15, 13) -> 0.U(3.W),
      (12, 12) -> is3.bits,
      (11, 11) -> is2.bits,
      (10, 10) -> 0.U(1.W),
      (9,   2) -> is1.bits,
      (1,   0) -> is0.bits
    )

    def is: UInt = Cat(is3.bits, is2.bits, 0.U(1.W), is1.bits, is0.bits)
  }

  class EraBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val pc = new CsrField(31, 0)

    protected val fieldLayout = List(
      (31, 0) -> pc.bits
    )
  }

  class BadvBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val vaddr = new CsrField(31, 0)

    protected val fieldLayout = List(
      (31, 0) -> vaddr.bits
    )
  }

  class EentryBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val va = new CsrField(31, 6)

    protected val fieldLayout = List(
      (31, 6) -> va.bits,
      (5,  0) -> 0.U(6.W)
    )
  }

  class TlbidxBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val index = new CsrField(4, 0)
    val ps    = new CsrField(29, 24)
    val ne    = new CsrField(31, 31)

    protected val fieldLayout = List(
      (31, 31) -> ne.bits,
      (30, 30) -> 0.U(1.W),
      (29, 24) -> ps.bits,
      (23,  5) -> 0.U(19.W),
      (4,   0) -> index.bits
    )
  }

  class TlbehiBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val vppn = new CsrField(31, 13)

    protected val fieldLayout = List(
      (31, 13) -> vppn.bits,
      (12,  0) -> 0.U(13.W)
    )
  }

  class TlbeloBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val v   = new CsrField(0, 0)
    val d   = new CsrField(1, 1)
    val plv = new CsrField(3, 2)
    val mat = new CsrField(5, 4)
    val g   = new CsrField(6, 6)
    val ppn = new CsrField(27, 8)

    protected val fieldLayout = List(
      (31, 28) -> 0.U(4.W),
      (27,  8) -> ppn.bits,
      (7,   7) -> 0.U(1.W),
      (6,   6) -> g.bits,
      (5,   4) -> mat.bits,
      (3,   2) -> plv.bits,
      (1,   1) -> d.bits,
      (0,   0) -> v.bits
    )
  }

  class AsidBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val asid     = new CsrField(9,  0 , wen = true)
    val asidbits = new CsrField(31, 24, wen = false)

    protected val fieldLayout = List(
      (31, 24) -> asidbits.bits,
      (23, 10) -> 0.U(14.W),
      (9,   0) -> asid.bits
    )
  }

  class SaveBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val data = new CsrField(31, 0)

    protected val fieldLayout = List(
      (31, 0) -> data.bits
    )
  }

  class TidBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val tid = new CsrField(31, 0)

    protected val fieldLayout = List(
      (31, 0) -> tid.bits
    )
  }

  class TcfgBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val en       = new CsrField(0, 0)
    val periodic = new CsrField(1, 1)
    val initval  = new CsrField(31, 2)

    protected val fieldLayout = List(
      (31, 2) -> initval.bits,
      (1,  1) -> periodic.bits,
      (0,  0) -> en.bits
    )
  }

  class TvalBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = false
    val tval = new CsrField(31, 0, wen = false)

    protected val fieldLayout = List(
      (31, 0) -> tval.bits
    )
  }

  // ticlr: clr[0] 写1触发清除 estat.is2 的副作用，自身寄存器"有形无用"
  // 软件写 clr 的效果在 CsrFile 中特殊处理，自身存储无意义，wen=false
  class TiclrBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val clr = new CsrField(0, 0, wen = false)

    protected val fieldLayout = List(
      (31, 1) -> 0.U(31.W),
      (0,  0) -> clr.bits
    )
  }

  class TlbrentryBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val pa = new CsrField(31, 6)

    protected val fieldLayout = List(
      (31, 6) -> pa.bits,
      (5,  0) -> 0.U(6.W)
    )
  }

  class DmwBundle(implicit p: Parameters) extends CsrBundle {
    val writable: Boolean = true
    val plv0 = new CsrField(0, 0)
    val plv3 = new CsrField(3, 3)
    val mat  = new CsrField(5, 4)
    val pseg = new CsrField(27, 25)
    val vseg = new CsrField(31, 29)

    protected val fieldLayout = List(
      (31, 29) -> vseg.bits,
      (28, 28) -> 0.U(1.W),
      (27, 25) -> pseg.bits,
      (24,  6) -> 0.U(19.W),
      (5,   4) -> mat.bits,
      (3,   3) -> plv3.bits,
      (2,   1) -> 0.U(2.W),
      (0,   0) -> plv0.bits
    )
  }
}

class PgdlBundle(implicit p: Parameters) extends CsrBundle {
  val writable = true
  val base = new CsrField(31, 12)

  protected val fieldLayout = List(
    (31, 12) -> base.bits,
    (11,  0) -> 0.U(12.W)
  )
}

class PgdhBundle(implicit p: Parameters) extends CsrBundle {
  val writable = true
  val base = new CsrField(31, 12)

  protected val fieldLayout = List(
    (31, 12) -> base.bits,
    (11,  0) -> 0.U(12.W)
  )
}

// PGD: 只读，base 由 BADV[31] 选择 pgdl/pgdh
class PgdBundle(implicit p: Parameters) extends CsrBundle {
  val writable = false
  val base = new CsrField(31, 12, wen = false)

  protected val fieldLayout = List(
    (31, 12) -> base.bits,
    (11,  0) -> 0.U(12.W)
  )
}

// LLBCTL: rollb 只读, wcllb 写1清 rollb, klo 软件可写且 ERTN 自清零
class LlbctlBundle(implicit p: Parameters) extends CsrBundle {
  val writable = true
  val rollb = new CsrField(0, 0, wen = false)
  val wcllb = new CsrField(1, 1, wen = false)
  val klo   = new CsrField(2, 2, wen = true)

  protected val fieldLayout = List(
    (31, 3) -> 0.U(29.W),
    (2,  2) -> klo.bits,
    (1,  1) -> 0.U(1.W),  // WCLLB 读恒为0
    (0,  0) -> rollb.bits
  )
}
