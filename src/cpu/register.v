`default_nettype none
`timescale 1ns/1ns

module register(
  input wire        CLK,
  input wire        RESETn,

  input wire        CLR,

  input wire  [7:0] DIN,
  output wire [7:0] DOUT,
  input wire        LOADn
);

  reg [7:0] data;

  always @(posedge CLK)
    begin
      if (~RESETn | CLR)
        data <= 8'b0;
      else if (~LOADn)
        data <= DIN;
    end

  assign DOUT = data;

endmodule
