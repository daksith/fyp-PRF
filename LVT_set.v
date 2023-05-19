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
  input         reset,
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
  wire  blocks_0_clock; // @[LVT_set.scala 18:35]
  wire  blocks_0_io_wenable; // @[LVT_set.scala 18:35]
  wire  blocks_0_io_renable; // @[LVT_set.scala 18:35]
  wire [5:0] blocks_0_io_raddr; // @[LVT_set.scala 18:35]
  wire [5:0] blocks_0_io_waddr; // @[LVT_set.scala 18:35]
  wire [63:0] blocks_0_io_dataIn; // @[LVT_set.scala 18:35]
  wire [63:0] blocks_0_io_dataOut; // @[LVT_set.scala 18:35]
  wire  blocks_1_clock; // @[LVT_set.scala 18:35]
  wire  blocks_1_io_wenable; // @[LVT_set.scala 18:35]
  wire  blocks_1_io_renable; // @[LVT_set.scala 18:35]
  wire [5:0] blocks_1_io_raddr; // @[LVT_set.scala 18:35]
  wire [5:0] blocks_1_io_waddr; // @[LVT_set.scala 18:35]
  wire [63:0] blocks_1_io_dataIn; // @[LVT_set.scala 18:35]
  wire [63:0] blocks_1_io_dataOut; // @[LVT_set.scala 18:35]
  wire  blocks_2_clock; // @[LVT_set.scala 18:35]
  wire  blocks_2_io_wenable; // @[LVT_set.scala 18:35]
  wire  blocks_2_io_renable; // @[LVT_set.scala 18:35]
  wire [5:0] blocks_2_io_raddr; // @[LVT_set.scala 18:35]
  wire [5:0] blocks_2_io_waddr; // @[LVT_set.scala 18:35]
  wire [63:0] blocks_2_io_dataIn; // @[LVT_set.scala 18:35]
  wire [63:0] blocks_2_io_dataOut; // @[LVT_set.scala 18:35]
  ReadWriteSmem blocks_0 ( // @[LVT_set.scala 18:35]
    .clock(blocks_0_clock),
    .io_wenable(blocks_0_io_wenable),
    .io_renable(blocks_0_io_renable),
    .io_raddr(blocks_0_io_raddr),
    .io_waddr(blocks_0_io_waddr),
    .io_dataIn(blocks_0_io_dataIn),
    .io_dataOut(blocks_0_io_dataOut)
  );
  ReadWriteSmem blocks_1 ( // @[LVT_set.scala 18:35]
    .clock(blocks_1_clock),
    .io_wenable(blocks_1_io_wenable),
    .io_renable(blocks_1_io_renable),
    .io_raddr(blocks_1_io_raddr),
    .io_waddr(blocks_1_io_waddr),
    .io_dataIn(blocks_1_io_dataIn),
    .io_dataOut(blocks_1_io_dataOut)
  );
  ReadWriteSmem blocks_2 ( // @[LVT_set.scala 18:35]
    .clock(blocks_2_clock),
    .io_wenable(blocks_2_io_wenable),
    .io_renable(blocks_2_io_renable),
    .io_raddr(blocks_2_io_raddr),
    .io_waddr(blocks_2_io_waddr),
    .io_dataIn(blocks_2_io_dataIn),
    .io_dataOut(blocks_2_io_dataOut)
  );
  assign readPorts_0_data = blocks_0_io_dataOut; // @[LVT_set.scala 23:62]
  assign readPorts_1_data = blocks_1_io_dataOut; // @[LVT_set.scala 23:62]
  assign readPorts_2_data = blocks_2_io_dataOut; // @[LVT_set.scala 23:62]
  assign blocks_0_clock = clock;
  assign blocks_0_io_wenable = writeport_en; // @[LVT_set.scala 27:40]
  assign blocks_0_io_renable = readPorts_0_en; // @[LVT_set.scala 22:57]
  assign blocks_0_io_raddr = readPorts_0_addr; // @[LVT_set.scala 21:55]
  assign blocks_0_io_waddr = writeport_addr; // @[LVT_set.scala 28:38]
  assign blocks_0_io_dataIn = writeport_data; // @[LVT_set.scala 26:39]
  assign blocks_1_clock = clock;
  assign blocks_1_io_wenable = writeport_en; // @[LVT_set.scala 27:40]
  assign blocks_1_io_renable = readPorts_1_en; // @[LVT_set.scala 22:57]
  assign blocks_1_io_raddr = readPorts_1_addr; // @[LVT_set.scala 21:55]
  assign blocks_1_io_waddr = writeport_addr; // @[LVT_set.scala 28:38]
  assign blocks_1_io_dataIn = writeport_data; // @[LVT_set.scala 26:39]
  assign blocks_2_clock = clock;
  assign blocks_2_io_wenable = writeport_en; // @[LVT_set.scala 27:40]
  assign blocks_2_io_renable = readPorts_2_en; // @[LVT_set.scala 22:57]
  assign blocks_2_io_raddr = readPorts_2_addr; // @[LVT_set.scala 21:55]
  assign blocks_2_io_waddr = writeport_addr; // @[LVT_set.scala 28:38]
  assign blocks_2_io_dataIn = writeport_data; // @[LVT_set.scala 26:39]
endmodule
