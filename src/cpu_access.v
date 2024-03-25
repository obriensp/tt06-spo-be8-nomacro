`default_nettype none
`timescale 1ns/1ps

module cpu_access(
  input wire         PCLK,
  input wire         PRESETn,

  input wire         PSEL,
  input wire   [4:0] PADDR,
  input wire         PENABLE,
  input wire         PWRITE,
  input wire   [7:0] PWDATA,
  output wire  [7:0] PRDATA,
  output wire        PREADY,

  output wire  [7:0] DEBUG_DATA,
  output wire        D_CLR, D_HLT, D_CE, D_SU,
  output wire        D_AIn, D_BIn, D_OIn, D_IIn, D_Jn, D_FIn, D_MIn, D_RI,
  output wire        D_DOn, D_AOn, D_BOn, D_IOn, D_COn, D_EOn, D_ROn, D_NOn,

  input wire   [7:0] BUS,
  input wire   [7:0] OUTREG
);
  reg previous_enable;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        previous_enable <= 1'b0;
      else
        previous_enable <= PENABLE;
    end

  wire activating = PSEL & PENABLE & ~previous_enable;
  reg [1:0] counter;
  reg active;
  reg [4:0] addr;
  reg write;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        begin
          active  <= 1'b0;
          counter <= 2'b0;
          addr    <= 5'b0;
          write   <= 1'b0;
        end
      else if (activating)
        begin
          active <= 1'b1;
          counter <= 2'b0;
          addr    <= PADDR[4:0];
          write   <= PWRITE;
        end
      else if (active)
        begin
          if (PREADY)
            active <= 1'b0;
          else
            counter <= counter + 1;
        end
    end

  wire microcode_pready;
  wire PADDR_OR_PWDATA;
  wire OUTREG_OR_BUS;
  wire microcode_AIn, microcode_BIn, microcode_OIn, microcode_IIn;
  wire microcode_Jn, microcode_FIn, microcode_MIn, microcode_RI;
  wire microcode_DOn, microcode_AOn, microcode_BOn, microcode_IOn;
  wire microcode_COn, microcode_EOn, microcode_ROn, microcode_NOn;

  debugger_microcode microcode(
    .ADDR(addr),
    .WRITE(write),
    .STEP(counter),
    .PREADY(microcode_pready),
    .PADDR_OR_PWDATA(PADDR_OR_PWDATA),
    .OUTREG_OR_BUS(OUTREG_OR_BUS),
    .D_AIn(microcode_AIn),
    .D_BIn(microcode_BIn),
    .D_OIn(microcode_OIn),
    .D_IIn(microcode_IIn),
    .D_Jn(microcode_Jn),
    .D_FIn(microcode_FIn),
    .D_MIn(microcode_MIn),
    .D_RI(microcode_RI),
    .D_DOn(microcode_DOn),
    .D_AOn(microcode_AOn),
    .D_BOn(microcode_BOn),
    .D_IOn(microcode_IOn),
    .D_COn(microcode_COn),
    .D_EOn(microcode_EOn),
    .D_ROn(microcode_ROn),
    .D_NOn(microcode_NOn)
  );

  wire [7:0] debug_data;
  assign debug_data = PADDR_OR_PWDATA ? {PADDR - 5'd8} : PWDATA[7:0];
  assign DEBUG_DATA = debug_data;

  wire [7:0] rdata;
  assign rdata = OUTREG_OR_BUS ? OUTREG : BUS;
  assign PRDATA = rdata;
  assign PREADY = active & microcode_pready;

  assign D_CLR = 1'b0;
  assign D_HLT = 1'b0;
  assign D_CE  = 1'b0;
  assign D_SU  = 1'b0;
  assign D_AIn = ~active | microcode_AIn;
  assign D_BIn = ~active | microcode_BIn;
  assign D_OIn = ~active | microcode_OIn;
  assign D_IIn = ~active | microcode_IIn;
  assign D_Jn  = ~active | microcode_Jn;
  assign D_FIn = ~active | microcode_FIn;
  assign D_MIn = ~active | microcode_MIn;
  assign D_RI  =  active & microcode_RI;
  assign D_DOn = ~active | microcode_DOn;
  assign D_AOn = ~active | microcode_AOn;
  assign D_BOn = ~active | microcode_BOn;
  assign D_IOn = ~active | microcode_IOn;
  assign D_COn = ~active | microcode_COn;
  assign D_EOn = ~active | microcode_EOn;
  assign D_ROn = ~active | microcode_ROn;
  assign D_NOn = ~active | microcode_NOn;
endmodule
