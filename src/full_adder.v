`default_nettype none
`timescale 1ns/1ns

module full_adder(
  input [7:0] a,
  input [7:0] b,
  input c_in,

  output [7:0] sum,
  output c_out
);

  assign {c_out, sum} = a + b + c_in;

endmodule
