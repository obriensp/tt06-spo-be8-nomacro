`default_nettype none
`timescale 1ns/1ns

module ram(
  input wire CLK,
  input wire RESETn,

  input wire [3:0] ADDR,
  input wire [7:0] DIN,
  output wire [7:0] DOUT,
  input wire RI
);

  wire [7:0] out0;
  wire [7:0] out1;

  wire RAM0_EN = ~ADDR[3];
  wire RAM1_EN =  ADDR[3];

  RAM8 bank0(
    .CLK(CLK),
    .EN0(RESETn & RAM0_EN),
    .WE0(RI),
    .A0(ADDR[2:0]),
    .Di0(DIN),
    .Do0(out0)
  );

  RAM8 bank1(
    .CLK(CLK),
    .EN0(RESETn & RAM1_EN),
    .WE0(RI),
    .A0(ADDR[2:0]),
    .Di0(DIN),
    .Do0(out1)
  );

  assign DOUT  = RAM0_EN ? out0 : out1;

endmodule
