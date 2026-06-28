package nscscc.mem

import chisel3._
import chisel3.util._
import nscscc.config._
import nscscc.mmu._
import nscscc.backend.execute._
// 确保引入了对应的 ExeResult、SqToMmuReq、ExeMmuResult、MmuToSqResp 定义所在的包

class MemAddrTrans(implicit p: Parameters) extends NSModule {
  val io = IO(new Bundle {
    // 接收执行级(Exe)传入的数据
    val in       = Flipped(Decoupled(new ExeResult))
    // 组合完毕后发往访存级(Mem)的数据包
    val out      = Decoupled(new ExeMmuResult)

    // 与 MMU 的请求与响应接口
    val mmuReq   = Decoupled(new SqToMmuReq)
    val mmuResp  = Flipped(Decoupled(new MmuToSqResp))

    // 全局冲刷信号（如遇异常或分支预测错误）
    val flush    = Input(Bool())
  })

  // ================================================================
  //  Stage 1: 锁存 Exe 结果，并向 MMU 发起地址翻译请求
  // ================================================================
  val s1_valid = RegInit(false.B)
  val s1_data  = Reg(new ExeResult)

  // 预留 Stage 2 的准备好信号
  val s2_ready = Wire(Bool())

  // Stage 1 的成功发射条件：当前级有数据、MMU 可以接收、且下一级不阻塞
  val s1_fire = s1_valid && io.mmuReq.ready && s2_ready

  // 告知上一级是否可以接收新数据（当前为空，或者当前数据本拍就能发走）
  io.in.ready := !s1_valid || s1_fire

  // Stage 1 状态转移逻辑
  when(io.flush) {
    s1_valid := false.B
  }.elsewhen(io.in.fire) {
    s1_valid := true.B
    s1_data  := io.in.bits
  }.elsewhen(s1_fire) {
    s1_valid := false.B
  }

  // 对 MMU 发起请求：只在满足发射条件时拉高 valid
  io.mmuReq.valid      := s1_valid && s2_ready
  io.mmuReq.bits.vaddr := s1_data.data      // 虚拟地址
  //io.mmuReq.bits.sqIdx := s1_data.uop.sqIdx // 携带 Sq 编号，MMU 会原样送回
  // 如果 SqToMmuReq 还有其他字段(如 isLoad/isStore)，可在这里基于 s1_data.uop 补充赋值


  // ================================================================
  //  Stage 2: 等待并接收 MMU 响应，打包发往 Memory 级
  // ================================================================
  val s2_valid    = RegInit(false.B)
  val s2_exe_data = Reg(new ExeResult) // 用于暂存伴随 MMU 请求的元数据

  // [关键缓冲器]：应对 SimpleMMU 没有内部停顿逻辑（不支持反压）的问题
  // 如果当前指令的 MMU 结果回来了，但下游(out)堵住了发不出去，必须把它死死锁住
  val s2_mmu_done = RegInit(false.B)
  val s2_mmu_resp = Reg(new MmuToSqResp)

  // Stage 2 向外发送的条件：有元数据，且(MMU已缓冲完毕 OR MMU本拍刚好响应)，且外端准备好
  val s2_fire = s2_valid && (s2_mmu_done || io.mmuResp.valid) && io.out.ready

  // Stage 2 能够接收上一级新数据的条件
  s2_ready := !s2_valid || s2_fire

  // Stage 2 状态转移逻辑
  when(io.flush) {
    s2_valid    := false.B
    s2_mmu_done := false.B
  }.elsewhen(s2_fire) {
    // 如果 Stage 2 成功把数据打包发出，且此时 Stage 1 有新指令发来
    when(s1_fire) {
      s2_valid    := true.B
      s2_exe_data := s1_data
      s2_mmu_done := false.B // 初始化为等待新的 MMU 响应
    }.otherwise {
      s2_valid    := false.B
      s2_mmu_done := false.B
    }
  }.otherwise {
    // Stage 2 本周期没有把数据发出去 (可能是自身在等MMU，也可能是外端堵塞)
    when(s1_fire) {
      s2_valid    := true.B
      s2_exe_data := s1_data
      s2_mmu_done := false.B
    }

    // 防丢失捕获网：如果本周期 MMU 给出了结果，但是由于下游阻塞导致 s2_fire 没有成功
    // 必须把响应结果暂存起来，防止下一拍数据彻底丢失。
    when(s2_valid && !s2_mmu_done && io.mmuResp.valid) {
      s2_mmu_done := true.B
      s2_mmu_resp := io.mmuResp.bits
    }
  }

  // 告知 MMU 我们的接收情况：如果没有暂存结果，就可以接纳
  io.mmuResp.ready := true.B

  // ================================================================
  //  打包输出给访存板块 (Memory)
  // ================================================================
  io.out.valid := s2_valid && (s2_mmu_done || io.mmuResp.valid)
  io.out.bits.exeRes := s2_exe_data

  // 如果之前因为阻塞把数据捕获了，就用寄存器里的(s2_mmu_resp)
  // 如果恰好这拍刚好到达，就直接用线上的数据(io.mmuResp.bits) 从而节约 1 拍延迟
  io.out.bits.mmuRes := Mux(s2_mmu_done, s2_mmu_resp, io.mmuResp.bits)
}