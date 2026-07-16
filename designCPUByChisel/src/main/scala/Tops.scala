package nscscc

import chisel3._
import chisel3.util._
import config._
import java.io.File
import scala.sys.process._
 
// ================================================================
// Verilog 生成入口
// ================================================================
object CoreSimu extends App {
 
  val targetDirPath = "./../chiplab/IP/myCPU/Chisel"
  val targetDir = new File(targetDirPath)
 
  if (targetDir.exists() && targetDir.isDirectory) {
    def deleteRecursively(file: File): Unit = {
      if (file.isDirectory) {
        file.listFiles().foreach(deleteRecursively)
      }
      if (file.exists && !file.delete()) {
        throw new Exception(s"Exception DeleFail: ${file.getAbsolutePath}")
      }
    }
    deleteRecursively(targetDir)
  }
  targetDir.mkdirs()
 
  implicit val config: Parameters = new Parameters(Map(
    DebugConfigKeys.EnableDifftest -> true
  ))
 
  emitVerilog(
    new core_top,
    Array(
      "--target-dir", targetDirPath,
      "--emit-modules", "verilog"
    )
  )
 
  val filesToDelete = List("core_top.anno.json", "core_top.fir")
  filesToDelete.foreach { filename =>
    val fileToDelete = new File(targetDir, filename)
    if (fileToDelete.exists()) {
      fileToDelete.delete()
    }
  }
}

// 我想打完make ss就去玩手机……
object CoreFpga extends App {
 
  val targetDirPath = "./../chiplab/IP/myCPU/FPGA"
  val targetDir = new File(targetDirPath)
 
  if (targetDir.exists() && targetDir.isDirectory) {
    def deleteRecursively(file: File): Unit = {
      if (file.isDirectory) {
        file.listFiles().foreach(deleteRecursively)
      }
      if (file.exists && !file.delete()) {
        throw new Exception(s"Exception DeleFail: ${file.getAbsolutePath}")
      }
    }
    deleteRecursively(targetDir)
  }
  targetDir.mkdirs()
 
  implicit val config: Parameters = new Parameters(Map(
    DebugConfigKeys.EnableDifftest -> false
  ))
 
  emitVerilog(
    new core_top,
    Array(
      "--target-dir", targetDirPath,
      "--emit-modules", "verilog"
    )
  )
 
  val filesToDelete = List("core_top.anno.json", "core_top.fir")
  filesToDelete.foreach { filename =>
    val fileToDelete = new File(targetDir, filename)
    if (fileToDelete.exists()) {
      fileToDelete.delete()
    }
  }
}


