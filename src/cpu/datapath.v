`default_nettype none
`timescale 1ns/1ns

module datapath(
`ifdef USE_POWER_PINS
  input wire VPWR,
  input wire VGND,
`endif
  input wire CLK,
  input wire RESETn,

  input wire CLR,
  input wire CE,
  input wire SU,
  input wire AIn, BIn, OIn, IIn, Jn, FIn, MIn, RI,
  input wire DOn, AOn, BOn, IOn, COn, EOn, ROn, NOn,

  input wire [7:0] DEBUG,

  output wire [7:0] BUS,
  output wire [3:0] OPCODE,
  output wire CF, ZF,

  input wire  [7:0] INREG,
  output wire [7:0] OUTREG
);

  // A register
  wire [7:0] A_OUT;
  register a_reg(CLK, RESETn, CLR, BUS, A_OUT, AIn);

  // B register
  wire [7:0] B_OUT;
  register b_reg(CLK, RESETn, CLR, BUS, B_OUT, BIn);

  // Output register
  register out_reg(CLK, RESETn, CLR, BUS, OUTREG, OIn);

  // Instruction register
  wire [7:0] IR_OUT;
  register ir_reg(CLK, RESETn, CLR, BUS, IR_OUT, IIn);
  assign OPCODE = IR_OUT[7:4];

  // Program Counter
  wire [3:0] PC_OUT;
  pc pc_reg(CLK, RESETn, CLR, Jn, CE, BUS[3:0], PC_OUT);

  // ALU
  wire [7:0] ALU_OUT;
  alu alu(
    .CLK(CLK),
    .RESETn(RESETn),
    .CLR(CLR),
    .A(A_OUT),
    .B(B_OUT),
    .SU(SU),
    .FIn(FIn),
    .RESULT(ALU_OUT),
    .CF(CF),
    .ZF(ZF)
  );

  // Memory address
  wire [3:0] ADDR;
  register4 address_register(CLK, RESETn, CLR, BUS[3:0], ADDR, MIn);

  // RAM
  wire [7:0] RAM_OUT;
  ram ram(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .CLK(CLK),
    .RESETn(RESETn),
    .ADDR(ADDR),
    .DIN(BUS),
    .DOUT(RAM_OUT),
    .RI(RI)
  );

  // Bus mux
  bus_mux bmux(
    DOn, AOn, BOn, IOn, COn, EOn, ROn, NOn,
    DEBUG, A_OUT, B_OUT, {4'b0, IR_OUT[3:0]}, {4'b0, PC_OUT}, ALU_OUT, RAM_OUT, INREG,
    BUS
  );
endmodule
