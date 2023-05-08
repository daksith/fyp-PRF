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
  reg [63:0] mem [0:63]; // @[SRAM_block.scala 15:24]
  wire  mem_io_dataOut_MPORT_en; // @[SRAM_block.scala 15:24]
  wire [5:0] mem_io_dataOut_MPORT_addr; // @[SRAM_block.scala 15:24]
  wire [63:0] mem_io_dataOut_MPORT_data; // @[SRAM_block.scala 15:24]
  wire [63:0] mem_MPORT_data; // @[SRAM_block.scala 15:24]
  wire [5:0] mem_MPORT_addr; // @[SRAM_block.scala 15:24]
  wire  mem_MPORT_mask; // @[SRAM_block.scala 15:24]
  wire  mem_MPORT_en; // @[SRAM_block.scala 15:24]
  reg  mem_io_dataOut_MPORT_en_pipe_0;
  reg [5:0] mem_io_dataOut_MPORT_addr_pipe_0;
  assign mem_io_dataOut_MPORT_en = mem_io_dataOut_MPORT_en_pipe_0;
  assign mem_io_dataOut_MPORT_addr = mem_io_dataOut_MPORT_addr_pipe_0;
  assign mem_io_dataOut_MPORT_data = mem[mem_io_dataOut_MPORT_addr]; // @[SRAM_block.scala 15:24]
  assign mem_MPORT_data = io_dataIn;
  assign mem_MPORT_addr = io_waddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wenable;
  assign io_dataOut = mem_io_dataOut_MPORT_data; // @[SRAM_block.scala 21:14]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM_block.scala 15:24]
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
  input         io_wenable,
  input         io_r1enable,
  input         io_r2enable,
  input         io_r3enable,
  input  [5:0]  io_r1addr,
  input  [5:0]  io_r2addr,
  input  [5:0]  io_r3addr,
  input  [5:0]  io_waddr,
  input  [63:0] io_wdata,
  output [63:0] io_r1data,
  output [63:0] io_r2data,
  output [63:0] io_r3data
);
  wire  b1_clock; // @[LVT_set.scala 20:18]
  wire  b1_io_wenable; // @[LVT_set.scala 20:18]
  wire  b1_io_renable; // @[LVT_set.scala 20:18]
  wire [5:0] b1_io_raddr; // @[LVT_set.scala 20:18]
  wire [5:0] b1_io_waddr; // @[LVT_set.scala 20:18]
  wire [63:0] b1_io_dataIn; // @[LVT_set.scala 20:18]
  wire [63:0] b1_io_dataOut; // @[LVT_set.scala 20:18]
  wire  b2_clock; // @[LVT_set.scala 21:18]
  wire  b2_io_wenable; // @[LVT_set.scala 21:18]
  wire  b2_io_renable; // @[LVT_set.scala 21:18]
  wire [5:0] b2_io_raddr; // @[LVT_set.scala 21:18]
  wire [5:0] b2_io_waddr; // @[LVT_set.scala 21:18]
  wire [63:0] b2_io_dataIn; // @[LVT_set.scala 21:18]
  wire [63:0] b2_io_dataOut; // @[LVT_set.scala 21:18]
  wire  b3_clock; // @[LVT_set.scala 22:18]
  wire  b3_io_wenable; // @[LVT_set.scala 22:18]
  wire  b3_io_renable; // @[LVT_set.scala 22:18]
  wire [5:0] b3_io_raddr; // @[LVT_set.scala 22:18]
  wire [5:0] b3_io_waddr; // @[LVT_set.scala 22:18]
  wire [63:0] b3_io_dataIn; // @[LVT_set.scala 22:18]
  wire [63:0] b3_io_dataOut; // @[LVT_set.scala 22:18]
  ReadWriteSmem b1 ( // @[LVT_set.scala 20:18]
    .clock(b1_clock),
    .io_wenable(b1_io_wenable),
    .io_renable(b1_io_renable),
    .io_raddr(b1_io_raddr),
    .io_waddr(b1_io_waddr),
    .io_dataIn(b1_io_dataIn),
    .io_dataOut(b1_io_dataOut)
  );
  ReadWriteSmem b2 ( // @[LVT_set.scala 21:18]
    .clock(b2_clock),
    .io_wenable(b2_io_wenable),
    .io_renable(b2_io_renable),
    .io_raddr(b2_io_raddr),
    .io_waddr(b2_io_waddr),
    .io_dataIn(b2_io_dataIn),
    .io_dataOut(b2_io_dataOut)
  );
  ReadWriteSmem b3 ( // @[LVT_set.scala 22:18]
    .clock(b3_clock),
    .io_wenable(b3_io_wenable),
    .io_renable(b3_io_renable),
    .io_raddr(b3_io_raddr),
    .io_waddr(b3_io_waddr),
    .io_dataIn(b3_io_dataIn),
    .io_dataOut(b3_io_dataOut)
  );
  assign io_r1data = b1_io_dataOut; // @[LVT_set.scala 35:13]
  assign io_r2data = b2_io_dataOut; // @[LVT_set.scala 36:13]
  assign io_r3data = b3_io_dataOut; // @[LVT_set.scala 37:13]
  assign b1_clock = clock;
  assign b1_io_wenable = io_wenable; // @[LVT_set.scala 24:17]
  assign b1_io_renable = io_r1enable; // @[LVT_set.scala 31:17]
  assign b1_io_raddr = io_r1addr; // @[LVT_set.scala 39:15]
  assign b1_io_waddr = io_waddr; // @[LVT_set.scala 43:15]
  assign b1_io_dataIn = io_wdata; // @[LVT_set.scala 27:16]
  assign b2_clock = clock;
  assign b2_io_wenable = io_wenable; // @[LVT_set.scala 25:17]
  assign b2_io_renable = io_r2enable; // @[LVT_set.scala 32:17]
  assign b2_io_raddr = io_r2addr; // @[LVT_set.scala 40:15]
  assign b2_io_waddr = io_waddr; // @[LVT_set.scala 44:15]
  assign b2_io_dataIn = io_wdata; // @[LVT_set.scala 28:16]
  assign b3_clock = clock;
  assign b3_io_wenable = io_wenable; // @[LVT_set.scala 26:17]
  assign b3_io_renable = io_r3enable; // @[LVT_set.scala 33:17]
  assign b3_io_raddr = io_r3addr; // @[LVT_set.scala 41:15]
  assign b3_io_waddr = io_waddr; // @[LVT_set.scala 45:15]
  assign b3_io_dataIn = io_wdata; // @[LVT_set.scala 29:16]
endmodule
