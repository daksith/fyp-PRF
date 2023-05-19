import chisel3._
import chisel3.util._

class LVT_Mem(depth: Int, width: Int, nr: Int, nw: Int) extends lvtPorts(width: Int, depth: Int) {

  // IO
  val writePorts = IO(Vec(nw, new writePort))
  val readPorts = IO(Vec(nr, new readPort))

  // Lvt set memories. One for each writeport
  val lvtSets = Seq.fill(nw)(Module(new LVT_set(width, depth, nr)))

  // connect writeports
  lvtSets.zipWithIndex.foreach( c => c._1.writeport <> writePorts(c._2))

  // the lvt
  val lvt = Mem(depth,UInt(log2Ceil(nw).W))

  // update LVT during write.
  for (i<-0 until nw){
    when(writePorts(i).en){
      lvt(writePorts(i).addr) := i.U
    }
  }

  // mux selection registers
  val selRegs = Seq.fill(nr)(RegInit(0.U(log2Ceil(nw).W)))
  selRegs.zipWithIndex.foreach(c => c._1 := lvt(readPorts(c._2).addr))

  //connect readports to lvt sets
  lvtSets.foreach(c => c.readPorts.zipWithIndex.foreach(x => x._1 <> readPorts(x._2)))

  // Mux out Read Data
  val cases = Seq.tabulate(nw)(n=>n)
  readPorts.zipWithIndex.foreach(c => c._1.data := MuxCase(0.U,cases.map{ case x => (selRegs(c._2) === x.U) -> lvtSets(x).readPorts(c._2).data}))

  printf(p"${readPorts}\n")
}

object Verilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new LVT_Mem(64,64,3,4))
}
