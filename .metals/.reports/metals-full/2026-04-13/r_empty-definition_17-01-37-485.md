error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/BlackBox.scala:
file://<WORKSPACE>/designCPUByChisel/src/main/scala/BlackBox.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Bundle#
	 -chisel3/util/Bundle#
	 -Bundle#
	 -scala/Predef.Bundle#
offset: 340
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/BlackBox.scala
text:
```scala
import chisel3._
import chisel3.util._
import config.NSModule
import config.NSBundle
import config.Parameters  // 导入Parameters类型
class dcache_BlackBox extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
    // 对外AXI3 Master接口（对接转接桥）
    val axi_master = new AXI3MasterIO
    // 对内CPU接口（预留扩展）
    val cpu_if = new Bundle@@ {
      val req_addr  = Input(UInt(32.W))  // CPU请求地址
      val req_valid = Input(Bool())     // CPU请求有效
      val resp_data = Output(UInt(32.W))// Cache返回数据
      val resp_valid = Output(Bool())   // Cache返回有效
    }
  })
  //黑盒中只需要写好io就行（我的chisel这边）
  

}

class uncache1_BlackBox extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
    // 对外AXI3 Master接口（对接转接桥）
    val axi_master = new AXI3MasterIO
    // 对内CPU接口（预留扩展）
    val cpu_if = new Bundle {
      val req_addr  = Input(UInt(32.W))  // CPU请求地址
      val req_valid = Input(Bool())     // CPU请求有效
      val resp_data = Output(UInt(32.W))// Cache返回数据
      val resp_valid = Output(Bool())   // Cache返回有效
    }
  })
  

}
class uncache2_BlackBox extends BlackBox with HasBlackBoxResource {
    val io = IO(new Bundle {
    // 对外AXI3 Master接口（对接转接桥）
    val axi_master = new AXI3MasterIO
    // 对内CPU接口（预留扩展）
    val cpu_if = new Bundle {
      val req_addr  = Input(UInt(32.W))  // CPU请求地址
      val req_valid = Input(Bool())     // CPU请求有效
      val resp_data = Output(UInt(32.W))// Cache返回数据
      val resp_valid = Output(Bool())   // Cache返回有效
    }
  })
  

}




```


#### Short summary: 

empty definition using pc, found symbol in pc: 