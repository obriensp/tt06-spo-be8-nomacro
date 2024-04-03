`default_nettype none
`timescale 1ns/1ns

module ram(
`ifdef USE_POWER_PINS
  input wire        VPWR,
  input wire        VGND,
`endif

  input wire CLK,
  input wire RESETn,

  input wire [3:0] ADDR,
  input wire [7:0] DIN,
  output wire [7:0] DOUT,
  input wire RI
);

  // wire [7:0] out0;
  // wire [7:0] out1;

  // wire RAM0_EN = ~ADDR[3];
  // wire RAM1_EN =  ADDR[3];

  RAM16 bank0(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .CLK(CLK),
    .EN0(1'b1),
    .WE0(RI),
    .A0(ADDR),
    .Di0(DIN),
    .Do0(DOUT)
  );

//   RAM8 bank1(
// `ifdef USE_POWER_PINS
//     .VPWR(VPWR),
//     .VGND(VGND),
// `endif
//     .CLK(CLK),
//     .EN0(RAM1_EN),
//     .WE0(RI),
//     .A0(ADDR[2:0]),
//     .Di0(DIN),
//     .Do0(out1)
//   );

  // assign DOUT = RI ? 8'b0 : (RAM0_EN ? out0 : out1);

endmodule
