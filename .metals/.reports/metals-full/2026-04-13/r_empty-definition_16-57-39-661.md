error id: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache.scala:Parameters.
file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/Parameters.
	 -chisel3/Parameters#
	 -chisel3/Parameters().
	 -chisel3/util/Parameters.
	 -chisel3/util/Parameters#
	 -chisel3/util/Parameters().
	 -config/Parameters.
	 -config/Parameters#
	 -config/Parameters().
	 -Parameters.
	 -Parameters#
	 -Parameters().
	 -scala/Predef.Parameters.
	 -scala/Predef.Parameters#
	 -scala/Predef.Parameters().
offset: 256
uri: file://<WORKSPACE>/designCPUByChisel/src/main/scala/icache.scala
text:
```scala
import chisel3._
import chisel3.util._
import chisel3.dontTouch
import config.NSModule
import config.NSBundle
import config.Parameters  // 导入Parameters类型
// 迷你指令Cache（彻底修复初始化错误）
class MiniICacheimport config.NSModule
import config.NSBundle
import config.Pa@@rameters  // 导入Parameters类型 extends NSModule {
  val io = IO(new NSBundle {
    // 对外AXI3 Master接口（对接转接桥）
    val axi_master = new AXI3MasterIO
    // 对内CPU接口（预留扩展）
    val cpu_if = new NSBundle {
      val req_addr  = Input(UInt(32.W))  // CPU请求地址
      val req_valid = Input(Bool())     // CPU请求有效
      val resp_data = Output(UInt(32.W))// Cache返回数据
      val resp_valid = Output(Bool())   // Cache返回有效
    }
  })

  // --------------------------
  // 0. 全局默认值初始化（核心修复：避免VOID）
  // --------------------------
  io.cpu_if.resp_data  := 0.U        // 默认返回0
  io.cpu_if.resp_valid := false.B    // 默认无效
  io.axi_master.r.rready := false.B  // 默认不准备接收读数据
  io.axi_master.b.bready := false.B  // 默认不准备接收写响应

  // 初始化AXI写通道为默认值
  val default_aw_data = 0.U.asTypeOf(new AXI3AWData)
  val default_w_data  = 0.U.asTypeOf(new AXI3WData)
  io.axi_master.aw.out := default_aw_data
  io.axi_master.w.out  := default_w_data

  // --------------------------
  // Cache参数配置
  // --------------------------
  val CACHE_SIZE   = 1024    // 总大小1KB
  val LINE_BYTES   = 4       // 行宽4字节
  val LINE_COUNT   = CACHE_SIZE / LINE_BYTES  // 256行
  val ADDR_OFFSET  = log2Ceil(LINE_BYTES)     // 2bit偏移
  val INDEX_BITS   = log2Ceil(LINE_COUNT)     // 8bit索引
  val TAG_BITS     = 32 - INDEX_BITS - ADDR_OFFSET  // 22bit标签

  // --------------------------
  // Cache存储结构
  // --------------------------
  val cache_tag    = SyncReadMem(LINE_COUNT, UInt(TAG_BITS.W))  // 标签存储
  val cache_valid  = SyncReadMem(LINE_COUNT, Bool())            // 有效位
  val cache_data   = SyncReadMem(LINE_COUNT, UInt(32.W))        // 数据存储

  // --------------------------
  // 地址分解
  // --------------------------
  val req_addr  = io.cpu_if.req_addr
  val req_tag   = req_addr(31, INDEX_BITS + ADDR_OFFSET)
  val req_index = req_addr(INDEX_BITS + ADDR_OFFSET - 1, ADDR_OFFSET)
  val req_offset= req_addr(ADDR_OFFSET - 1, 0)

  // --------------------------
  // 命中判断
  // --------------------------
  val rd_tag    = cache_tag.read(req_index, io.cpu_if.req_valid)
  val rd_valid  = cache_valid.read(req_index, io.cpu_if.req_valid)
  val hit       = rd_valid && (rd_tag === req_tag)

  // --------------------------
  // 缺失处理寄存器
  // --------------------------
  val miss_pending = RegInit(false.B)
  val miss_addr    = Reg(UInt(32.W))

  // --------------------------
  // 状态机：IDLE → MISS → RESP
  // --------------------------
  val s_idle :: s_miss :: s_resp :: Nil = Enum(3)
  val state = RegInit(s_idle)

  // 初始化AR数据为默认值
  val default_ar_data = 0.U.asTypeOf(new AXI3ARData)
  io.axi_master.ar.out := default_ar_data

  switch(state) {
    is(s_idle) {
      when(io.cpu_if.req_valid) {
        when(hit) {
          // 命中：返回数据
          io.cpu_if.resp_data  := cache_data.read(req_index, true.B)
          io.cpu_if.resp_valid := true.B
        }.otherwise {
          // 缺失：进入MISS状态发起AXI请求
          miss_pending := true.B
          miss_addr    := req_addr
          state        := s_miss
        }
      }.otherwise {
        // 无请求：保持默认值
        io.cpu_if.resp_valid := false.B
        io.cpu_if.resp_data  := 0.U
      }
    }

    is(s_miss) {
      // 构造AXI3 AR请求数据（被动类型）
      val ar_req_data = Wire(new AXI3ARData)
      ar_req_data.arid    := 0.U
      ar_req_data.araddr  := miss_addr
      ar_req_data.arlen   := 0.U    // 突发长度1
      ar_req_data.arsize  := 2.U    // 4字节传输
      ar_req_data.arburst := 1.U    // INCR突发类型
      ar_req_data.arlock  := 0.U
      ar_req_data.arcache := 0.U
      ar_req_data.arprot  := 0.U
      ar_req_data.arvalid := true.B

      io.axi_master.ar.out := ar_req_data

      when(io.axi_master.ar.arready) {
        // 地址通道握手完成，进入响应状态
        state := s_resp
      }
    }

    is(s_resp) {
      // 准备接收读响应
      io.axi_master.r.rready := true.B
      when(io.axi_master.r.in.rvalid) {
        // 写入Cache
        cache_tag.write(req_index, req_tag)
        cache_valid.write(req_index, true.B)
        cache_data.write(req_index, io.axi_master.r.in.rdata)
        
        // 返回数据给CPU
        io.cpu_if.resp_data  := io.axi_master.r.in.rdata
        io.cpu_if.resp_valid := true.B
        
        // 状态复位
        miss_pending := false.B
        state        := s_idle
      }.otherwise {
        // 未收到响应：保持默认值
        io.cpu_if.resp_valid := false.B
      }
    }
  }

  // 防止信号优化
  dontTouch(io)
}
```


#### Short summary: 

empty definition using pc, found symbol in pc: 