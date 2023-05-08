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

class PRF extends Module {

  /* IO definitions here*/

  // writeports
  val w1 = IO(new writePort)
  val w2 = IO(new writePort)
  val w3 = IO(new writePort)
  val w4 = IO(new writePort)

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
  val prf = Module(new LVT_Mem)

  // connect writeports
  prf.io.W1 <> w1
  prf.io.W2 <> w2
  prf.io.W3 <> w3
  prf.io.W4 <> w4

  // Buffer signals
  toExec.robAddr := RegNext(execRead.robAddr)
  toExec.rs1Addr := RegNext(execRead.rs1Addr)
  toExec.rs2Addr := RegNext(execRead.rs2Addr)
  toExec.instruction := RegNext(execRead.instruction)
  toStore.instruction := RegNext(fromStore.instruction)

  // Get Data from PRF
  prf.io.R1.en := execRead.valid
  prf.io.R1.addr := execRead.rs1Addr
  toExec.rs1Data := prf.io.R1.data

  prf.io.R2.en := execRead.valid
  prf.io.R2.addr := execRead.rs2Addr
  toExec.rs2Data := prf.io.R2.data

  prf.io.R3.en := fromStore.valid
  prf.io.R3.addr := fromStore.rs2Addr
  toStore.rs2Data := prf.io.R3.data

  // valid and branchmask logic
  

}
