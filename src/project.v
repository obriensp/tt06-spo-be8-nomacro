/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns/1ps

module tt_um_spo_i2ctest(
`ifdef USE_POWER_PINS
    input wire        VPWR,
    input wire        VGND,
`endif
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  wire        PCLK;
  wire        PRESETn;
  wire        PSEL;
  wire  [4:0] PADDR;
  wire        PENABLE;
  wire        PWRITE;
  wire  [7:0] PWDATA;
  wire  [7:0] PRDATA;
  wire        PREADY;

  I2C i2c(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .ui_in(ui_in),
    .uo_out(uo_out),
    .uio_in(uio_in),
    .uio_out(uio_out),
    .uio_oe(uio_oe),
    .ena(ena),
    .clk(clk),
    .rst_n(rst_n),

    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PSEL(PSEL),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY)
  );

  debugger_apb debugger(
  `ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
  `endif
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PSEL(PSEL),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY),
    .INREG(8'b0)
  );

endmodule


module reflector(
  input wire         PCLK,
  input wire         PRESETn,

  input wire         PSEL,
  input wire   [4:0] PADDR,
  input wire         PENABLE,
  input wire         PWRITE,
  input wire   [7:0] PWDATA,
  output wire  [7:0] PRDATA,
  output wire        PREADY
);

  // assign PRDATA = {3'b0, PADDR};
  assign PRDATA = 8'b0;
  assign PREADY = 1'b1;

endmodule
