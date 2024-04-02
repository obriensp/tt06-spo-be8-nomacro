`default_nettype none
`timescale 1ns/1ns

// decodes a 2-digit hex number for the 1bitsquared 7-segment PMOD
module seven_segment(
  input clk,
  input reset,
  input [7:0] value,
  output [7:0] pmod
);
  reg [4:0] segCounter;
  wire segIndex;

  always @(posedge clk)
    begin
      if (reset)
        segCounter <= 0;
      else
        segCounter <= segCounter + 1;
    end

  digit_decoder decoder(segIndex ? value[3:0] : value[7:4], pmod[0], pmod[1], pmod[2], pmod[3], pmod[4], pmod[5], pmod[6]);

  assign segIndex = segCounter[4];
  assign pmod[7] = segIndex;
endmodule

// decodes a single hex digit from a 4-bit value
module digit_decoder(
  input [3:0] value,
  output A,
  output B,
  output C,
  output D,
  output E,
  output F,
  output G
);
  reg [6:0] segments;
  assign {A, B, C, D, E, F, G} = segments;

  always @(*)
    case (value)
      4'h0: segments = 7'b0000001;
      4'h1: segments = 7'b1001111;
      4'h2: segments = 7'b0010010;
      4'h3: segments = 7'b0000110;
      4'h4: segments = 7'b1001100;
      4'h5: segments = 7'b0100100;
      4'h6: segments = 7'b0100000;
      4'h7: segments = 7'b0001111;
      4'h8: segments = 7'b0000000;
      4'h9: segments = 7'b0000100;
      4'hA: segments = 7'b0001000;
      4'hB: segments = 7'b1100000;
      4'hC: segments = 7'b0110001;
      4'hD: segments = 7'b1000010;
      4'hE: segments = 7'b0110000;
      4'hF: segments = 7'b0111000;
      default: segments = 7'b1111111;
    endcase
endmodule
