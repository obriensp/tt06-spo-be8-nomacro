`default_nettype none
`timescale 1ns/1ns

module pc(
  input wire CLK,
  input wire RESETn,

  input wire CLR,

  input wire Jn,
  input wire CE,
  input wire  [3:0] DIN,
  output wire [3:0] DOUT
);

  reg [3:0] value;

  always @(posedge CLK)
    begin
      if (~RESETn | CLR)
        value <= 4'b0;
      else if (~Jn)
        value <= DIN;
      else if (CE)
        value <= value + 1;
    end

  assign DOUT = value;
endmodule
