circuit LVT_Mem :
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
    input reset : Reset
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

  module ReadWriteSmem_3 :
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

  module ReadWriteSmem_4 :
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

  module ReadWriteSmem_5 :
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

  module LVT_set_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip r1enable : UInt<1>, flip r2enable : UInt<1>, flip r3enable : UInt<1>, flip r1addr : UInt<6>, flip r2addr : UInt<6>, flip r3addr : UInt<6>, flip waddr : UInt<6>, flip wdata : UInt<64>, r1data : UInt<64>, r2data : UInt<64>, r3data : UInt<64>}

    inst b1 of ReadWriteSmem_3 @[LVT_set.scala 20:18]
    b1.clock <= clock
    b1.reset <= reset
    inst b2 of ReadWriteSmem_4 @[LVT_set.scala 21:18]
    b2.clock <= clock
    b2.reset <= reset
    inst b3 of ReadWriteSmem_5 @[LVT_set.scala 22:18]
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

  module ReadWriteSmem_6 :
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

  module ReadWriteSmem_7 :
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

  module ReadWriteSmem_8 :
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

  module LVT_set_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip r1enable : UInt<1>, flip r2enable : UInt<1>, flip r3enable : UInt<1>, flip r1addr : UInt<6>, flip r2addr : UInt<6>, flip r3addr : UInt<6>, flip waddr : UInt<6>, flip wdata : UInt<64>, r1data : UInt<64>, r2data : UInt<64>, r3data : UInt<64>}

    inst b1 of ReadWriteSmem_6 @[LVT_set.scala 20:18]
    b1.clock <= clock
    b1.reset <= reset
    inst b2 of ReadWriteSmem_7 @[LVT_set.scala 21:18]
    b2.clock <= clock
    b2.reset <= reset
    inst b3 of ReadWriteSmem_8 @[LVT_set.scala 22:18]
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

  module ReadWriteSmem_9 :
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

  module ReadWriteSmem_10 :
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

  module ReadWriteSmem_11 :
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

  module LVT_set_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip wenable : UInt<1>, flip r1enable : UInt<1>, flip r2enable : UInt<1>, flip r3enable : UInt<1>, flip r1addr : UInt<6>, flip r2addr : UInt<6>, flip r3addr : UInt<6>, flip waddr : UInt<6>, flip wdata : UInt<64>, r1data : UInt<64>, r2data : UInt<64>, r3data : UInt<64>}

    inst b1 of ReadWriteSmem_9 @[LVT_set.scala 20:18]
    b1.clock <= clock
    b1.reset <= reset
    inst b2 of ReadWriteSmem_10 @[LVT_set.scala 21:18]
    b2.clock <= clock
    b2.reset <= reset
    inst b3 of ReadWriteSmem_11 @[LVT_set.scala 22:18]
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

  module LVT_Mem :
    input clock : Clock
    input reset : UInt<1>
    output io : { R1 : { flip addr : UInt<6>, data : UInt<64>, flip en : UInt<1>}, R2 : { flip addr : UInt<6>, data : UInt<64>, flip en : UInt<1>}, R3 : { flip addr : UInt<6>, data : UInt<64>, flip en : UInt<1>}, W1 : { flip addr : UInt<6>, flip data : UInt<64>, flip en : UInt<1>}, W2 : { flip addr : UInt<6>, flip data : UInt<64>, flip en : UInt<1>}, W3 : { flip addr : UInt<6>, flip data : UInt<64>, flip en : UInt<1>}, W4 : { flip addr : UInt<6>, flip data : UInt<64>, flip en : UInt<1>}}

    cmem LVT : UInt<2> [64] @[LVT_Mem.scala 32:16]
    inst s1 of LVT_set @[LVT_Mem.scala 35:18]
    s1.clock <= clock
    s1.reset <= reset
    inst s2 of LVT_set_1 @[LVT_Mem.scala 36:18]
    s2.clock <= clock
    s2.reset <= reset
    inst s3 of LVT_set_2 @[LVT_Mem.scala 37:18]
    s3.clock <= clock
    s3.reset <= reset
    inst s4 of LVT_set_3 @[LVT_Mem.scala 38:18]
    s4.clock <= clock
    s4.reset <= reset
    when io.W1.en : @[LVT_Mem.scala 41:17]
      infer mport MPORT = LVT[io.W1.addr], clock @[LVT_Mem.scala 42:8]
      MPORT <= UInt<1>("h0") @[LVT_Mem.scala 42:21]
    when io.W2.en : @[LVT_Mem.scala 44:18]
      infer mport MPORT_1 = LVT[io.W2.addr], clock @[LVT_Mem.scala 45:8]
      MPORT_1 <= UInt<1>("h1") @[LVT_Mem.scala 45:21]
    when io.W3.en : @[LVT_Mem.scala 47:18]
      infer mport MPORT_2 = LVT[io.W3.addr], clock @[LVT_Mem.scala 48:8]
      MPORT_2 <= UInt<2>("h2") @[LVT_Mem.scala 48:21]
    when io.W4.en : @[LVT_Mem.scala 50:18]
      infer mport MPORT_3 = LVT[io.W4.addr], clock @[LVT_Mem.scala 51:8]
      MPORT_3 <= UInt<2>("h3") @[LVT_Mem.scala 51:21]
    s1.io.wenable <= io.W1.en @[LVT_Mem.scala 55:17]
    s2.io.wenable <= io.W2.en @[LVT_Mem.scala 56:17]
    s3.io.wenable <= io.W3.en @[LVT_Mem.scala 57:17]
    s4.io.wenable <= io.W4.en @[LVT_Mem.scala 58:17]
    s1.io.wdata <= io.W1.data @[LVT_Mem.scala 59:15]
    s2.io.wdata <= io.W2.data @[LVT_Mem.scala 60:15]
    s3.io.wdata <= io.W3.data @[LVT_Mem.scala 61:15]
    s4.io.wdata <= io.W4.data @[LVT_Mem.scala 62:15]
    s1.io.waddr <= io.W1.addr @[LVT_Mem.scala 63:15]
    s2.io.waddr <= io.W2.addr @[LVT_Mem.scala 64:15]
    s3.io.waddr <= io.W3.addr @[LVT_Mem.scala 65:15]
    s4.io.waddr <= io.W4.addr @[LVT_Mem.scala 66:15]
    reg r1_sel_reg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[LVT_Mem.scala 69:27]
    reg r2_sel_reg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[LVT_Mem.scala 70:27]
    reg r3_sel_reg : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[LVT_Mem.scala 71:27]
    infer mport r1_sel_reg_MPORT = LVT[io.R1.addr], clock @[LVT_Mem.scala 73:20]
    r1_sel_reg <= r1_sel_reg_MPORT @[LVT_Mem.scala 73:14]
    infer mport r2_sel_reg_MPORT = LVT[io.R2.addr], clock @[LVT_Mem.scala 74:20]
    r2_sel_reg <= r2_sel_reg_MPORT @[LVT_Mem.scala 74:14]
    infer mport r3_sel_reg_MPORT = LVT[io.R3.addr], clock @[LVT_Mem.scala 75:20]
    r3_sel_reg <= r3_sel_reg_MPORT @[LVT_Mem.scala 75:14]
    s1.io.r1addr <= io.R1.addr @[LVT_Mem.scala 78:16]
    s2.io.r1addr <= io.R1.addr @[LVT_Mem.scala 79:16]
    s3.io.r1addr <= io.R1.addr @[LVT_Mem.scala 80:16]
    s4.io.r1addr <= io.R1.addr @[LVT_Mem.scala 81:16]
    s1.io.r2addr <= io.R2.addr @[LVT_Mem.scala 83:16]
    s2.io.r2addr <= io.R2.addr @[LVT_Mem.scala 84:16]
    s3.io.r2addr <= io.R2.addr @[LVT_Mem.scala 85:16]
    s4.io.r2addr <= io.R2.addr @[LVT_Mem.scala 86:16]
    s1.io.r3addr <= io.R3.addr @[LVT_Mem.scala 88:16]
    s2.io.r3addr <= io.R3.addr @[LVT_Mem.scala 89:16]
    s3.io.r3addr <= io.R3.addr @[LVT_Mem.scala 90:16]
    s4.io.r3addr <= io.R3.addr @[LVT_Mem.scala 91:16]
    s1.io.r1enable <= io.R1.en @[LVT_Mem.scala 93:18]
    s2.io.r1enable <= io.R1.en @[LVT_Mem.scala 94:18]
    s3.io.r1enable <= io.R1.en @[LVT_Mem.scala 95:18]
    s4.io.r1enable <= io.R1.en @[LVT_Mem.scala 96:18]
    s1.io.r2enable <= io.R2.en @[LVT_Mem.scala 98:18]
    s2.io.r2enable <= io.R2.en @[LVT_Mem.scala 99:18]
    s3.io.r2enable <= io.R2.en @[LVT_Mem.scala 100:18]
    s4.io.r2enable <= io.R2.en @[LVT_Mem.scala 101:18]
    s1.io.r3enable <= io.R3.en @[LVT_Mem.scala 103:18]
    s2.io.r3enable <= io.R3.en @[LVT_Mem.scala 104:18]
    s3.io.r3enable <= io.R3.en @[LVT_Mem.scala 105:18]
    s4.io.r3enable <= io.R3.en @[LVT_Mem.scala 106:18]
    node _io_R1_data_T = eq(r1_sel_reg, UInt<1>("h0")) @[LVT_Mem.scala 110:45]
    node _io_R1_data_T_1 = eq(r1_sel_reg, UInt<1>("h1")) @[LVT_Mem.scala 110:79]
    node _io_R1_data_T_2 = eq(r1_sel_reg, UInt<2>("h2")) @[LVT_Mem.scala 110:113]
    node _io_R1_data_T_3 = eq(r1_sel_reg, UInt<2>("h3")) @[LVT_Mem.scala 110:147]
    node _io_R1_data_T_4 = mux(_io_R1_data_T_3, s4.io.r1data, UInt<1>("h0")) @[Mux.scala 101:16]
    node _io_R1_data_T_5 = mux(_io_R1_data_T_2, s3.io.r1data, _io_R1_data_T_4) @[Mux.scala 101:16]
    node _io_R1_data_T_6 = mux(_io_R1_data_T_1, s2.io.r1data, _io_R1_data_T_5) @[Mux.scala 101:16]
    node _io_R1_data_T_7 = mux(_io_R1_data_T, s1.io.r1data, _io_R1_data_T_6) @[Mux.scala 101:16]
    io.R1.data <= _io_R1_data_T_7 @[LVT_Mem.scala 110:14]
    node _io_R2_data_T = eq(r2_sel_reg, UInt<1>("h0")) @[LVT_Mem.scala 111:45]
    node _io_R2_data_T_1 = eq(r2_sel_reg, UInt<1>("h1")) @[LVT_Mem.scala 111:79]
    node _io_R2_data_T_2 = eq(r2_sel_reg, UInt<2>("h2")) @[LVT_Mem.scala 111:113]
    node _io_R2_data_T_3 = eq(r2_sel_reg, UInt<2>("h3")) @[LVT_Mem.scala 111:147]
    node _io_R2_data_T_4 = mux(_io_R2_data_T_3, s4.io.r2data, UInt<1>("h0")) @[Mux.scala 101:16]
    node _io_R2_data_T_5 = mux(_io_R2_data_T_2, s3.io.r2data, _io_R2_data_T_4) @[Mux.scala 101:16]
    node _io_R2_data_T_6 = mux(_io_R2_data_T_1, s2.io.r2data, _io_R2_data_T_5) @[Mux.scala 101:16]
    node _io_R2_data_T_7 = mux(_io_R2_data_T, s1.io.r2data, _io_R2_data_T_6) @[Mux.scala 101:16]
    io.R2.data <= _io_R2_data_T_7 @[LVT_Mem.scala 111:14]
    node _io_R3_data_T = eq(r3_sel_reg, UInt<1>("h0")) @[LVT_Mem.scala 112:45]
    node _io_R3_data_T_1 = eq(r3_sel_reg, UInt<1>("h1")) @[LVT_Mem.scala 112:79]
    node _io_R3_data_T_2 = eq(r3_sel_reg, UInt<2>("h2")) @[LVT_Mem.scala 112:113]
    node _io_R3_data_T_3 = eq(r3_sel_reg, UInt<2>("h3")) @[LVT_Mem.scala 112:147]
    node _io_R3_data_T_4 = mux(_io_R3_data_T_3, s4.io.r3data, UInt<1>("h0")) @[Mux.scala 101:16]
    node _io_R3_data_T_5 = mux(_io_R3_data_T_2, s3.io.r3data, _io_R3_data_T_4) @[Mux.scala 101:16]
    node _io_R3_data_T_6 = mux(_io_R3_data_T_1, s2.io.r3data, _io_R3_data_T_5) @[Mux.scala 101:16]
    node _io_R3_data_T_7 = mux(_io_R3_data_T, s1.io.r3data, _io_R3_data_T_6) @[Mux.scala 101:16]
    io.R3.data <= _io_R3_data_T_7 @[LVT_Mem.scala 112:14]
