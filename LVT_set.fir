circuit LVT_set :
  module ReadWriteSmem :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip raddr : UInt<6>, flip waddr : UInt<6>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 14:24]
    when io.wenable : @[SRAM_block.scala 16:19]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 20:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 20:25]
    when io.renable : @[SRAM_block.scala 20:25]
      _io_dataOut_WIRE <= io.raddr @[SRAM_block.scala 20:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 20:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 20:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 20:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 20:14]

  module ReadWriteSmem_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip raddr : UInt<6>, flip waddr : UInt<6>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 14:24]
    when io.wenable : @[SRAM_block.scala 16:19]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 20:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 20:25]
    when io.renable : @[SRAM_block.scala 20:25]
      _io_dataOut_WIRE <= io.raddr @[SRAM_block.scala 20:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 20:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 20:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 20:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 20:14]

  module ReadWriteSmem_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip renable : UInt<1>, flip raddr : UInt<6>, flip waddr : UInt<6>, flip dataIn : UInt<64>, dataOut : UInt<64>}

    smem mem : UInt<64> [64] @[SRAM_block.scala 14:24]
    when io.wenable : @[SRAM_block.scala 16:19]
      write mport MPORT = mem[io.waddr], clock
      MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[SRAM_block.scala 20:25]
    _io_dataOut_WIRE is invalid @[SRAM_block.scala 20:25]
    when io.renable : @[SRAM_block.scala 20:25]
      _io_dataOut_WIRE <= io.raddr @[SRAM_block.scala 20:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<6>("h0")) @[SRAM_block.scala 20:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 5, 0) @[SRAM_block.scala 20:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[SRAM_block.scala 20:25]
    io.dataOut <= io_dataOut_MPORT @[SRAM_block.scala 20:14]

  module LVT_set :
    input clock : Clock
    input reset : UInt<1>
    output readPorts : { flip en : UInt<1>, flip addr : UInt<6>, data : UInt<64>}[3]
    output writeport : { flip en : UInt<1>, flip addr : UInt<6>, flip data : UInt<64>}

    inst blocks_0 of ReadWriteSmem @[LVT_set.scala 18:35]
    blocks_0.clock <= clock
    blocks_0.reset <= reset
    inst blocks_1 of ReadWriteSmem_1 @[LVT_set.scala 18:35]
    blocks_1.clock <= clock
    blocks_1.reset <= reset
    inst blocks_2 of ReadWriteSmem_2 @[LVT_set.scala 18:35]
    blocks_2.clock <= clock
    blocks_2.reset <= reset
    blocks_0.io.raddr <= readPorts[0].addr @[LVT_set.scala 21:55]
    blocks_1.io.raddr <= readPorts[1].addr @[LVT_set.scala 21:55]
    blocks_2.io.raddr <= readPorts[2].addr @[LVT_set.scala 21:55]
    blocks_0.io.renable <= readPorts[0].en @[LVT_set.scala 22:57]
    blocks_1.io.renable <= readPorts[1].en @[LVT_set.scala 22:57]
    blocks_2.io.renable <= readPorts[2].en @[LVT_set.scala 22:57]
    readPorts[0].data <= blocks_0.io.dataOut @[LVT_set.scala 23:62]
    readPorts[1].data <= blocks_1.io.dataOut @[LVT_set.scala 23:62]
    readPorts[2].data <= blocks_2.io.dataOut @[LVT_set.scala 23:62]
    blocks_0.io.dataIn <= writeport.data @[LVT_set.scala 26:39]
    blocks_1.io.dataIn <= writeport.data @[LVT_set.scala 26:39]
    blocks_2.io.dataIn <= writeport.data @[LVT_set.scala 26:39]
    blocks_0.io.wenable <= writeport.en @[LVT_set.scala 27:40]
    blocks_1.io.wenable <= writeport.en @[LVT_set.scala 27:40]
    blocks_2.io.wenable <= writeport.en @[LVT_set.scala 27:40]
    blocks_0.io.waddr <= writeport.addr @[LVT_set.scala 28:38]
    blocks_1.io.waddr <= writeport.addr @[LVT_set.scala 28:38]
    blocks_2.io.waddr <= writeport.addr @[LVT_set.scala 28:38]

