/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns/1ps

module tt_um_obriensp_be8(
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

  wire [3:2] i2c_uio_out;
  wire [3:2] i2c_uio_oe;
  I2C i2c(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .uio_in(uio_in[3:2]),
    .uio_out(i2c_uio_out),
    .uio_oe(i2c_uio_oe),
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

  reg [7:0] in0, in1;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        begin
          in0 <= 8'b0;
          in1 <= 8'b0;
        end
      else
        begin
          in0 <= ui_in;
          in1 <= in0;
        end
    end

  wire halted;
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
    .INREG(in1),
    .OUTREG(uo_out),
    .HALTED(halted)
  );

  assign uio_out = {3'b0, halted, i2c_uio_out[3:2], 2'b0};
  assign uio_oe  = {3'b0,  1'b1,   i2c_uio_oe[3:2], 2'b0};

endmodule
