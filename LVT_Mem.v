module ReadWriteSmem(
  input         clock,
  input         io_wenable,
  input         io_renable,
  input  [5:0]  io_raddr,
  input  [5:0]  io_waddr,
  input  [63:0] io_dataIn,
  output [63:0] io_dataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mem [0:63]; // @[SRAM_block.scala 14:24]
  wire  mem_io_dataOut_MPORT_en; // @[SRAM_block.scala 14:24]
  wire [5:0] mem_io_dataOut_MPORT_addr; // @[SRAM_block.scala 14:24]
  wire [63:0] mem_io_dataOut_MPORT_data; // @[SRAM_block.scala 14:24]
  wire [63:0] mem_MPORT_data; // @[SRAM_block.scala 14:24]
  wire [5:0] mem_MPORT_addr; // @[SRAM_block.scala 14:24]
  wire  mem_MPORT_mask; // @[SRAM_block.scala 14:24]
  wire  mem_MPORT_en; // @[SRAM_block.scala 14:24]
  reg  mem_io_dataOut_MPORT_en_pipe_0;
  reg [5:0] mem_io_dataOut_MPORT_addr_pipe_0;
  assign mem_io_dataOut_MPORT_en = mem_io_dataOut_MPORT_en_pipe_0;
  assign mem_io_dataOut_MPORT_addr = mem_io_dataOut_MPORT_addr_pipe_0;
  assign mem_io_dataOut_MPORT_data = mem[mem_io_dataOut_MPORT_addr]; // @[SRAM_block.scala 14:24]
  assign mem_MPORT_data = io_dataIn;
  assign mem_MPORT_addr = io_waddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wenable;
  assign io_dataOut = mem_io_dataOut_MPORT_data; // @[SRAM_block.scala 20:14]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM_block.scala 14:24]
    end
    mem_io_dataOut_MPORT_en_pipe_0 <= io_renable;
    if (io_renable) begin
      mem_io_dataOut_MPORT_addr_pipe_0 <= io_raddr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    mem[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_dataOut_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_dataOut_MPORT_addr_pipe_0 = _RAND_2[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LVT_set(
  input         clock,
  input         readPorts_0_en,
  input  [5:0]  readPorts_0_addr,
  output [63:0] readPorts_0_data,
  input         readPorts_1_en,
  input  [5:0]  readPorts_1_addr,
  output [63:0] readPorts_1_data,
  input         readPorts_2_en,
  input  [5:0]  readPorts_2_addr,
  output [63:0] readPorts_2_data,
  input         writeport_en,
  input  [5:0]  writeport_addr,
  input  [63:0] writeport_data
);
  wire  blocks_0_clock; // @[LVT_set.scala 25:35]
  wire  blocks_0_io_wenable; // @[LVT_set.scala 25:35]
  wire  blocks_0_io_renable; // @[LVT_set.scala 25:35]
  wire [5:0] blocks_0_io_raddr; // @[LVT_set.scala 25:35]
  wire [5:0] blocks_0_io_waddr; // @[LVT_set.scala 25:35]
  wire [63:0] blocks_0_io_dataIn; // @[LVT_set.scala 25:35]
  wire [63:0] blocks_0_io_dataOut; // @[LVT_set.scala 25:35]
  wire  blocks_1_clock; // @[LVT_set.scala 25:35]
  wire  blocks_1_io_wenable; // @[LVT_set.scala 25:35]
  wire  blocks_1_io_renable; // @[LVT_set.scala 25:35]
  wire [5:0] blocks_1_io_raddr; // @[LVT_set.scala 25:35]
  wire [5:0] blocks_1_io_waddr; // @[LVT_set.scala 25:35]
  wire [63:0] blocks_1_io_dataIn; // @[LVT_set.scala 25:35]
  wire [63:0] blocks_1_io_dataOut; // @[LVT_set.scala 25:35]
  wire  blocks_2_clock; // @[LVT_set.scala 25:35]
  wire  blocks_2_io_wenable; // @[LVT_set.scala 25:35]
  wire  blocks_2_io_renable; // @[LVT_set.scala 25:35]
  wire [5:0] blocks_2_io_raddr; // @[LVT_set.scala 25:35]
  wire [5:0] blocks_2_io_waddr; // @[LVT_set.scala 25:35]
  wire [63:0] blocks_2_io_dataIn; // @[LVT_set.scala 25:35]
  wire [63:0] blocks_2_io_dataOut; // @[LVT_set.scala 25:35]
  ReadWriteSmem blocks_0 ( // @[LVT_set.scala 25:35]
    .clock(blocks_0_clock),
    .io_wenable(blocks_0_io_wenable),
    .io_renable(blocks_0_io_renable),
    .io_raddr(blocks_0_io_raddr),
    .io_waddr(blocks_0_io_waddr),
    .io_dataIn(blocks_0_io_dataIn),
    .io_dataOut(blocks_0_io_dataOut)
  );
  ReadWriteSmem blocks_1 ( // @[LVT_set.scala 25:35]
    .clock(blocks_1_clock),
    .io_wenable(blocks_1_io_wenable),
    .io_renable(blocks_1_io_renable),
    .io_raddr(blocks_1_io_raddr),
    .io_waddr(blocks_1_io_waddr),
    .io_dataIn(blocks_1_io_dataIn),
    .io_dataOut(blocks_1_io_dataOut)
  );
  ReadWriteSmem blocks_2 ( // @[LVT_set.scala 25:35]
    .clock(blocks_2_clock),
    .io_wenable(blocks_2_io_wenable),
    .io_renable(blocks_2_io_renable),
    .io_raddr(blocks_2_io_raddr),
    .io_waddr(blocks_2_io_waddr),
    .io_dataIn(blocks_2_io_dataIn),
    .io_dataOut(blocks_2_io_dataOut)
  );
  assign readPorts_0_data = blocks_0_io_dataOut; // @[LVT_set.scala 30:62]
  assign readPorts_1_data = blocks_1_io_dataOut; // @[LVT_set.scala 30:62]
  assign readPorts_2_data = blocks_2_io_dataOut; // @[LVT_set.scala 30:62]
  assign blocks_0_clock = clock;
  assign blocks_0_io_wenable = writeport_en; // @[LVT_set.scala 34:40]
  assign blocks_0_io_renable = readPorts_0_en; // @[LVT_set.scala 29:57]
  assign blocks_0_io_raddr = readPorts_0_addr; // @[LVT_set.scala 28:55]
  assign blocks_0_io_waddr = writeport_addr; // @[LVT_set.scala 35:38]
  assign blocks_0_io_dataIn = writeport_data; // @[LVT_set.scala 33:39]
  assign blocks_1_clock = clock;
  assign blocks_1_io_wenable = writeport_en; // @[LVT_set.scala 34:40]
  assign blocks_1_io_renable = readPorts_1_en; // @[LVT_set.scala 29:57]
  assign blocks_1_io_raddr = readPorts_1_addr; // @[LVT_set.scala 28:55]
  assign blocks_1_io_waddr = writeport_addr; // @[LVT_set.scala 35:38]
  assign blocks_1_io_dataIn = writeport_data; // @[LVT_set.scala 33:39]
  assign blocks_2_clock = clock;
  assign blocks_2_io_wenable = writeport_en; // @[LVT_set.scala 34:40]
  assign blocks_2_io_renable = readPorts_2_en; // @[LVT_set.scala 29:57]
  assign blocks_2_io_raddr = readPorts_2_addr; // @[LVT_set.scala 28:55]
  assign blocks_2_io_waddr = writeport_addr; // @[LVT_set.scala 35:38]
  assign blocks_2_io_dataIn = writeport_data; // @[LVT_set.scala 33:39]
endmodule
module LVT_Mem(
  input         clock,
  input         reset,
  input         writePorts_0_en,
  input  [5:0]  writePorts_0_addr,
  input  [63:0] writePorts_0_data,
  input         writePorts_1_en,
  input  [5:0]  writePorts_1_addr,
  input  [63:0] writePorts_1_data,
  input         writePorts_2_en,
  input  [5:0]  writePorts_2_addr,
  input  [63:0] writePorts_2_data,
  input         writePorts_3_en,
  input  [5:0]  writePorts_3_addr,
  input  [63:0] writePorts_3_data,
  input         readPorts_0_en,
  input  [5:0]  readPorts_0_addr,
  output [63:0] readPorts_0_data,
  input         readPorts_1_en,
  input  [5:0]  readPorts_1_addr,
  output [63:0] readPorts_1_data,
  input         readPorts_2_en,
  input  [5:0]  readPorts_2_addr,
  output [63:0] readPorts_2_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  lvtSets_0_clock; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_0_readPorts_0_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_0_readPorts_0_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_0_readPorts_0_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_0_readPorts_1_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_0_readPorts_1_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_0_readPorts_1_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_0_readPorts_2_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_0_readPorts_2_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_0_readPorts_2_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_0_writeport_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_0_writeport_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_0_writeport_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_1_clock; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_1_readPorts_0_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_1_readPorts_0_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_1_readPorts_0_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_1_readPorts_1_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_1_readPorts_1_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_1_readPorts_1_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_1_readPorts_2_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_1_readPorts_2_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_1_readPorts_2_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_1_writeport_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_1_writeport_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_1_writeport_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_2_clock; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_2_readPorts_0_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_2_readPorts_0_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_2_readPorts_0_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_2_readPorts_1_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_2_readPorts_1_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_2_readPorts_1_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_2_readPorts_2_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_2_readPorts_2_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_2_readPorts_2_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_2_writeport_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_2_writeport_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_2_writeport_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_3_clock; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_3_readPorts_0_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_3_readPorts_0_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_3_readPorts_0_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_3_readPorts_1_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_3_readPorts_1_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_3_readPorts_1_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_3_readPorts_2_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_3_readPorts_2_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_3_readPorts_2_data; // @[LVT_Mem.scala 11:36]
  wire  lvtSets_3_writeport_en; // @[LVT_Mem.scala 11:36]
  wire [5:0] lvtSets_3_writeport_addr; // @[LVT_Mem.scala 11:36]
  wire [63:0] lvtSets_3_writeport_data; // @[LVT_Mem.scala 11:36]
  reg [1:0] lvt [0:63]; // @[LVT_Mem.scala 17:16]
  wire  lvt_selRegs_0_MPORT_en; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_selRegs_0_MPORT_addr; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_selRegs_0_MPORT_data; // @[LVT_Mem.scala 17:16]
  wire  lvt_selRegs_1_MPORT_en; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_selRegs_1_MPORT_addr; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_selRegs_1_MPORT_data; // @[LVT_Mem.scala 17:16]
  wire  lvt_selRegs_2_MPORT_en; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_selRegs_2_MPORT_addr; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_selRegs_2_MPORT_data; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_MPORT_data; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_MPORT_addr; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_mask; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_en; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_MPORT_1_data; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_MPORT_1_addr; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_1_mask; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_1_en; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_MPORT_2_data; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_MPORT_2_addr; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_2_mask; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_2_en; // @[LVT_Mem.scala 17:16]
  wire [1:0] lvt_MPORT_3_data; // @[LVT_Mem.scala 17:16]
  wire [5:0] lvt_MPORT_3_addr; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_3_mask; // @[LVT_Mem.scala 17:16]
  wire  lvt_MPORT_3_en; // @[LVT_Mem.scala 17:16]
  reg [1:0] selRegs_0; // @[LVT_Mem.scala 27:37]
  reg [1:0] selRegs_1; // @[LVT_Mem.scala 27:37]
  reg [1:0] selRegs_2; // @[LVT_Mem.scala 27:37]
  wire  _readPorts_0_data_T = selRegs_0 == 2'h0; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_0_data_T_1 = selRegs_0 == 2'h1; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_0_data_T_2 = selRegs_0 == 2'h2; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_0_data_T_3 = selRegs_0 == 2'h3; // @[LVT_Mem.scala 35:100]
  wire [63:0] _readPorts_0_data_T_4 = _readPorts_0_data_T_3 ? lvtSets_3_readPorts_0_data : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _readPorts_0_data_T_5 = _readPorts_0_data_T_2 ? lvtSets_2_readPorts_0_data : _readPorts_0_data_T_4; // @[Mux.scala 101:16]
  wire [63:0] _readPorts_0_data_T_6 = _readPorts_0_data_T_1 ? lvtSets_1_readPorts_0_data : _readPorts_0_data_T_5; // @[Mux.scala 101:16]
  wire  _readPorts_1_data_T = selRegs_1 == 2'h0; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_1_data_T_1 = selRegs_1 == 2'h1; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_1_data_T_2 = selRegs_1 == 2'h2; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_1_data_T_3 = selRegs_1 == 2'h3; // @[LVT_Mem.scala 35:100]
  wire [63:0] _readPorts_1_data_T_4 = _readPorts_1_data_T_3 ? lvtSets_3_readPorts_1_data : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _readPorts_1_data_T_5 = _readPorts_1_data_T_2 ? lvtSets_2_readPorts_1_data : _readPorts_1_data_T_4; // @[Mux.scala 101:16]
  wire [63:0] _readPorts_1_data_T_6 = _readPorts_1_data_T_1 ? lvtSets_1_readPorts_1_data : _readPorts_1_data_T_5; // @[Mux.scala 101:16]
  wire  _readPorts_2_data_T = selRegs_2 == 2'h0; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_2_data_T_1 = selRegs_2 == 2'h1; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_2_data_T_2 = selRegs_2 == 2'h2; // @[LVT_Mem.scala 35:100]
  wire  _readPorts_2_data_T_3 = selRegs_2 == 2'h3; // @[LVT_Mem.scala 35:100]
  wire [63:0] _readPorts_2_data_T_4 = _readPorts_2_data_T_3 ? lvtSets_3_readPorts_2_data : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _readPorts_2_data_T_5 = _readPorts_2_data_T_2 ? lvtSets_2_readPorts_2_data : _readPorts_2_data_T_4; // @[Mux.scala 101:16]
  wire [63:0] _readPorts_2_data_T_6 = _readPorts_2_data_T_1 ? lvtSets_1_readPorts_2_data : _readPorts_2_data_T_5; // @[Mux.scala 101:16]
  LVT_set lvtSets_0 ( // @[LVT_Mem.scala 11:36]
    .clock(lvtSets_0_clock),
    .readPorts_0_en(lvtSets_0_readPorts_0_en),
    .readPorts_0_addr(lvtSets_0_readPorts_0_addr),
    .readPorts_0_data(lvtSets_0_readPorts_0_data),
    .readPorts_1_en(lvtSets_0_readPorts_1_en),
    .readPorts_1_addr(lvtSets_0_readPorts_1_addr),
    .readPorts_1_data(lvtSets_0_readPorts_1_data),
    .readPorts_2_en(lvtSets_0_readPorts_2_en),
    .readPorts_2_addr(lvtSets_0_readPorts_2_addr),
    .readPorts_2_data(lvtSets_0_readPorts_2_data),
    .writeport_en(lvtSets_0_writeport_en),
    .writeport_addr(lvtSets_0_writeport_addr),
    .writeport_data(lvtSets_0_writeport_data)
  );
  LVT_set lvtSets_1 ( // @[LVT_Mem.scala 11:36]
    .clock(lvtSets_1_clock),
    .readPorts_0_en(lvtSets_1_readPorts_0_en),
    .readPorts_0_addr(lvtSets_1_readPorts_0_addr),
    .readPorts_0_data(lvtSets_1_readPorts_0_data),
    .readPorts_1_en(lvtSets_1_readPorts_1_en),
    .readPorts_1_addr(lvtSets_1_readPorts_1_addr),
    .readPorts_1_data(lvtSets_1_readPorts_1_data),
    .readPorts_2_en(lvtSets_1_readPorts_2_en),
    .readPorts_2_addr(lvtSets_1_readPorts_2_addr),
    .readPorts_2_data(lvtSets_1_readPorts_2_data),
    .writeport_en(lvtSets_1_writeport_en),
    .writeport_addr(lvtSets_1_writeport_addr),
    .writeport_data(lvtSets_1_writeport_data)
  );
  LVT_set lvtSets_2 ( // @[LVT_Mem.scala 11:36]
    .clock(lvtSets_2_clock),
    .readPorts_0_en(lvtSets_2_readPorts_0_en),
    .readPorts_0_addr(lvtSets_2_readPorts_0_addr),
    .readPorts_0_data(lvtSets_2_readPorts_0_data),
    .readPorts_1_en(lvtSets_2_readPorts_1_en),
    .readPorts_1_addr(lvtSets_2_readPorts_1_addr),
    .readPorts_1_data(lvtSets_2_readPorts_1_data),
    .readPorts_2_en(lvtSets_2_readPorts_2_en),
    .readPorts_2_addr(lvtSets_2_readPorts_2_addr),
    .readPorts_2_data(lvtSets_2_readPorts_2_data),
    .writeport_en(lvtSets_2_writeport_en),
    .writeport_addr(lvtSets_2_writeport_addr),
    .writeport_data(lvtSets_2_writeport_data)
  );
  LVT_set lvtSets_3 ( // @[LVT_Mem.scala 11:36]
    .clock(lvtSets_3_clock),
    .readPorts_0_en(lvtSets_3_readPorts_0_en),
    .readPorts_0_addr(lvtSets_3_readPorts_0_addr),
    .readPorts_0_data(lvtSets_3_readPorts_0_data),
    .readPorts_1_en(lvtSets_3_readPorts_1_en),
    .readPorts_1_addr(lvtSets_3_readPorts_1_addr),
    .readPorts_1_data(lvtSets_3_readPorts_1_data),
    .readPorts_2_en(lvtSets_3_readPorts_2_en),
    .readPorts_2_addr(lvtSets_3_readPorts_2_addr),
    .readPorts_2_data(lvtSets_3_readPorts_2_data),
    .writeport_en(lvtSets_3_writeport_en),
    .writeport_addr(lvtSets_3_writeport_addr),
    .writeport_data(lvtSets_3_writeport_data)
  );
  assign lvt_selRegs_0_MPORT_en = 1'h1;
  assign lvt_selRegs_0_MPORT_addr = readPorts_0_addr;
  assign lvt_selRegs_0_MPORT_data = lvt[lvt_selRegs_0_MPORT_addr]; // @[LVT_Mem.scala 17:16]
  assign lvt_selRegs_1_MPORT_en = 1'h1;
  assign lvt_selRegs_1_MPORT_addr = readPorts_1_addr;
  assign lvt_selRegs_1_MPORT_data = lvt[lvt_selRegs_1_MPORT_addr]; // @[LVT_Mem.scala 17:16]
  assign lvt_selRegs_2_MPORT_en = 1'h1;
  assign lvt_selRegs_2_MPORT_addr = readPorts_2_addr;
  assign lvt_selRegs_2_MPORT_data = lvt[lvt_selRegs_2_MPORT_addr]; // @[LVT_Mem.scala 17:16]
  assign lvt_MPORT_data = 2'h0;
  assign lvt_MPORT_addr = writePorts_0_addr;
  assign lvt_MPORT_mask = 1'h1;
  assign lvt_MPORT_en = writePorts_0_en;
  assign lvt_MPORT_1_data = 2'h1;
  assign lvt_MPORT_1_addr = writePorts_1_addr;
  assign lvt_MPORT_1_mask = 1'h1;
  assign lvt_MPORT_1_en = writePorts_1_en;
  assign lvt_MPORT_2_data = 2'h2;
  assign lvt_MPORT_2_addr = writePorts_2_addr;
  assign lvt_MPORT_2_mask = 1'h1;
  assign lvt_MPORT_2_en = writePorts_2_en;
  assign lvt_MPORT_3_data = 2'h3;
  assign lvt_MPORT_3_addr = writePorts_3_addr;
  assign lvt_MPORT_3_mask = 1'h1;
  assign lvt_MPORT_3_en = writePorts_3_en;
  assign readPorts_0_data = _readPorts_0_data_T ? lvtSets_0_readPorts_0_data : _readPorts_0_data_T_6; // @[Mux.scala 101:16]
  assign readPorts_1_data = _readPorts_1_data_T ? lvtSets_0_readPorts_1_data : _readPorts_1_data_T_6; // @[Mux.scala 101:16]
  assign readPorts_2_data = _readPorts_2_data_T ? lvtSets_0_readPorts_2_data : _readPorts_2_data_T_6; // @[Mux.scala 101:16]
  assign lvtSets_0_clock = clock;
  assign lvtSets_0_readPorts_0_en = readPorts_0_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_0_readPorts_0_addr = readPorts_0_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_0_readPorts_1_en = readPorts_1_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_0_readPorts_1_addr = readPorts_1_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_0_readPorts_2_en = readPorts_2_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_0_readPorts_2_addr = readPorts_2_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_0_writeport_en = writePorts_0_en; // @[LVT_Mem.scala 14:53]
  assign lvtSets_0_writeport_addr = writePorts_0_addr; // @[LVT_Mem.scala 14:53]
  assign lvtSets_0_writeport_data = writePorts_0_data; // @[LVT_Mem.scala 14:53]
  assign lvtSets_1_clock = clock;
  assign lvtSets_1_readPorts_0_en = readPorts_0_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_1_readPorts_0_addr = readPorts_0_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_1_readPorts_1_en = readPorts_1_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_1_readPorts_1_addr = readPorts_1_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_1_readPorts_2_en = readPorts_2_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_1_readPorts_2_addr = readPorts_2_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_1_writeport_en = writePorts_1_en; // @[LVT_Mem.scala 14:53]
  assign lvtSets_1_writeport_addr = writePorts_1_addr; // @[LVT_Mem.scala 14:53]
  assign lvtSets_1_writeport_data = writePorts_1_data; // @[LVT_Mem.scala 14:53]
  assign lvtSets_2_clock = clock;
  assign lvtSets_2_readPorts_0_en = readPorts_0_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_2_readPorts_0_addr = readPorts_0_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_2_readPorts_1_en = readPorts_1_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_2_readPorts_1_addr = readPorts_1_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_2_readPorts_2_en = readPorts_2_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_2_readPorts_2_addr = readPorts_2_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_2_writeport_en = writePorts_2_en; // @[LVT_Mem.scala 14:53]
  assign lvtSets_2_writeport_addr = writePorts_2_addr; // @[LVT_Mem.scala 14:53]
  assign lvtSets_2_writeport_data = writePorts_2_data; // @[LVT_Mem.scala 14:53]
  assign lvtSets_3_clock = clock;
  assign lvtSets_3_readPorts_0_en = readPorts_0_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_3_readPorts_0_addr = readPorts_0_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_3_readPorts_1_en = readPorts_1_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_3_readPorts_1_addr = readPorts_1_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_3_readPorts_2_en = readPorts_2_en; // @[LVT_Mem.scala 31:67]
  assign lvtSets_3_readPorts_2_addr = readPorts_2_addr; // @[LVT_Mem.scala 31:67]
  assign lvtSets_3_writeport_en = writePorts_3_en; // @[LVT_Mem.scala 14:53]
  assign lvtSets_3_writeport_addr = writePorts_3_addr; // @[LVT_Mem.scala 14:53]
  assign lvtSets_3_writeport_data = writePorts_3_data; // @[LVT_Mem.scala 14:53]
  always @(posedge clock) begin
    if (lvt_MPORT_en & lvt_MPORT_mask) begin
      lvt[lvt_MPORT_addr] <= lvt_MPORT_data; // @[LVT_Mem.scala 17:16]
    end
    if (lvt_MPORT_1_en & lvt_MPORT_1_mask) begin
      lvt[lvt_MPORT_1_addr] <= lvt_MPORT_1_data; // @[LVT_Mem.scala 17:16]
    end
    if (lvt_MPORT_2_en & lvt_MPORT_2_mask) begin
      lvt[lvt_MPORT_2_addr] <= lvt_MPORT_2_data; // @[LVT_Mem.scala 17:16]
    end
    if (lvt_MPORT_3_en & lvt_MPORT_3_mask) begin
      lvt[lvt_MPORT_3_addr] <= lvt_MPORT_3_data; // @[LVT_Mem.scala 17:16]
    end
    if (reset) begin // @[LVT_Mem.scala 27:37]
      selRegs_0 <= 2'h0; // @[LVT_Mem.scala 27:37]
    end else begin
      selRegs_0 <= lvt_selRegs_0_MPORT_data; // @[LVT_Mem.scala 28:42]
    end
    if (reset) begin // @[LVT_Mem.scala 27:37]
      selRegs_1 <= 2'h0; // @[LVT_Mem.scala 27:37]
    end else begin
      selRegs_1 <= lvt_selRegs_1_MPORT_data; // @[LVT_Mem.scala 28:42]
    end
    if (reset) begin // @[LVT_Mem.scala 27:37]
      selRegs_2 <= 2'h0; // @[LVT_Mem.scala 27:37]
    end else begin
      selRegs_2 <= lvt_selRegs_2_MPORT_data; // @[LVT_Mem.scala 28:42]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    lvt[initvar] = _RAND_0[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  selRegs_0 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  selRegs_1 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  selRegs_2 = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
