/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_ram8_macro (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  RAM8 u_ram(
    .CLK(clk),
    .EN0(rst_n),
    .WE0(uio_in[3]),
    .A0(uio_in[2:0]),
    .Di0(ui_in),
    .Do0(uo_out)
  );

  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

endmodule
