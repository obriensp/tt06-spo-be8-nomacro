`default_nettype none
`timescale 1ns/1ns

module bus_mux(
  input wire DOn,
  input wire AOn,
  input wire BOn,
  input wire IOn,
  input wire COn,
  input wire EOn,
  input wire ROn,
  input wire NOn,

  input wire [7:0] DEBUG,
  input wire [7:0] A,
  input wire [7:0] B,
  input wire [7:0] IR,
  input wire [7:0] PC,
  input wire [7:0] ALU,
  input wire [7:0] RAM,
  input wire [7:0] IN,

  output reg [7:0] DOUT
);

  always @(*)
     casez ({DOn, AOn, BOn, IOn, COn, EOn, ROn, NOn})
      8'b0???????: DOUT = DEBUG;
      8'b10??????: DOUT = A;
      8'b110?????: DOUT = B;
      8'b1110????: DOUT = IR;
      8'b11110???: DOUT = PC;
      8'b111110??: DOUT = ALU;
      8'b1111110?: DOUT = RAM;
      8'b11111110: DOUT = IN;
      default:     DOUT = 8'b0;
    endcase

endmodule
