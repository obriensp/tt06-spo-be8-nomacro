/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_register (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  register u_reg(
    .CLK(clk),
    .RESETn(rst_n),

    .CLR(uio_in[0]),

    .DIN(ui_in),
    .DOUT(uo_out),
    .LOADn(uio_in[1])
  );

  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

endmodule
