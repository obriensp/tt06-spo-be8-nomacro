`default_nettype none
`timescale 1ns/1ns

module RAM8(
  input CLK,
  input EN0,
  input WE0,
  input [2:0] A0,
  input [7:0] Di0,
  output [7:0] Do0
);

reg [7:0] memory[0:7];

always @(posedge CLK)
  begin
    if (EN0 & WE0)
      memory[A0] <= Di0;
  end

assign Do0 = (EN0 & ~WE0) ? memory[A0] : 8'b0;

endmodule
