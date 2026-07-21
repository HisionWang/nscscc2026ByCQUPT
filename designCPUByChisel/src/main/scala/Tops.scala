package nscscc

import chisel3._
import chisel3.util._
import config._
import java.io.File
import scala.sys.process._

// ================================================================
// 统一 Verilog 生成入口
// ================================================================
object CoreGen extends App {

  // 提取公共删除函数
  def cleanAndMkdir(dirPath: String): File = {
    val dir = new File(dirPath)
    if (dir.exists() && dir.isDirectory) {
      def deleteRecursively(f: File): Unit = {
        if (f.isDirectory) f.listFiles().foreach(deleteRecursively)
        if (f.exists && !f.delete())
          throw new Exception(s"Exception DeleFail: ${f.getAbsolutePath}")
      }
      deleteRecursively(dir)
    }
    dir.mkdirs()
    dir
  }

  // 读取第一个参数，默认 simu
  val mode = args.headOption.getOrElse("simu").toLowerCase match {
    case "fpga" => "fpga"
    case _      => "simu"
  }

  val targetDirPath = mode match {
    case "simu" => "./../chiplab/IP/myCPU/Chisel"
    case "fpga" => "./../chiplab/IP/myCPU/FPGA"
  }

  val enableDifftest = mode == "simu"  // simu 开启 difftest，fpga 关闭

  cleanAndMkdir(targetDirPath)

  implicit val config: Parameters = new Parameters(Map(
    DebugConfigKeys.EnableDifftest -> enableDifftest
  ))

  emitVerilog(
    new core_top,
    Array(
      "--target-dir", targetDirPath,
      "--emit-modules", "verilog"
    )
  )

  // 清理多余文件
  val filesToDelete = List("core_top.anno.json", "core_top.fir")
  filesToDelete.foreach { filename =>
    val fileToDelete = new File(targetDirPath, filename)
    if (fileToDelete.exists()) fileToDelete.delete()
  }

  println(s"[CoreGen] Generated $mode version in $targetDirPath")
}