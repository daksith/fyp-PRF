import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._

class Testbench extends AnyFreeSpec with ChiselScalatestTester {

  "Starting Tests" in {
    test(new LVT_Mem) { mem =>

      mem.io.W1.addr.poke(21.U)
      mem.io.W1.en.poke(1.U)
      mem.io.W1.data.poke(35.U)

      mem.io.W2.addr.poke(25.U)
      mem.io.W2.en.poke(1.U)
      mem.io.W2.data.poke(76.U)

      mem.io.W3.addr.poke(12.U)
      mem.io.W3.en.poke(1.U)
      mem.io.W3.data.poke(137.U)

      mem.io.W4.addr.poke(57.U)
      mem.io.W4.en.poke(1.U)
      mem.io.W4.data.poke(472.U)

      mem.clock.step(1)

      mem.io.W4.addr.poke(57.U)
      mem.io.W4.en.poke(1.U)
      mem.io.W4.data.poke(47.U)

      mem.io.R1.en.poke(1.U)
      mem.io.R1.addr.poke(21.U)

      mem.io.R2.en.poke(1.U)
      mem.io.R2.addr.poke(25.U)

      mem.io.R3.en.poke(1.U)
      mem.io.R3.addr.poke(12.U)

      mem.clock.step(1)

      mem.io.R1.en.poke(1.U)
      mem.io.R1.addr.poke(57.U)

      mem.io.R2.en.poke(1.U)
      mem.io.R2.addr.poke(12.U)

      mem.io.R3.en.poke(1.U)
      mem.io.R3.addr.poke(57.U)

      mem.clock.step(1)
      mem.clock.step(1)



    }
  }
}
