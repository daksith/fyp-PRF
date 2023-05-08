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
module LVT_Mem(
  input         clock,
  input         reset,
  input  [5:0]  io_R1_addr,
  output [63:0] io_R1_data,
  input         io_R1_en,
  input  [5:0]  io_R2_addr,
  output [63:0] io_R2_data,
  input         io_R2_en,
  input  [5:0]  io_R3_addr,
  output [63:0] io_R3_data,
  input         io_R3_en,
  input  [5:0]  io_W1_addr,
  input  [63:0] io_W1_data,
  input         io_W1_en,
  input  [5:0]  io_W2_addr,
  input  [63:0] io_W2_data,
  input         io_W2_en,
  input  [5:0]  io_W3_addr,
  input  [63:0] io_W3_data,
  input         io_W3_en,
  input  [5:0]  io_W4_addr,
  input  [63:0] io_W4_data,
  input         io_W4_en
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] LVT [0:63]; // @[LVT_Mem.scala 32:16]
  wire  LVT_r1_sel_reg_MPORT_en; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_r1_sel_reg_MPORT_addr; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_r1_sel_reg_MPORT_data; // @[LVT_Mem.scala 32:16]
  wire  LVT_r2_sel_reg_MPORT_en; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_r2_sel_reg_MPORT_addr; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_r2_sel_reg_MPORT_data; // @[LVT_Mem.scala 32:16]
  wire  LVT_r3_sel_reg_MPORT_en; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_r3_sel_reg_MPORT_addr; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_r3_sel_reg_MPORT_data; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_MPORT_data; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_MPORT_addr; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_mask; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_en; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_MPORT_1_data; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_MPORT_1_addr; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_1_mask; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_1_en; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_MPORT_2_data; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_MPORT_2_addr; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_2_mask; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_2_en; // @[LVT_Mem.scala 32:16]
  wire [1:0] LVT_MPORT_3_data; // @[LVT_Mem.scala 32:16]
  wire [5:0] LVT_MPORT_3_addr; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_3_mask; // @[LVT_Mem.scala 32:16]
  wire  LVT_MPORT_3_en; // @[LVT_Mem.scala 32:16]
  wire  s1_clock; // @[LVT_Mem.scala 35:18]
  wire  s1_io_wenable; // @[LVT_Mem.scala 35:18]
  wire  s1_io_r1enable; // @[LVT_Mem.scala 35:18]
  wire  s1_io_r2enable; // @[LVT_Mem.scala 35:18]
  wire  s1_io_r3enable; // @[LVT_Mem.scala 35:18]
  wire [5:0] s1_io_r1addr; // @[LVT_Mem.scala 35:18]
  wire [5:0] s1_io_r2addr; // @[LVT_Mem.scala 35:18]
  wire [5:0] s1_io_r3addr; // @[LVT_Mem.scala 35:18]
  wire [5:0] s1_io_waddr; // @[LVT_Mem.scala 35:18]
  wire [63:0] s1_io_wdata; // @[LVT_Mem.scala 35:18]
  wire [63:0] s1_io_r1data; // @[LVT_Mem.scala 35:18]
  wire [63:0] s1_io_r2data; // @[LVT_Mem.scala 35:18]
  wire [63:0] s1_io_r3data; // @[LVT_Mem.scala 35:18]
  wire  s2_clock; // @[LVT_Mem.scala 36:18]
  wire  s2_io_wenable; // @[LVT_Mem.scala 36:18]
  wire  s2_io_r1enable; // @[LVT_Mem.scala 36:18]
  wire  s2_io_r2enable; // @[LVT_Mem.scala 36:18]
  wire  s2_io_r3enable; // @[LVT_Mem.scala 36:18]
  wire [5:0] s2_io_r1addr; // @[LVT_Mem.scala 36:18]
  wire [5:0] s2_io_r2addr; // @[LVT_Mem.scala 36:18]
  wire [5:0] s2_io_r3addr; // @[LVT_Mem.scala 36:18]
  wire [5:0] s2_io_waddr; // @[LVT_Mem.scala 36:18]
  wire [63:0] s2_io_wdata; // @[LVT_Mem.scala 36:18]
  wire [63:0] s2_io_r1data; // @[LVT_Mem.scala 36:18]
  wire [63:0] s2_io_r2data; // @[LVT_Mem.scala 36:18]
  wire [63:0] s2_io_r3data; // @[LVT_Mem.scala 36:18]
  wire  s3_clock; // @[LVT_Mem.scala 37:18]
  wire  s3_io_wenable; // @[LVT_Mem.scala 37:18]
  wire  s3_io_r1enable; // @[LVT_Mem.scala 37:18]
  wire  s3_io_r2enable; // @[LVT_Mem.scala 37:18]
  wire  s3_io_r3enable; // @[LVT_Mem.scala 37:18]
  wire [5:0] s3_io_r1addr; // @[LVT_Mem.scala 37:18]
  wire [5:0] s3_io_r2addr; // @[LVT_Mem.scala 37:18]
  wire [5:0] s3_io_r3addr; // @[LVT_Mem.scala 37:18]
  wire [5:0] s3_io_waddr; // @[LVT_Mem.scala 37:18]
  wire [63:0] s3_io_wdata; // @[LVT_Mem.scala 37:18]
  wire [63:0] s3_io_r1data; // @[LVT_Mem.scala 37:18]
  wire [63:0] s3_io_r2data; // @[LVT_Mem.scala 37:18]
  wire [63:0] s3_io_r3data; // @[LVT_Mem.scala 37:18]
  wire  s4_clock; // @[LVT_Mem.scala 38:18]
  wire  s4_io_wenable; // @[LVT_Mem.scala 38:18]
  wire  s4_io_r1enable; // @[LVT_Mem.scala 38:18]
  wire  s4_io_r2enable; // @[LVT_Mem.scala 38:18]
  wire  s4_io_r3enable; // @[LVT_Mem.scala 38:18]
  wire [5:0] s4_io_r1addr; // @[LVT_Mem.scala 38:18]
  wire [5:0] s4_io_r2addr; // @[LVT_Mem.scala 38:18]
  wire [5:0] s4_io_r3addr; // @[LVT_Mem.scala 38:18]
  wire [5:0] s4_io_waddr; // @[LVT_Mem.scala 38:18]
  wire [63:0] s4_io_wdata; // @[LVT_Mem.scala 38:18]
  wire [63:0] s4_io_r1data; // @[LVT_Mem.scala 38:18]
  wire [63:0] s4_io_r2data; // @[LVT_Mem.scala 38:18]
  wire [63:0] s4_io_r3data; // @[LVT_Mem.scala 38:18]
  reg [1:0] r1_sel_reg; // @[LVT_Mem.scala 69:27]
  reg [1:0] r2_sel_reg; // @[LVT_Mem.scala 70:27]
  reg [1:0] r3_sel_reg; // @[LVT_Mem.scala 71:27]
  wire  _io_R1_data_T = r1_sel_reg == 2'h0; // @[LVT_Mem.scala 110:45]
  wire  _io_R1_data_T_1 = r1_sel_reg == 2'h1; // @[LVT_Mem.scala 110:79]
  wire  _io_R1_data_T_2 = r1_sel_reg == 2'h2; // @[LVT_Mem.scala 110:113]
  wire  _io_R1_data_T_3 = r1_sel_reg == 2'h3; // @[LVT_Mem.scala 110:147]
  wire [63:0] _io_R1_data_T_4 = _io_R1_data_T_3 ? s4_io_r1data : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_R1_data_T_5 = _io_R1_data_T_2 ? s3_io_r1data : _io_R1_data_T_4; // @[Mux.scala 101:16]
  wire [63:0] _io_R1_data_T_6 = _io_R1_data_T_1 ? s2_io_r1data : _io_R1_data_T_5; // @[Mux.scala 101:16]
  wire  _io_R2_data_T = r2_sel_reg == 2'h0; // @[LVT_Mem.scala 111:45]
  wire  _io_R2_data_T_1 = r2_sel_reg == 2'h1; // @[LVT_Mem.scala 111:79]
  wire  _io_R2_data_T_2 = r2_sel_reg == 2'h2; // @[LVT_Mem.scala 111:113]
  wire  _io_R2_data_T_3 = r2_sel_reg == 2'h3; // @[LVT_Mem.scala 111:147]
  wire [63:0] _io_R2_data_T_4 = _io_R2_data_T_3 ? s4_io_r2data : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_R2_data_T_5 = _io_R2_data_T_2 ? s3_io_r2data : _io_R2_data_T_4; // @[Mux.scala 101:16]
  wire [63:0] _io_R2_data_T_6 = _io_R2_data_T_1 ? s2_io_r2data : _io_R2_data_T_5; // @[Mux.scala 101:16]
  wire  _io_R3_data_T = r3_sel_reg == 2'h0; // @[LVT_Mem.scala 112:45]
  wire  _io_R3_data_T_1 = r3_sel_reg == 2'h1; // @[LVT_Mem.scala 112:79]
  wire  _io_R3_data_T_2 = r3_sel_reg == 2'h2; // @[LVT_Mem.scala 112:113]
  wire  _io_R3_data_T_3 = r3_sel_reg == 2'h3; // @[LVT_Mem.scala 112:147]
  wire [63:0] _io_R3_data_T_4 = _io_R3_data_T_3 ? s4_io_r3data : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_R3_data_T_5 = _io_R3_data_T_2 ? s3_io_r3data : _io_R3_data_T_4; // @[Mux.scala 101:16]
  wire [63:0] _io_R3_data_T_6 = _io_R3_data_T_1 ? s2_io_r3data : _io_R3_data_T_5; // @[Mux.scala 101:16]
  LVT_set s1 ( // @[LVT_Mem.scala 35:18]
    .clock(s1_clock),
    .io_wenable(s1_io_wenable),
    .io_r1enable(s1_io_r1enable),
    .io_r2enable(s1_io_r2enable),
    .io_r3enable(s1_io_r3enable),
    .io_r1addr(s1_io_r1addr),
    .io_r2addr(s1_io_r2addr),
    .io_r3addr(s1_io_r3addr),
    .io_waddr(s1_io_waddr),
    .io_wdata(s1_io_wdata),
    .io_r1data(s1_io_r1data),
    .io_r2data(s1_io_r2data),
    .io_r3data(s1_io_r3data)
  );
  LVT_set s2 ( // @[LVT_Mem.scala 36:18]
    .clock(s2_clock),
    .io_wenable(s2_io_wenable),
    .io_r1enable(s2_io_r1enable),
    .io_r2enable(s2_io_r2enable),
    .io_r3enable(s2_io_r3enable),
    .io_r1addr(s2_io_r1addr),
    .io_r2addr(s2_io_r2addr),
    .io_r3addr(s2_io_r3addr),
    .io_waddr(s2_io_waddr),
    .io_wdata(s2_io_wdata),
    .io_r1data(s2_io_r1data),
    .io_r2data(s2_io_r2data),
    .io_r3data(s2_io_r3data)
  );
  LVT_set s3 ( // @[LVT_Mem.scala 37:18]
    .clock(s3_clock),
    .io_wenable(s3_io_wenable),
    .io_r1enable(s3_io_r1enable),
    .io_r2enable(s3_io_r2enable),
    .io_r3enable(s3_io_r3enable),
    .io_r1addr(s3_io_r1addr),
    .io_r2addr(s3_io_r2addr),
    .io_r3addr(s3_io_r3addr),
    .io_waddr(s3_io_waddr),
    .io_wdata(s3_io_wdata),
    .io_r1data(s3_io_r1data),
    .io_r2data(s3_io_r2data),
    .io_r3data(s3_io_r3data)
  );
  LVT_set s4 ( // @[LVT_Mem.scala 38:18]
    .clock(s4_clock),
    .io_wenable(s4_io_wenable),
    .io_r1enable(s4_io_r1enable),
    .io_r2enable(s4_io_r2enable),
    .io_r3enable(s4_io_r3enable),
    .io_r1addr(s4_io_r1addr),
    .io_r2addr(s4_io_r2addr),
    .io_r3addr(s4_io_r3addr),
    .io_waddr(s4_io_waddr),
    .io_wdata(s4_io_wdata),
    .io_r1data(s4_io_r1data),
    .io_r2data(s4_io_r2data),
    .io_r3data(s4_io_r3data)
  );
  assign LVT_r1_sel_reg_MPORT_en = 1'h1;
  assign LVT_r1_sel_reg_MPORT_addr = io_R1_addr;
  assign LVT_r1_sel_reg_MPORT_data = LVT[LVT_r1_sel_reg_MPORT_addr]; // @[LVT_Mem.scala 32:16]
  assign LVT_r2_sel_reg_MPORT_en = 1'h1;
  assign LVT_r2_sel_reg_MPORT_addr = io_R2_addr;
  assign LVT_r2_sel_reg_MPORT_data = LVT[LVT_r2_sel_reg_MPORT_addr]; // @[LVT_Mem.scala 32:16]
  assign LVT_r3_sel_reg_MPORT_en = 1'h1;
  assign LVT_r3_sel_reg_MPORT_addr = io_R3_addr;
  assign LVT_r3_sel_reg_MPORT_data = LVT[LVT_r3_sel_reg_MPORT_addr]; // @[LVT_Mem.scala 32:16]
  assign LVT_MPORT_data = 2'h0;
  assign LVT_MPORT_addr = io_W1_addr;
  assign LVT_MPORT_mask = 1'h1;
  assign LVT_MPORT_en = io_W1_en;
  assign LVT_MPORT_1_data = 2'h1;
  assign LVT_MPORT_1_addr = io_W2_addr;
  assign LVT_MPORT_1_mask = 1'h1;
  assign LVT_MPORT_1_en = io_W2_en;
  assign LVT_MPORT_2_data = 2'h2;
  assign LVT_MPORT_2_addr = io_W3_addr;
  assign LVT_MPORT_2_mask = 1'h1;
  assign LVT_MPORT_2_en = io_W3_en;
  assign LVT_MPORT_3_data = 2'h3;
  assign LVT_MPORT_3_addr = io_W4_addr;
  assign LVT_MPORT_3_mask = 1'h1;
  assign LVT_MPORT_3_en = io_W4_en;
  assign io_R1_data = _io_R1_data_T ? s1_io_r1data : _io_R1_data_T_6; // @[Mux.scala 101:16]
  assign io_R2_data = _io_R2_data_T ? s1_io_r2data : _io_R2_data_T_6; // @[Mux.scala 101:16]
  assign io_R3_data = _io_R3_data_T ? s1_io_r3data : _io_R3_data_T_6; // @[Mux.scala 101:16]
  assign s1_clock = clock;
  assign s1_io_wenable = io_W1_en; // @[LVT_Mem.scala 55:17]
  assign s1_io_r1enable = io_R1_en; // @[LVT_Mem.scala 93:18]
  assign s1_io_r2enable = io_R2_en; // @[LVT_Mem.scala 98:18]
  assign s1_io_r3enable = io_R3_en; // @[LVT_Mem.scala 103:18]
  assign s1_io_r1addr = io_R1_addr; // @[LVT_Mem.scala 78:16]
  assign s1_io_r2addr = io_R2_addr; // @[LVT_Mem.scala 83:16]
  assign s1_io_r3addr = io_R3_addr; // @[LVT_Mem.scala 88:16]
  assign s1_io_waddr = io_W1_addr; // @[LVT_Mem.scala 63:15]
  assign s1_io_wdata = io_W1_data; // @[LVT_Mem.scala 59:15]
  assign s2_clock = clock;
  assign s2_io_wenable = io_W2_en; // @[LVT_Mem.scala 56:17]
  assign s2_io_r1enable = io_R1_en; // @[LVT_Mem.scala 94:18]
  assign s2_io_r2enable = io_R2_en; // @[LVT_Mem.scala 99:18]
  assign s2_io_r3enable = io_R3_en; // @[LVT_Mem.scala 104:18]
  assign s2_io_r1addr = io_R1_addr; // @[LVT_Mem.scala 79:16]
  assign s2_io_r2addr = io_R2_addr; // @[LVT_Mem.scala 84:16]
  assign s2_io_r3addr = io_R3_addr; // @[LVT_Mem.scala 89:16]
  assign s2_io_waddr = io_W2_addr; // @[LVT_Mem.scala 64:15]
  assign s2_io_wdata = io_W2_data; // @[LVT_Mem.scala 60:15]
  assign s3_clock = clock;
  assign s3_io_wenable = io_W3_en; // @[LVT_Mem.scala 57:17]
  assign s3_io_r1enable = io_R1_en; // @[LVT_Mem.scala 95:18]
  assign s3_io_r2enable = io_R2_en; // @[LVT_Mem.scala 100:18]
  assign s3_io_r3enable = io_R3_en; // @[LVT_Mem.scala 105:18]
  assign s3_io_r1addr = io_R1_addr; // @[LVT_Mem.scala 80:16]
  assign s3_io_r2addr = io_R2_addr; // @[LVT_Mem.scala 85:16]
  assign s3_io_r3addr = io_R3_addr; // @[LVT_Mem.scala 90:16]
  assign s3_io_waddr = io_W3_addr; // @[LVT_Mem.scala 65:15]
  assign s3_io_wdata = io_W3_data; // @[LVT_Mem.scala 61:15]
  assign s4_clock = clock;
  assign s4_io_wenable = io_W4_en; // @[LVT_Mem.scala 58:17]
  assign s4_io_r1enable = io_R1_en; // @[LVT_Mem.scala 96:18]
  assign s4_io_r2enable = io_R2_en; // @[LVT_Mem.scala 101:18]
  assign s4_io_r3enable = io_R3_en; // @[LVT_Mem.scala 106:18]
  assign s4_io_r1addr = io_R1_addr; // @[LVT_Mem.scala 81:16]
  assign s4_io_r2addr = io_R2_addr; // @[LVT_Mem.scala 86:16]
  assign s4_io_r3addr = io_R3_addr; // @[LVT_Mem.scala 91:16]
  assign s4_io_waddr = io_W4_addr; // @[LVT_Mem.scala 66:15]
  assign s4_io_wdata = io_W4_data; // @[LVT_Mem.scala 62:15]
  always @(posedge clock) begin
    if (LVT_MPORT_en & LVT_MPORT_mask) begin
      LVT[LVT_MPORT_addr] <= LVT_MPORT_data; // @[LVT_Mem.scala 32:16]
    end
    if (LVT_MPORT_1_en & LVT_MPORT_1_mask) begin
      LVT[LVT_MPORT_1_addr] <= LVT_MPORT_1_data; // @[LVT_Mem.scala 32:16]
    end
    if (LVT_MPORT_2_en & LVT_MPORT_2_mask) begin
      LVT[LVT_MPORT_2_addr] <= LVT_MPORT_2_data; // @[LVT_Mem.scala 32:16]
    end
    if (LVT_MPORT_3_en & LVT_MPORT_3_mask) begin
      LVT[LVT_MPORT_3_addr] <= LVT_MPORT_3_data; // @[LVT_Mem.scala 32:16]
    end
    if (reset) begin // @[LVT_Mem.scala 69:27]
      r1_sel_reg <= 2'h0; // @[LVT_Mem.scala 69:27]
    end else begin
      r1_sel_reg <= LVT_r1_sel_reg_MPORT_data; // @[LVT_Mem.scala 73:14]
    end
    if (reset) begin // @[LVT_Mem.scala 70:27]
      r2_sel_reg <= 2'h0; // @[LVT_Mem.scala 70:27]
    end else begin
      r2_sel_reg <= LVT_r2_sel_reg_MPORT_data; // @[LVT_Mem.scala 74:14]
    end
    if (reset) begin // @[LVT_Mem.scala 71:27]
      r3_sel_reg <= 2'h0; // @[LVT_Mem.scala 71:27]
    end else begin
      r3_sel_reg <= LVT_r3_sel_reg_MPORT_data; // @[LVT_Mem.scala 75:14]
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
    LVT[initvar] = _RAND_0[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r1_sel_reg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  r2_sel_reg = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  r3_sel_reg = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
