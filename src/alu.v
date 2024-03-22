`default_nettype none
`timescale 1ns/1ps

module alu(
  input wire CLK,
  input wire RESETn,

  input wire CLR,

  input wire [7:0] A,
  input wire [7:0] B,
  input wire SU,
  input wire FIn,

  output wire [7:0] RESULT,
  output wire CF,
  output wire ZF
);
  reg [1:0] flags;
  wire next_zero;
  wire next_carry;

  full_adder add(
    .a(A),
    .b(B ^ {8{SU}}),
    .c_in(SU),

    .sum(RESULT),
    .c_out(next_carry)
  );

  always @(posedge CLK)
    begin
      if (~RESETn | CLR)
        flags <= 2'b0;
      else if (~FIn)
        flags <= {next_zero, next_carry};
    end

  assign next_zero = RESULT == 8'b0 && ~next_carry;
  assign CF = flags[0];
  assign ZF = flags[1];

endmodule
