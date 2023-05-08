circuit ReadWriteSmem :
  module ReadWriteSmem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip write : UInt<1>, flip addr : UInt<10>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 15:24]
    when io.wenable : @[SRAM_block.scala 17:19]
      node _T = bits(io.addr, 5, 0)
      write mport MPORT = mem[_T], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 21:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 21:25]
    when io.renable : @[SRAM_block.scala 21:25]
      _io_dataOut_WIRE <= io.addr @[SRAM_block.scala 21:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 21:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 21:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 21:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 21:14]

