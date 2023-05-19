import chisel3._
import chisel3.util._

class execRead extends Bundle {
  val valid = Input(Bool())
  val instruction  = Input(UInt(32.W))
  val branchmask = Input(UInt(4.W))
  val rs1Addr = Input(UInt(6.W))
  val rs2Addr = Input(UInt(6.W))
  val robAddr = Input(UInt(6.W))
}

class toexec extends Bundle {
  val valid = Output(Bool())
  val instruction  = Output(UInt(32.W))
  val branchmask = Output(UInt(4.W))
  val rs1Addr = Output(UInt(6.W))
  val rs1Data = Output(UInt(64.W))
  val rs2Addr = Output(UInt(6.W))
  val rs2Data = Output(UInt(64.W))
  val robAddr = Output(UInt(6.W))
}

class fromStore extends Bundle {
  val valid = Input(Bool())
  val instruction = Input(UInt(32.W))
  val branchmask = Input(UInt(4.W))
  val rs2Addr = Input(UInt(6.W))
}

class toStore extends Bundle {
  val valid = Output(Bool())
  val instruction = Output(UInt(32.W))
  val branchmask = Output(UInt(4.W))
  val rs2Data = Output(UInt(64.W))
}

class checkBranch extends Bundle {
  val pass = Input(Bool())
  val branchmask = Input(UInt(4.W))
  val valid = Input(Bool())
}

class PRF(depth: Int,width: Int) extends lvtPorts(width: Int, depth: Int)  {

  /* IO definitions here*/

  // writeports
  val writePorts = IO(Vec(4,new writePort))

  // exec IO
  val execRead = IO(new execRead)
  val toExec = IO(new toexec)

  // store IO
  val fromStore = IO(new fromStore)
  val toStore = IO(new toStore)

  // Branch mask check
  val branchCheck = IO(new checkBranch)

  /* Logic here */

  // The LVT based memory
  val prf = Module(new LVT_Mem(depth, width, nr = 3, nw = 4))

  // connect writeports
  prf.writePorts.zipWithIndex.foreach(c => c._1 <> writePorts(c._2))

  // Buffer signals
  toExec.robAddr := RegNext(execRead.robAddr)
  toExec.rs1Addr := RegNext(execRead.rs1Addr)
  toExec.rs2Addr := RegNext(execRead.rs2Addr)
  toExec.instruction := RegNext(execRead.instruction)
  toStore.instruction := RegNext(fromStore.instruction)

  // Get Data from PRF

  prf.readPorts(0).en := execRead.valid
  prf.readPorts(0).addr := execRead.rs1Addr
  toExec.rs1Data := prf.readPorts(0).data

  prf.readPorts(1).en := execRead.valid
  prf.readPorts(1).addr := execRead.rs2Addr
  toExec.rs2Data := prf.readPorts(1).data

  prf.readPorts(2).en := fromStore.valid
  prf.readPorts(2).addr := fromStore.rs2Addr
  toStore.rs2Data := prf.readPorts(2).data

  // valid and branchmask logic
  val toExec_valid = RegInit(false.B)
  val toStore_valid = RegInit(false.B)

  val toExec_mask = RegInit(0.U(4.W))
  val toStore_mask = RegInit(0.U(4.W))

  when (branchCheck.valid){
    //pass case
    when (branchCheck.pass){
      toExec_valid := execRead.valid
      toExec_mask := branchCheck.branchmask ^ execRead.branchmask

      toStore_valid := fromStore.valid
      toStore_mask := branchCheck.branchmask ^ fromStore.branchmask
    }.otherwise{
      // fail case
      toExec_valid := (branchCheck.branchmask & execRead.branchmask) === 0.U
      toExec_mask := execRead.branchmask

      toStore_valid := (branchCheck.branchmask & fromStore.branchmask) === 0.U
      toStore_mask := fromStore.branchmask
    }
  }.otherwise{
    toExec_valid := execRead.valid
    toExec_mask := execRead.branchmask

    toStore_valid := fromStore.valid
    toStore_mask := fromStore.branchmask
  }

  toExec.valid := toExec_valid
  toExec.branchmask := toExec_mask

  toStore.valid := toStore_valid
  toStore.branchmask := toStore_mask

}

object Verilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new PRF(64,64))
}
