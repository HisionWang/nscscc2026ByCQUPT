package nscscc

import chisel3.RawModule
import circt.stage.ChiselStage
import nscscc.config.NSModule
import nscscc.config.NSRawModule
import nscscc.config.NSBundle
import nscscc.config.Parameters
/*
object Elaborate extends App {
  implicit val config: Parameters = new Parameters(Map())

  val tops = collection.mutable.ListBuffer.empty[String]
  val firtoolOpts = collection.mutable.ListBuffer.empty[String]
  val chiselArgs = collection.mutable.ListBuffer.empty[String]

  var i = 0
  while (i < args.length) {
    args(i) match {
      case "--top" if i + 1 < args.length =>
        tops += args(i + 1); i += 2
      case "--firtool-opt" if i + 1 < args.length =>
        firtoolOpts += args(i + 1); i += 2
      case other =>
        chiselArgs += other; i += 1
    }
  }
  require(tops.nonEmpty, "at least one --top <className> is required")

  tops.foreach { topName =>
    println(s"[Elaborate] generating $topName")
    val topClass =
      try Class.forName(topName)
      catch { case _: ClassNotFoundException =>
        sys.error(s"class not found: $topName")
      }
    val ctor =
      try topClass.getDeclaredConstructor(classOf[Parameters])
      catch { case _: NoSuchMethodException =>
        sys.error(s"$topName has no (Parameters) constructor")
      }
    ChiselStage.emitSystemVerilogFile(
      gen = ctor.newInstance(config).asInstanceOf[RawModule],
      args = chiselArgs.toArray,
      firtoolOpts = firtoolOpts.toArray,
    )
  }
}

*/
