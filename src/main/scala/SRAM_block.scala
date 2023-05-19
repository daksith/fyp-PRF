import chisel3._
import chisel3.util._

class ReadWriteSmem(width: Int, depth: Int) extends Module {
  val io = IO(new Bundle {
    val wenable = Input(Bool())
    val renable = Input(Bool())
    val raddr = Input(UInt(6.W))
    val waddr = Input(UInt(6.W))
    val dataIn = Input(UInt(width.W))
    val dataOut = Output(UInt(width.W))
  })

  val mem = SyncReadMem(depth, UInt(width.W))
  // Create one write port and one read port
  when(io.wenable){
    mem.write(io.waddr, io.dataIn)
  }

  io.dataOut := mem.read(io.raddr, io.renable)
}

