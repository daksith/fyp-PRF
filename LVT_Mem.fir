circuit LVT_Mem :
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
    input reset : Reset
    output readPorts : { flip en : UInt<1>, flip addr : UInt<6>, data : UInt<64>}[3]
    output writeport : { flip en : UInt<1>, flip addr : UInt<6>, flip data : UInt<64>}

    inst blocks_0 of ReadWriteSmem @[LVT_set.scala 25:35]
    blocks_0.clock <= clock
    blocks_0.reset <= reset
    inst blocks_1 of ReadWriteSmem_1 @[LVT_set.scala 25:35]
    blocks_1.clock <= clock
    blocks_1.reset <= reset
    inst blocks_2 of ReadWriteSmem_2 @[LVT_set.scala 25:35]
    blocks_2.clock <= clock
    blocks_2.reset <= reset
    blocks_0.io.raddr <= readPorts[0].addr @[LVT_set.scala 28:55]
    blocks_1.io.raddr <= readPorts[1].addr @[LVT_set.scala 28:55]
    blocks_2.io.raddr <= readPorts[2].addr @[LVT_set.scala 28:55]
    blocks_0.io.renable <= readPorts[0].en @[LVT_set.scala 29:57]
    blocks_1.io.renable <= readPorts[1].en @[LVT_set.scala 29:57]
    blocks_2.io.renable <= readPorts[2].en @[LVT_set.scala 29:57]
    readPorts[0].data <= blocks_0.io.dataOut @[LVT_set.scala 30:62]
    readPorts[1].data <= blocks_1.io.dataOut @[LVT_set.scala 30:62]
    readPorts[2].data <= blocks_2.io.dataOut @[LVT_set.scala 30:62]
    blocks_0.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_1.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_2.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_0.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_1.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_2.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_0.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_1.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_2.io.waddr <= writeport.addr @[LVT_set.scala 35:38]

  module ReadWriteSmem_3 :
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

  module ReadWriteSmem_4 :
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

  module ReadWriteSmem_5 :
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

  module LVT_set_1 :
    input clock : Clock
    input reset : Reset
    output readPorts : { flip en : UInt<1>, flip addr : UInt<6>, data : UInt<64>}[3]
    output writeport : { flip en : UInt<1>, flip addr : UInt<6>, flip data : UInt<64>}

    inst blocks_0 of ReadWriteSmem_3 @[LVT_set.scala 25:35]
    blocks_0.clock <= clock
    blocks_0.reset <= reset
    inst blocks_1 of ReadWriteSmem_4 @[LVT_set.scala 25:35]
    blocks_1.clock <= clock
    blocks_1.reset <= reset
    inst blocks_2 of ReadWriteSmem_5 @[LVT_set.scala 25:35]
    blocks_2.clock <= clock
    blocks_2.reset <= reset
    blocks_0.io.raddr <= readPorts[0].addr @[LVT_set.scala 28:55]
    blocks_1.io.raddr <= readPorts[1].addr @[LVT_set.scala 28:55]
    blocks_2.io.raddr <= readPorts[2].addr @[LVT_set.scala 28:55]
    blocks_0.io.renable <= readPorts[0].en @[LVT_set.scala 29:57]
    blocks_1.io.renable <= readPorts[1].en @[LVT_set.scala 29:57]
    blocks_2.io.renable <= readPorts[2].en @[LVT_set.scala 29:57]
    readPorts[0].data <= blocks_0.io.dataOut @[LVT_set.scala 30:62]
    readPorts[1].data <= blocks_1.io.dataOut @[LVT_set.scala 30:62]
    readPorts[2].data <= blocks_2.io.dataOut @[LVT_set.scala 30:62]
    blocks_0.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_1.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_2.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_0.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_1.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_2.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_0.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_1.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_2.io.waddr <= writeport.addr @[LVT_set.scala 35:38]

  module ReadWriteSmem_6 :
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

  module ReadWriteSmem_7 :
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

  module ReadWriteSmem_8 :
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

  module LVT_set_2 :
    input clock : Clock
    input reset : Reset
    output readPorts : { flip en : UInt<1>, flip addr : UInt<6>, data : UInt<64>}[3]
    output writeport : { flip en : UInt<1>, flip addr : UInt<6>, flip data : UInt<64>}

    inst blocks_0 of ReadWriteSmem_6 @[LVT_set.scala 25:35]
    blocks_0.clock <= clock
    blocks_0.reset <= reset
    inst blocks_1 of ReadWriteSmem_7 @[LVT_set.scala 25:35]
    blocks_1.clock <= clock
    blocks_1.reset <= reset
    inst blocks_2 of ReadWriteSmem_8 @[LVT_set.scala 25:35]
    blocks_2.clock <= clock
    blocks_2.reset <= reset
    blocks_0.io.raddr <= readPorts[0].addr @[LVT_set.scala 28:55]
    blocks_1.io.raddr <= readPorts[1].addr @[LVT_set.scala 28:55]
    blocks_2.io.raddr <= readPorts[2].addr @[LVT_set.scala 28:55]
    blocks_0.io.renable <= readPorts[0].en @[LVT_set.scala 29:57]
    blocks_1.io.renable <= readPorts[1].en @[LVT_set.scala 29:57]
    blocks_2.io.renable <= readPorts[2].en @[LVT_set.scala 29:57]
    readPorts[0].data <= blocks_0.io.dataOut @[LVT_set.scala 30:62]
    readPorts[1].data <= blocks_1.io.dataOut @[LVT_set.scala 30:62]
    readPorts[2].data <= blocks_2.io.dataOut @[LVT_set.scala 30:62]
    blocks_0.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_1.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_2.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_0.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_1.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_2.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_0.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_1.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_2.io.waddr <= writeport.addr @[LVT_set.scala 35:38]

  module ReadWriteSmem_9 :
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

  module ReadWriteSmem_10 :
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

  module ReadWriteSmem_11 :
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

  module LVT_set_3 :
    input clock : Clock
    input reset : Reset
    output readPorts : { flip en : UInt<1>, flip addr : UInt<6>, data : UInt<64>}[3]
    output writeport : { flip en : UInt<1>, flip addr : UInt<6>, flip data : UInt<64>}

    inst blocks_0 of ReadWriteSmem_9 @[LVT_set.scala 25:35]
    blocks_0.clock <= clock
    blocks_0.reset <= reset
    inst blocks_1 of ReadWriteSmem_10 @[LVT_set.scala 25:35]
    blocks_1.clock <= clock
    blocks_1.reset <= reset
    inst blocks_2 of ReadWriteSmem_11 @[LVT_set.scala 25:35]
    blocks_2.clock <= clock
    blocks_2.reset <= reset
    blocks_0.io.raddr <= readPorts[0].addr @[LVT_set.scala 28:55]
    blocks_1.io.raddr <= readPorts[1].addr @[LVT_set.scala 28:55]
    blocks_2.io.raddr <= readPorts[2].addr @[LVT_set.scala 28:55]
    blocks_0.io.renable <= readPorts[0].en @[LVT_set.scala 29:57]
    blocks_1.io.renable <= readPorts[1].en @[LVT_set.scala 29:57]
    blocks_2.io.renable <= readPorts[2].en @[LVT_set.scala 29:57]
    readPorts[0].data <= blocks_0.io.dataOut @[LVT_set.scala 30:62]
    readPorts[1].data <= blocks_1.io.dataOut @[LVT_set.scala 30:62]
    readPorts[2].data <= blocks_2.io.dataOut @[LVT_set.scala 30:62]
    blocks_0.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_1.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_2.io.dataIn <= writeport.data @[LVT_set.scala 33:39]
    blocks_0.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_1.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_2.io.wenable <= writeport.en @[LVT_set.scala 34:40]
    blocks_0.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_1.io.waddr <= writeport.addr @[LVT_set.scala 35:38]
    blocks_2.io.waddr <= writeport.addr @[LVT_set.scala 35:38]

  module LVT_Mem :
    input clock : Clock
    input reset : UInt<1>
    output writePorts : { flip en : UInt<1>, flip addr : UInt<6>, flip data : UInt<64>}[4]
    output readPorts : { flip en : UInt<1>, flip addr : UInt<6>, data : UInt<64>}[3]

    inst lvtSets_0 of LVT_set @[LVT_Mem.scala 11:36]
    lvtSets_0.clock <= clock
    lvtSets_0.reset <= reset
    inst lvtSets_1 of LVT_set_1 @[LVT_Mem.scala 11:36]
    lvtSets_1.clock <= clock
    lvtSets_1.reset <= reset
    inst lvtSets_2 of LVT_set_2 @[LVT_Mem.scala 11:36]
    lvtSets_2.clock <= clock
    lvtSets_2.reset <= reset
    inst lvtSets_3 of LVT_set_3 @[LVT_Mem.scala 11:36]
    lvtSets_3.clock <= clock
    lvtSets_3.reset <= reset
    lvtSets_0.writeport.data <= writePorts[0].data @[LVT_Mem.scala 14:53]
    lvtSets_0.writeport.addr <= writePorts[0].addr @[LVT_Mem.scala 14:53]
    lvtSets_0.writeport.en <= writePorts[0].en @[LVT_Mem.scala 14:53]
    lvtSets_1.writeport.data <= writePorts[1].data @[LVT_Mem.scala 14:53]
    lvtSets_1.writeport.addr <= writePorts[1].addr @[LVT_Mem.scala 14:53]
    lvtSets_1.writeport.en <= writePorts[1].en @[LVT_Mem.scala 14:53]
    lvtSets_2.writeport.data <= writePorts[2].data @[LVT_Mem.scala 14:53]
    lvtSets_2.writeport.addr <= writePorts[2].addr @[LVT_Mem.scala 14:53]
    lvtSets_2.writeport.en <= writePorts[2].en @[LVT_Mem.scala 14:53]
    lvtSets_3.writeport.data <= writePorts[3].data @[LVT_Mem.scala 14:53]
    lvtSets_3.writeport.addr <= writePorts[3].addr @[LVT_Mem.scala 14:53]
    lvtSets_3.writeport.en <= writePorts[3].en @[LVT_Mem.scala 14:53]
    cmem lvt : UInt<2> [64] @[LVT_Mem.scala 17:16]
    when writePorts[0].en : @[LVT_Mem.scala 21:27]
      infer mport MPORT = lvt[writePorts[0].addr], clock @[LVT_Mem.scala 22:10]
      MPORT <= UInt<1>("h0") @[LVT_Mem.scala 22:31]
    when writePorts[1].en : @[LVT_Mem.scala 21:27]
      infer mport MPORT_1 = lvt[writePorts[1].addr], clock @[LVT_Mem.scala 22:10]
      MPORT_1 <= UInt<1>("h1") @[LVT_Mem.scala 22:31]
    when writePorts[2].en : @[LVT_Mem.scala 21:27]
      infer mport MPORT_2 = lvt[writePorts[2].addr], clock @[LVT_Mem.scala 22:10]
      MPORT_2 <= UInt<2>("h2") @[LVT_Mem.scala 22:31]
    when writePorts[3].en : @[LVT_Mem.scala 21:27]
      infer mport MPORT_3 = lvt[writePorts[3].addr], clock @[LVT_Mem.scala 22:10]
      MPORT_3 <= UInt<2>("h3") @[LVT_Mem.scala 22:31]
    reg selRegs_0 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[LVT_Mem.scala 27:37]
    reg selRegs_1 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[LVT_Mem.scala 27:37]
    reg selRegs_2 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[LVT_Mem.scala 27:37]
    infer mport selRegs_0_MPORT = lvt[readPorts[0].addr], clock @[LVT_Mem.scala 28:48]
    selRegs_0 <= selRegs_0_MPORT @[LVT_Mem.scala 28:42]
    infer mport selRegs_1_MPORT = lvt[readPorts[1].addr], clock @[LVT_Mem.scala 28:48]
    selRegs_1 <= selRegs_1_MPORT @[LVT_Mem.scala 28:42]
    infer mport selRegs_2_MPORT = lvt[readPorts[2].addr], clock @[LVT_Mem.scala 28:48]
    selRegs_2 <= selRegs_2_MPORT @[LVT_Mem.scala 28:42]
    readPorts[0].data <= lvtSets_0.readPorts[0].data @[LVT_Mem.scala 31:67]
    lvtSets_0.readPorts[0].addr <= readPorts[0].addr @[LVT_Mem.scala 31:67]
    lvtSets_0.readPorts[0].en <= readPorts[0].en @[LVT_Mem.scala 31:67]
    readPorts[1].data <= lvtSets_0.readPorts[1].data @[LVT_Mem.scala 31:67]
    lvtSets_0.readPorts[1].addr <= readPorts[1].addr @[LVT_Mem.scala 31:67]
    lvtSets_0.readPorts[1].en <= readPorts[1].en @[LVT_Mem.scala 31:67]
    readPorts[2].data <= lvtSets_0.readPorts[2].data @[LVT_Mem.scala 31:67]
    lvtSets_0.readPorts[2].addr <= readPorts[2].addr @[LVT_Mem.scala 31:67]
    lvtSets_0.readPorts[2].en <= readPorts[2].en @[LVT_Mem.scala 31:67]
    readPorts[0].data <= lvtSets_1.readPorts[0].data @[LVT_Mem.scala 31:67]
    lvtSets_1.readPorts[0].addr <= readPorts[0].addr @[LVT_Mem.scala 31:67]
    lvtSets_1.readPorts[0].en <= readPorts[0].en @[LVT_Mem.scala 31:67]
    readPorts[1].data <= lvtSets_1.readPorts[1].data @[LVT_Mem.scala 31:67]
    lvtSets_1.readPorts[1].addr <= readPorts[1].addr @[LVT_Mem.scala 31:67]
    lvtSets_1.readPorts[1].en <= readPorts[1].en @[LVT_Mem.scala 31:67]
    readPorts[2].data <= lvtSets_1.readPorts[2].data @[LVT_Mem.scala 31:67]
    lvtSets_1.readPorts[2].addr <= readPorts[2].addr @[LVT_Mem.scala 31:67]
    lvtSets_1.readPorts[2].en <= readPorts[2].en @[LVT_Mem.scala 31:67]
    readPorts[0].data <= lvtSets_2.readPorts[0].data @[LVT_Mem.scala 31:67]
    lvtSets_2.readPorts[0].addr <= readPorts[0].addr @[LVT_Mem.scala 31:67]
    lvtSets_2.readPorts[0].en <= readPorts[0].en @[LVT_Mem.scala 31:67]
    readPorts[1].data <= lvtSets_2.readPorts[1].data @[LVT_Mem.scala 31:67]
    lvtSets_2.readPorts[1].addr <= readPorts[1].addr @[LVT_Mem.scala 31:67]
    lvtSets_2.readPorts[1].en <= readPorts[1].en @[LVT_Mem.scala 31:67]
    readPorts[2].data <= lvtSets_2.readPorts[2].data @[LVT_Mem.scala 31:67]
    lvtSets_2.readPorts[2].addr <= readPorts[2].addr @[LVT_Mem.scala 31:67]
    lvtSets_2.readPorts[2].en <= readPorts[2].en @[LVT_Mem.scala 31:67]
    readPorts[0].data <= lvtSets_3.readPorts[0].data @[LVT_Mem.scala 31:67]
    lvtSets_3.readPorts[0].addr <= readPorts[0].addr @[LVT_Mem.scala 31:67]
    lvtSets_3.readPorts[0].en <= readPorts[0].en @[LVT_Mem.scala 31:67]
    readPorts[1].data <= lvtSets_3.readPorts[1].data @[LVT_Mem.scala 31:67]
    lvtSets_3.readPorts[1].addr <= readPorts[1].addr @[LVT_Mem.scala 31:67]
    lvtSets_3.readPorts[1].en <= readPorts[1].en @[LVT_Mem.scala 31:67]
    readPorts[2].data <= lvtSets_3.readPorts[2].data @[LVT_Mem.scala 31:67]
    lvtSets_3.readPorts[2].addr <= readPorts[2].addr @[LVT_Mem.scala 31:67]
    lvtSets_3.readPorts[2].en <= readPorts[2].en @[LVT_Mem.scala 31:67]
    node _readPorts_0_data_T = eq(selRegs_0, UInt<1>("h0")) @[LVT_Mem.scala 35:100]
    node _readPorts_0_data_T_1 = eq(selRegs_0, UInt<1>("h1")) @[LVT_Mem.scala 35:100]
    node _readPorts_0_data_T_2 = eq(selRegs_0, UInt<2>("h2")) @[LVT_Mem.scala 35:100]
    node _readPorts_0_data_T_3 = eq(selRegs_0, UInt<2>("h3")) @[LVT_Mem.scala 35:100]
    node _readPorts_0_data_T_4 = mux(_readPorts_0_data_T_3, lvtSets_3.readPorts[0].data, UInt<1>("h0")) @[Mux.scala 101:16]
    node _readPorts_0_data_T_5 = mux(_readPorts_0_data_T_2, lvtSets_2.readPorts[0].data, _readPorts_0_data_T_4) @[Mux.scala 101:16]
    node _readPorts_0_data_T_6 = mux(_readPorts_0_data_T_1, lvtSets_1.readPorts[0].data, _readPorts_0_data_T_5) @[Mux.scala 101:16]
    node _readPorts_0_data_T_7 = mux(_readPorts_0_data_T, lvtSets_0.readPorts[0].data, _readPorts_0_data_T_6) @[Mux.scala 101:16]
    readPorts[0].data <= _readPorts_0_data_T_7 @[LVT_Mem.scala 35:49]
    node _readPorts_1_data_T = eq(selRegs_1, UInt<1>("h0")) @[LVT_Mem.scala 35:100]
    node _readPorts_1_data_T_1 = eq(selRegs_1, UInt<1>("h1")) @[LVT_Mem.scala 35:100]
    node _readPorts_1_data_T_2 = eq(selRegs_1, UInt<2>("h2")) @[LVT_Mem.scala 35:100]
    node _readPorts_1_data_T_3 = eq(selRegs_1, UInt<2>("h3")) @[LVT_Mem.scala 35:100]
    node _readPorts_1_data_T_4 = mux(_readPorts_1_data_T_3, lvtSets_3.readPorts[1].data, UInt<1>("h0")) @[Mux.scala 101:16]
    node _readPorts_1_data_T_5 = mux(_readPorts_1_data_T_2, lvtSets_2.readPorts[1].data, _readPorts_1_data_T_4) @[Mux.scala 101:16]
    node _readPorts_1_data_T_6 = mux(_readPorts_1_data_T_1, lvtSets_1.readPorts[1].data, _readPorts_1_data_T_5) @[Mux.scala 101:16]
    node _readPorts_1_data_T_7 = mux(_readPorts_1_data_T, lvtSets_0.readPorts[1].data, _readPorts_1_data_T_6) @[Mux.scala 101:16]
    readPorts[1].data <= _readPorts_1_data_T_7 @[LVT_Mem.scala 35:49]
    node _readPorts_2_data_T = eq(selRegs_2, UInt<1>("h0")) @[LVT_Mem.scala 35:100]
    node _readPorts_2_data_T_1 = eq(selRegs_2, UInt<1>("h1")) @[LVT_Mem.scala 35:100]
    node _readPorts_2_data_T_2 = eq(selRegs_2, UInt<2>("h2")) @[LVT_Mem.scala 35:100]
    node _readPorts_2_data_T_3 = eq(selRegs_2, UInt<2>("h3")) @[LVT_Mem.scala 35:100]
    node _readPorts_2_data_T_4 = mux(_readPorts_2_data_T_3, lvtSets_3.readPorts[2].data, UInt<1>("h0")) @[Mux.scala 101:16]
    node _readPorts_2_data_T_5 = mux(_readPorts_2_data_T_2, lvtSets_2.readPorts[2].data, _readPorts_2_data_T_4) @[Mux.scala 101:16]
    node _readPorts_2_data_T_6 = mux(_readPorts_2_data_T_1, lvtSets_1.readPorts[2].data, _readPorts_2_data_T_5) @[Mux.scala 101:16]
    node _readPorts_2_data_T_7 = mux(_readPorts_2_data_T, lvtSets_0.readPorts[2].data, _readPorts_2_data_T_6) @[Mux.scala 101:16]
    readPorts[2].data <= _readPorts_2_data_T_7 @[LVT_Mem.scala 35:49]

