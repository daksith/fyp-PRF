circuit LVT_set :
  module ReadWriteSmem :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip raddr : UInt<6>, flip waddr : UInt<6>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 15:24]
    when io.wenable : @[SRAM_block.scala 17:19]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 21:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 21:25]
    when io.renable : @[SRAM_block.scala 21:25]
      _io_dataOut_WIRE <= io.raddr @[SRAM_block.scala 21:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 21:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 21:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 21:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 21:14]

  module ReadWriteSmem_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip raddr : UInt<6>, flip waddr : UInt<6>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 15:24]
    when io.wenable : @[SRAM_block.scala 17:19]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 21:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 21:25]
    when io.renable : @[SRAM_block.scala 21:25]
      _io_dataOut_WIRE <= io.raddr @[SRAM_block.scala 21:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 21:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 21:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 21:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 21:14]

  module ReadWriteSmem_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip raddr : UInt<6>, flip waddr : UInt<6>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 15:24]
    when io.wenable : @[SRAM_block.scala 17:19]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 21:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 21:25]
    when io.renable : @[SRAM_block.scala 21:25]
      _io_dataOut_WIRE <= io.raddr @[SRAM_block.scala 21:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 21:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 21:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 21:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 21:14]

  module LVT_set :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip wenable : UInt<1>, flip r1enable : UInt<1>, flip r2enable : UInt<1>, flip r3enable : UInt<1>, flip r1addr : UInt<6>, flip r2addr : UInt<6>, flip r3addr : UInt<6>, flip waddr : UInt<6>, flip wdata : UInt<64>, r1data : UInt<64>, r2data : UInt<64>, r3data : UInt<64>}

    inst b1 of ReadWriteSmem @[LVT_set.scala 20:18]
    b1.clock <= clock
    b1.reset <= reset
    inst b2 of ReadWriteSmem_1 @[LVT_set.scala 21:18]
    b2.clock <= clock
    b2.reset <= reset
    inst b3 of ReadWriteSmem_2 @[LVT_set.scala 22:18]
    b3.clock <= clock
    b3.reset <= reset
    b1.io.wenable <= io.wenable @[LVT_set.scala 24:17]
    b2.io.wenable <= io.wenable @[LVT_set.scala 25:17]
    b3.io.wenable <= io.wenable @[LVT_set.scala 26:17]
    b1.io.dataIn <= io.wdata @[LVT_set.scala 27:16]
    b2.io.dataIn <= io.wdata @[LVT_set.scala 28:16]
    b3.io.dataIn <= io.wdata @[LVT_set.scala 29:16]
    b1.io.renable <= io.r1enable @[LVT_set.scala 31:17]
    b2.io.renable <= io.r2enable @[LVT_set.scala 32:17]
    b3.io.renable <= io.r3enable @[LVT_set.scala 33:17]
    io.r1data <= b1.io.dataOut @[LVT_set.scala 35:13]
    io.r2data <= b2.io.dataOut @[LVT_set.scala 36:13]
    io.r3data <= b3.io.dataOut @[LVT_set.scala 37:13]
    b1.io.raddr <= io.r1addr @[LVT_set.scala 39:15]
    b2.io.raddr <= io.r2addr @[LVT_set.scala 40:15]
    b3.io.raddr <= io.r3addr @[LVT_set.scala 41:15]
    b1.io.waddr <= io.waddr @[LVT_set.scala 43:15]
    b2.io.waddr <= io.waddr @[LVT_set.scala 44:15]
    b3.io.waddr <= io.waddr @[LVT_set.scala 45:15]

