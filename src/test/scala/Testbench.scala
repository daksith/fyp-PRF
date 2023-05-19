import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._

class Testbench extends AnyFreeSpec with ChiselScalatestTester {

  "Starting Tests" in {
    test(new LVT_Mem(64,64,3,3)) { mem =>

      for (i<- 0 until 3){
        mem.writePorts(i).addr.poke(i.U)
        mem.writePorts(i).en.poke(1.U)
        mem.writePorts(i).data.poke((i+24).U)
      }
      mem.clock.step()

      for (i <- 0 until 3) {
        mem.writePorts(i).en.poke(0.U)
        mem.readPorts(i).en.poke(1.U)
        mem.readPorts(i).addr.poke(i.U)
      }
      mem.clock.step(1)
      mem.readPorts(0).addr.poke(2.U)
      mem.clock.step(2)

    }
  }
}