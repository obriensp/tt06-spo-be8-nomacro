`default_nettype none
`timescale 1ns/1ns

module core(
`ifdef USE_POWER_PINS
  input wire        VPWR,
  input wire        VGND,
`endif
  input wire        CLK,
  input wire        RESETn,

  input wire        DEBUG_REQUEST,
  output wire       DEBUG_ACK,
  input wire  [7:0] DEBUG_DATA,
  input wire        D_CLR, D_HLT, D_CE, D_SU,
  input wire        D_AIn, D_BIn, D_OIn, D_IIn, D_Jn, D_FIn, D_MIn, D_RI,
  input wire        D_DOn, D_AOn, D_BOn, D_IOn, D_COn, D_EOn, D_ROn, D_NOn,

  output wire [7:0] BUS,
  input wire  [7:0] INREG,
  output wire [7:0] OUTREG,
  output wire       HALTED
);
  reg halt;
  wire [3:0] OPCODE;
  wire CF, ZF;

  always @(posedge CLK)
    begin
      if (~RESETn)
        halt <= 1'b0;
      else if (HLT)
        halt <= 1'b1;
    end

  assign HALTED = halt;

  // transition to DEBUG when control T0 and DEBUG_REQUEST are both high
  // any other input, transition to NON_DEBUG
  reg debug;
  always @(posedge CLK)
    begin
      if (~RESETn)
        debug <= 1'b0;
      else if (C_T0 & DEBUG_REQUEST)
        debug <= 1'b1;
      else
        debug <= 1'b0;
    end

  assign DEBUG_ACK = debug;

  wire C_RUN;
  wire C_CLR, C_HLT, C_CE, C_SU;
  wire C_AIn, C_BIn, C_OIn, C_IIn, C_Jn, C_FIn, C_MIn, C_RI;
  wire C_AOn, C_BOn, C_IOn, C_COn, C_EOn, C_ROn, C_NOn;
  wire C_T0;
  control control(
    .CLK(CLK),
    .RESETn(RESETn),

    .RUN(C_RUN),

    .OPCODE(OPCODE),
    .CF(CF),
    .ZF(ZF),

    .CLR(C_CLR), .HLT(C_HLT), .CE(C_CE), .SU(C_SU),
    .AIn(C_AIn), .BIn(C_BIn), .OIn(C_OIn), .IIn(C_IIn), .Jn(C_Jn), .FIn(C_FIn), .MIn(C_MIn), .RI(C_RI),
    .AOn(C_AOn), .BOn(C_BOn), .IOn(C_IOn), .COn(C_COn), .EOn(C_EOn), .ROn(C_ROn), .NOn(C_NOn),

    .T0(C_T0)
  );

  // Don't run the control module if we're halted or if the debugger is enabled
  assign C_RUN = ~debug & ~halt;

  wire CLR, HLT, CE, SU;
  wire AIn, BIn, OIn, IIn, Jn, FIn, MIn, RI;
  wire DOn, AOn, BOn, IOn, COn, EOn, ROn, NOn;
  datapath datapath(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .CLK(CLK),
    .RESETn(RESETn),

    .CLR(CLR), .CE(CE), .SU(SU),
    .AIn(AIn), .BIn(BIn), .OIn(OIn), .IIn(IIn), .Jn(Jn), .FIn(FIn), .MIn(MIn), .RI(RI),
    .DOn(DOn), .AOn(AOn), .BOn(BOn), .IOn(IOn), .COn(COn), .EOn(EOn), .ROn(ROn), .NOn(NOn),

    .DEBUG(DEBUG_DATA),

    .BUS(BUS),
    .OPCODE(OPCODE),
    .CF(CF), .ZF(ZF),

    .INREG(INREG),
    .OUTREG(OUTREG)
  );

  assign CLR = debug ? D_CLR : C_CLR;
  assign HLT = debug ? D_HLT : C_HLT;
  assign CE  = debug ? D_CE  : C_CE;
  assign SU  = debug ? D_SU  : C_SU;
  assign AIn = debug ? D_AIn : C_AIn;
  assign BIn = debug ? D_BIn : C_BIn;
  assign OIn = debug ? D_OIn : C_OIn;
  assign IIn = debug ? D_IIn : C_IIn;
  assign Jn  = debug ? D_Jn  : C_Jn;
  assign FIn = debug ? D_FIn : C_FIn;
  assign MIn = debug ? D_MIn : C_MIn;
  assign RI  = debug ? D_RI  : C_RI;
  assign DOn = debug ? D_DOn : 1'b1;
  assign AOn = debug ? D_AOn : C_AOn;
  assign BOn = debug ? D_BOn : C_BOn;
  assign IOn = debug ? D_IOn : C_IOn;
  assign COn = debug ? D_COn : C_COn;
  assign EOn = debug ? D_EOn : C_EOn;
  assign ROn = debug ? D_ROn : C_ROn;
  assign NOn = debug ? D_NOn : C_NOn;
endmodule
