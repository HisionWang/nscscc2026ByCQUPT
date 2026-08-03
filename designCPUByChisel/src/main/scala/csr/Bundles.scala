package nscscc.csr

import chisel3._
import chisel3.util._
import nscscc.config.Parameters

class CsrFileBundleSkel(implicit p: Parameters) extends BundleSkel

class CsrFileReadReq(implicit p: Parameters) extends CsrFileBundleSkel {
  val addr = UInt(csrAddrLen.W)
}

class CsrFileReadResp(implicit p: Parameters) extends CsrFileBundleSkel {
  val data = UInt(XLEN.W)
}

class CsrFileWriteReq(implicit p: Parameters) extends CsrFileBundleSkel {
  val wen = Bool()
  val addr = UInt(csrAddrLen.W)
  val data = UInt(XLEN.W)
}

class ExcpEvent(implicit p: Parameters) extends CsrFileBundleSkel {
  val excp = Bool()
  val ertn = Bool()
  val badvWrite = Bool()
  val tlbehiWrite = Bool()
  val tlbRefill = Bool()
}

class RedirectEntry(implicit p: Parameters) extends CsrFileBundleSkel {
  val eentry = UInt(XLEN.W)
  val tlbrentry = UInt(XLEN.W)
  val era = UInt(XLEN.W)
}

class ExcpInfo(implicit p: Parameters) extends CsrFileBundleSkel {
  val era = UInt(XLEN.W)
  val ecode = UInt(6.W)
  val esubcode = UInt(9.W)
  val badVaddr = UInt(XLEN.W)
  val vppn = UInt(19.W)
}

class TimerBundle(implicit p: Parameters) extends CsrFileBundleSkel {
  val tid = UInt(XLEN.W)
  val timer = UInt(TimerLen.W)
}

class TlbCmd(implicit p: Parameters) extends CsrFileBundleSkel {
  val tlbrd = Bool()
  val srchVld = Bool()
  val srchHit = Bool()
  val srchIdx = UInt(5.W)
}

class PrivCtrl(implicit p: Parameters) extends CsrFileBundleSkel {
  val plv = UInt(2.W)
}

class AddrTransCtrl(implicit p: Parameters) extends CsrFileBundleSkel {
  val pgda = UInt(2.W)
  val dmw0 = UInt(XLEN.W)
  val dmw1 = UInt(XLEN.W)
}

class CacheCtrl(implicit p: Parameters) extends CsrFileBundleSkel {
  val datm = UInt(2.W)
  val datf = UInt(2.W)
}

class TlbToCsr(implicit p: Parameters) extends CsrFileBundleSkel {
  val tlbehi = UInt(XLEN.W)
  val tlbeho0 = UInt(XLEN.W)
  val tlbeho1 = UInt(XLEN.W)
  val tlbidx = UInt(XLEN.W)
  val asid = UInt(XLEN.W)
}

class CsrToTlb(implicit p: Parameters) extends CsrFileBundleSkel {
  val ecode = UInt(6.W)
  val tlbidx = UInt(XLEN.W)
  val tlbehi = UInt(XLEN.W)
  val tlbelo0 = UInt(XLEN.W)
  val tlbelo1 = UInt(XLEN.W)
  val asid = UInt(10.W)
  val random = UInt(5.W)
}

class CsrFileIo(implicit p: Parameters) extends CsrFileBundleSkel {
  val irqBus = Input(UInt(irqWidth.W))
  val hasIrq = Output(Bool())
  val rReq = Input(new CsrFileReadReq)
  val rResp = Output(new CsrFileReadResp)
  val wReq = Input(new CsrFileWriteReq)
  val excpEvent = Input(new ExcpEvent)
  val excpInfo = Input(new ExcpInfo)
  val redirectAddr = Output(new RedirectEntry)
  val timerInfo = Output(new TimerBundle)
  val tlbCmd= Input(new TlbCmd)
  val priv = Output(new PrivCtrl)
  val tlbCtrl = Output(new AddrTransCtrl)
  val cacheCtrl = Output(new CacheCtrl)
  val toTlb = Output(new CsrToTlb)
  val fromTlb = Input(new TlbToCsr)
  val llbitSet = Input(Bool())
  val llbitClear = Input(Bool())
  val llbit = Output(Bool())
}
