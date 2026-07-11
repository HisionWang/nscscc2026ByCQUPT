package nscscc.csr

import chisel3._
import chisel3.util._
import nscscc.config.{NSModule, Parameters}
import nscscc.csr.CsrBundles._
import nscscc.difftest.DifftestCSRState

class CsrFile(implicit p: Parameters) extends NSModule {
  val io = IO(new CsrFileIo)
  val difftest = if (EnableDifftest) Some(IO(Output(new DifftestCSRState))) else None

  // CSR寄存器实例
  val crmd = RegInit({
    val b = Wire(new CrmdBundle)
    b.plv  := 0.U
    b.ie   := 0.U
    b.da   := 1.U
    b.pg   := 0.U
    b.datf := 0.U
    b.datm := 0.U
    b
  })

  val prmd      = RegInit(0.U.asTypeOf(new PrmdBundle))
  val ecfg      = RegInit(0.U.asTypeOf(new EcfgBundle))
  val estat     = RegInit(0.U.asTypeOf(new EstatBundle))
  val era       = RegInit(0.U.asTypeOf(new EraBundle))
  val badv      = RegInit(0.U.asTypeOf(new BadvBundle))
  val eentry    = RegInit(0.U.asTypeOf(new EentryBundle))
  val tlbidx    = RegInit(0.U.asTypeOf(new TlbidxBundle))
  val tlbehi    = RegInit(0.U.asTypeOf(new TlbehiBundle))
  val tlbelo0   = RegInit(0.U.asTypeOf(new TlbeloBundle))
  val tlbelo1   = RegInit(0.U.asTypeOf(new TlbeloBundle))

  val asid = RegInit({
    val b = Wire(new AsidBundle)
    b.asid     := 0.U
    b.asidbits := 0x0A.U  // ASIDBITS=10
    b
  })

  val save0     = RegInit(0.U.asTypeOf(new SaveBundle))
  val save1     = RegInit(0.U.asTypeOf(new SaveBundle))
  val save2     = RegInit(0.U.asTypeOf(new SaveBundle))
  val save3     = RegInit(0.U.asTypeOf(new SaveBundle))
  val tid       = RegInit(0.U.asTypeOf(new TidBundle))
  val tcfg      = RegInit(0.U.asTypeOf(new TcfgBundle))
  val tval      = RegInit(0.U.asTypeOf(new TvalBundle))
  val ticlr     = RegInit(0.U.asTypeOf(new TiclrBundle))
  val tlbrentry = RegInit(0.U.asTypeOf(new TlbrentryBundle))
  val dmw0      = RegInit(0.U.asTypeOf(new DmwBundle))
  val dmw1      = RegInit(0.U.asTypeOf(new DmwBundle))

  val pgdl      = RegInit(0.U.asTypeOf(new PgdlBundle))
  val pgdh      = RegInit(0.U.asTypeOf(new PgdhBundle))
  val llbctl    = RegInit(0.U.asTypeOf(new LlbctlBundle))

  // 64-bit 自由计数器
  val timer64 = RegInit(0.U(TimerLen.W))
  timer64 := timer64 + 1.U

  // 软件写使能
  val wen  = io.wReq.wen
  val waddr = io.wReq.addr
  val wdata = io.wReq.data

  def swWen(addr: Int): Bool = wen && (waddr === addr.U)

  val excpFlush = io.excpEvent.excp
  val ertnFlush = io.excpEvent.ertn

  // ertn处理TLB重填例外返回
  val ertnTlbrefill = estat.ecode === 0x3f.U && ertnFlush

  // tlbrd有效/无效写使能
  val tlbrdValidWen   = io.tlbCmd.tlbrd && !io.fromTlb.tlbidx(31)  // NE bit
  val tlbrdInvalidWen = io.tlbCmd.tlbrd &&  io.fromTlb.tlbidx(31)

  // -------------------------
  // crmd
  // -------------------------
  when(excpFlush) {
    crmd.plv := 0.U
    crmd.ie  := 0.U
    when(io.excpEvent.tlbrefill) {
      crmd.da := 1.U
      crmd.pg := 0.U
    }
  }.elsewhen(ertnFlush) {
    crmd.plv := prmd.pplv
    crmd.ie  := prmd.pie
    when(ertnTlbrefill) {
      crmd.da := 0.U
      crmd.pg := 1.U
    }
  }.elsewhen(swWen(csrAddr.crmd)) {
    crmd.bindFrom(wdata)
  }

  // -------------------------
  // prmd
  // -------------------------
  when(swWen(csrAddr.prmd)) {
    prmd.bindFrom(wdata)
  }.elsewhen(excpFlush) {
    prmd.pplv := crmd.plv
    prmd.pie  := crmd.ie
  }

  // -------------------------
  // ecfg
  // -------------------------
  when(swWen(csrAddr.ecfg)) {
    ecfg.bindFrom(wdata)
  }

  // -------------------------
  // estat
  // -------------------------
  val timerEn = RegInit(false.B)

  estat.is1 := io.irqBus  // 硬件中断 [9:2]

  when(excpFlush) {
    estat.ecode    := io.excpInfo.ecode
    estat.esubcode := io.excpInfo.esubcode
  }.elsewhen(swWen(csrAddr.estat)) {
    estat.is0 := wdata(1, 0)
  }

  // 计时器中断清除 / tcfg写 / 计时器到期
  when(swWen(csrAddr.ticlr) && wdata(0)) {
    estat.is2 := 0.U
  }.elsewhen(swWen(csrAddr.tcfg)) {
    timerEn := wdata(0)
  }.elsewhen(timerEn && (tval.tval === 0.U)) {
    estat.is2 := 1.U
    timerEn        := tcfg.periodic.asBool
  }

  // -------------------------
  // era
  // -------------------------
  when(excpFlush) {
    era.pc := io.excpInfo.era
  }.elsewhen(swWen(csrAddr.era)) {
    era.bindFrom(wdata)
  }

  // -------------------------
  // badv
  // -------------------------
  when(swWen(csrAddr.badv)) {
    badv.bindFrom(wdata)
  }.elsewhen(io.excpInfo.vaddrError) {
    badv.vaddr := io.excpInfo.badVaddr
  }

  // -------------------------
  // eentry
  // -------------------------
  when(swWen(csrAddr.eentry)) {
    eentry.bindFrom(wdata)
  }

  // -------------------------
  // tlbidx
  // -------------------------
  when(swWen(csrAddr.tlbidx)) {
    tlbidx.bindFrom(wdata)
  }.elsewhen(io.tlbCmd.tlbsrch) {
    when(io.tlbCmd.tlbsrchHit) {
      tlbidx.index := io.tlbCmd.tlbsrchIndex
      tlbidx.ne    := 0.U
    }.otherwise {
      tlbidx.ne := 1.U
    }
  }.elsewhen(tlbrdValidWen) {
    tlbidx.ps := io.fromTlb.tlbidx(29, 24)
    tlbidx.ne := io.fromTlb.tlbidx(31)
  }.elsewhen(tlbrdInvalidWen) {
    tlbidx.ps := 0.U
    tlbidx.ne := io.fromTlb.tlbidx(31)
  }

  // -------------------------
  // tlbehi
  // -------------------------
  when(swWen(csrAddr.tlbehi)) {
    tlbehi.bindFrom(wdata)
  }.elsewhen(tlbrdValidWen) {
    tlbehi.vppn := io.fromTlb.tlbehi(31, 13)
  }.elsewhen(tlbrdInvalidWen) {
    tlbehi.vppn := 0.U
  }.elsewhen(io.excpEvent.vppnCaptrue) {
    tlbehi.vppn := io.excpInfo.vppn
  }

  // -------------------------
  // tlbelo0 / tlbelo1
  // -------------------------
  def bindTlbelo(reg: TlbeloBundle, src: UInt): Unit = {
    reg.v   := src(0)
    reg.d   := src(1)
    reg.plv := src(3, 2)
    reg.mat := src(5, 4)
    reg.g   := src(6)
    reg.ppn := src(27, 8)
  }

  when(swWen(csrAddr.tlbelo0)) {
    tlbelo0.bindFrom(wdata)
  }.elsewhen(tlbrdValidWen) {
    bindTlbelo(tlbelo0, io.fromTlb.tlbeho0)
  }.elsewhen(tlbrdInvalidWen) {
    tlbelo0 := 0.U.asTypeOf(new TlbeloBundle)
  }

  when(swWen(csrAddr.tlbelo1)) {
    tlbelo1.bindFrom(wdata)
  }.elsewhen(tlbrdValidWen) {
    bindTlbelo(tlbelo1, io.fromTlb.tlbeho1)
  }.elsewhen(tlbrdInvalidWen) {
    tlbelo1 := 0.U.asTypeOf(new TlbeloBundle)
  }

  // -------------------------
  // asid
  // -------------------------
  when(swWen(csrAddr.asid)) {
    asid.asid := wdata(9, 0)
  }.elsewhen(tlbrdValidWen) {
    asid.asid := io.fromTlb.asid(9, 0)
  }.elsewhen(tlbrdInvalidWen) {
    asid.asid := 0.U
  }

  // -------------------------
  // save0-3
  // -------------------------
  when(swWen(csrAddr.save0)) { save0.bindFrom(wdata) }
  when(swWen(csrAddr.save1)) { save1.bindFrom(wdata) }
  when(swWen(csrAddr.save2)) { save2.bindFrom(wdata) }
  when(swWen(csrAddr.save3)) { save3.bindFrom(wdata) }

  // -------------------------
  // tid
  // -------------------------
  when(swWen(csrAddr.tid)) { tid.bindFrom(wdata) }

  // -------------------------
  // tcfg
  // -------------------------
  when(swWen(csrAddr.tcfg)) {
    tcfg.bindFrom(wdata)
  }

  // -------------------------
  // tval (只读，由硬件驱动)
  // -------------------------
  when(swWen(csrAddr.tcfg)) {
    tval.tval := Cat(wdata(31, 2), 0.U(2.W))
  }.elsewhen(timerEn) {
    when(tval.tval =/= 0.U) {
      tval.tval := tval.tval - 1.U
    }.otherwise {
      tval.tval := Mux(tcfg.periodic.asBool,
        Cat(tcfg.initval : UInt, 0.U(2.W)),
        0xffffffffL.U(32.W))
    }
  }

  // -------------------------
  // ticlr (只复位)
  // -------------------------

  // -------------------------
  // tlbrentry
  // -------------------------
  when(swWen(csrAddr.tlbrentry)) {
    tlbrentry.bindFrom(wdata)
  }

  // -------------------------
  // dmw0 / dmw1
  // -------------------------
  when(swWen(csrAddr.dmw0)) { dmw0.bindFrom(wdata) }
  when(swWen(csrAddr.dmw1)) { dmw1.bindFrom(wdata) }

  // -------------------------
  // pgdl / pgdh
  // -------------------------
  when(swWen(csrAddr.pgdl)) { pgdl.bindFrom(wdata) }
  when(swWen(csrAddr.pgdh)) { pgdh.bindFrom(wdata) }

  // llbctl:
  //   rollb 由 LL/SC 硬件维护（此处未接入，保持 0）
  //   WCLLB 写1清 rollb
  //   klo 软件写; ERTN 且 klo=0 时清 rollb; ERTN 且 klo=1 时清 klo
  when(swWen(csrAddr.llbctl)) {
    llbctl.klo := wdata(2)
    when(wdata(1)) { llbctl.rollb := 0.U }  // WCLLB 副作用
  }.elsewhen(ertnFlush) {
    when(llbctl.klo.asBool) {
      llbctl.klo := 0.U   // KLO 自清零
    }.otherwise {
      llbctl.rollb := 0.U // 清 LLBit
    }
  }

  val pgdReadVal = Cat(Mux(badv.vaddr(31), pgdh.base: UInt, pgdl.base: UInt), 0.U(12.W))
  // -------------------------
  // 读数据 MUX
  // -------------------------
  val csrMap = Seq(
    csrAddr.crmd      -> crmd.toUInt,
    csrAddr.prmd      -> prmd.toUInt,
    csrAddr.ecfg      -> ecfg.toUInt,
    csrAddr.estat     -> estat.toUInt,
    csrAddr.era       -> era.toUInt,
    csrAddr.badv      -> badv.toUInt,
    csrAddr.eentry    -> eentry.toUInt,
    csrAddr.tlbidx    -> tlbidx.toUInt,
    csrAddr.tlbehi    -> tlbehi.toUInt,
    csrAddr.tlbelo0   -> tlbelo0.toUInt,
    csrAddr.tlbelo1   -> tlbelo1.toUInt,
    csrAddr.asid      -> asid.toUInt,
    csrAddr.save0     -> save0.toUInt,
    csrAddr.save1     -> save1.toUInt,
    csrAddr.save2     -> save2.toUInt,
    csrAddr.save3     -> save3.toUInt,
    csrAddr.tid       -> tid.toUInt,
    csrAddr.tcfg      -> tcfg.toUInt,
    csrAddr.tval      -> tval.toUInt,
    csrAddr.ticlr     -> ticlr.toUInt,
    csrAddr.tlbrentry -> tlbrentry.toUInt,
    csrAddr.dmw0      -> dmw0.toUInt,
    csrAddr.dmw1      -> dmw1.toUInt,
    csrAddr.pgdl      -> pgdl.toUInt,
    csrAddr.pgdh      -> pgdh.toUInt,
    csrAddr.pgd       -> pgdReadVal,
    csrAddr.llbctl    -> llbctl.toUInt,
  )

  io.rResp.data := csrMap.map { case (addr, data) =>
    Mux(io.rReq.addr === addr.U, data, 0.U(XLEN.W))
  }.reduce(_ | _)

  // -------------------------
  // 输出
  // -------------------------
  io.hasIrq := (ecfg.lie & estat.is).orR && crmd.ie.asBool

  io.redirectAddr.eentry    := eentry.toUInt
  io.redirectAddr.tlbrentry := tlbrentry.toUInt
  io.redirectAddr.era       := era.toUInt

  io.timerInfo.tid   := tid.toUInt
  io.timerInfo.timer := timer64

  // pg/da 按照tlbrefill例外特殊处理
  val pgOut: UInt = Mux(excpFlush && io.excpEvent.tlbrefill, 0.U,
              Mux(ertnTlbrefill, 1.U, crmd.pg))
  val daOut: UInt = Mux(excpFlush && io.excpEvent.tlbrefill, 1.U,
              Mux(ertnTlbrefill, 0.U, crmd.da))
  io.tlbCtrl.pgda := Cat(pgOut, daOut)

  io.tlbCtrl.dmw0 := Mux(swWen(csrAddr.dmw0), wdata, dmw0.toUInt)
  io.tlbCtrl.dmw1 := Mux(swWen(csrAddr.dmw1), wdata, dmw1.toUInt)

  // IO[UInt<>]触发不了类型转换，算了吧
  io.priv.plv := crmd.plv.bits

  io.cacheCtrl.datm := crmd.datm.bits
  io.cacheCtrl.datf := crmd.datf.bits

  io.toTlb.ecode   := estat.ecode.bits
  io.toTlb.tlbidx  := tlbidx.toUInt
  io.toTlb.tlbehi  := tlbehi.toUInt
  io.toTlb.tlbelo0 := tlbelo0.toUInt
  io.toTlb.tlbelo1 := tlbelo1.toUInt
  io.toTlb.asid    := asid.asid.bits
  io.toTlb.random  := timer64(4, 0)

  if (EnableDifftest) {
    val dt = difftest.get
    dt.estat     := estat.toUInt
    dt.crmd      := crmd.toUInt
    dt.prmd      := prmd.toUInt
    dt.ecfg      := ecfg.toUInt
    dt.era       := era.toUInt
    dt.badv      := badv.toUInt
    dt.eentry    := eentry.toUInt
    dt.tlbidx    := tlbidx.toUInt
    dt.tlbehi    := tlbehi.toUInt
    dt.tlbelo0   := tlbelo0.toUInt
    dt.tlbelo1   := tlbelo1.toUInt
    dt.asid      := asid.toUInt
    dt.pgdl      := pgdl.toUInt
    dt.pgdh      := pgdh.toUInt
    dt.save0     := save0.toUInt
    dt.save1     := save1.toUInt
    dt.save2     := save2.toUInt
    dt.save3     := save3.toUInt
    dt.tid       := tid.toUInt
    dt.tcfg      := tcfg.toUInt
    dt.tval      := tval.toUInt
    dt.ticlr     := ticlr.toUInt
    dt.llbctl    := llbctl.toUInt
    dt.tlbrentry := tlbrentry.toUInt
    dt.dmw0      := dmw0.toUInt
    dt.dmw1      := dmw1.toUInt
    dt.timer64   := timer64
  }
}
