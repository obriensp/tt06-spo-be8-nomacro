`default_nettype none
`timescale 1ns/1ns

module register4(
  input wire        CLK,
  input wire        RESETn,

  input wire        CLR,

  input wire  [3:0] DIN,
  output wire [3:0] DOUT,
  input wire        LOADn
);

  reg [3:0] data;

  always @(posedge CLK)
    begin
      if (~RESETn | CLR)
        data <= 4'b0;
      else if (~LOADn)
        data <= DIN;
    end

  assign DOUT = data;

endmodule
