import chisel3._
import chisel3.util._

abstract class lvtPorts(width: Int, depth: Int) extends Module{
  class readPort extends Bundle {
    val en = Input(Bool())
    val addr = Input(UInt(log2Ceil(depth).W))
    val data = Output(UInt(width.W))
  }

  class writePort extends Bundle {
    val en = Input(Bool())
    val addr = Input(UInt(log2Ceil(depth).W))
    val data = Input(UInt(width.W))
  }

}

class LVT_set(width: Int, depth: Int, nr: Int) extends lvtPorts(width: Int, depth: Int) {

  val readPorts = IO(Vec(nr, new readPort))
  val writeport = IO(new writePort)

  val blocks = Seq.fill(nr)(Module(new ReadWriteSmem(width, depth)))

  // connect readports
  blocks.zipWithIndex.foreach( mem => mem._1.io.raddr := readPorts(mem._2).addr)
  blocks.zipWithIndex.foreach( mem => mem._1.io.renable := readPorts(mem._2).en)
  blocks.zipWithIndex.foreach( mem => readPorts(mem._2).data := mem._1.io.dataOut)

  // connect writeport
  blocks.foreach(mem => mem.io.dataIn := writeport.data)
  blocks.foreach(mem => mem.io.wenable := writeport.en)
  blocks.foreach(mem => mem.io.waddr := writeport.addr)

}



