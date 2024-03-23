/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_i2c_to_apb (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  /*
  module i2c_to_apb(
    input wire CLK,
    input wire RESETn,

    input  wire        scl_i,
    output wire        scl_o,
    output wire        scl_t,
    input  wire        sda_i,
    output wire        sda_o,
    output wire        sda_t,

    input wire   [6:0] device_address,
    input wire   [6:0] device_address_mask,

    output wire        PSEL,
    output wire  [7:0] PADDR,
    output wire        PENABLE,
    output wire        PWRITE,
    output wire  [7:0] PWDATA,
    input wire   [7:0] PRDATA,
    input wire         PREADY
  );
  */

  wire [7:0] paddr;
  wire [7:0] pwdata;
  i2c_to_apb u_i2c(
    .CLK(clk),
    .RESETn(rst_n),

    .scl_i(uio_in[2]),
    .scl_o(uio_out[2]),
    .scl_t(uio_oe[2]),

    .sda_i(uio_in[3]),
    .sda_o(uio_out[3]),
    .sda_t(uio_oe[3]),

    .device_address(7'd42),
    .device_address_mask(7'h7F),

    .PSEL(uio_out[0]),
    .PADDR(paddr),
    .PENABLE(uio_out[1]),
    .PWRITE(uio_out[4]),
    .PWDATA(pwdata),
    .PRDATA(ui_in),
    .PREADY(uio_in[5])
  );

  assign uio_oe[0] = 1'b1;
  assign uio_oe[1] = 1'b1;
  // 2 and 3 are SCL/SDA
  assign uio_oe[4] = 1'b1;
  assign uio_oe[5] = 1'b0;
  assign uio_oe[6] = 1'b0;
  assign uio_oe[7] = 1'b0;

  assign uio_out[5] = 1'b0;
  assign uio_out[6] = 1'b0;
  assign uio_out[7] = 1'b0;

  reg toggle;
  always @(posedge clk)
    begin
      if (~rst_n)
        toggle <= 1'b0;
      else
        toggle <= ~toggle;
    end

  assign uo_out = toggle ? paddr : pwdata;

endmodule
