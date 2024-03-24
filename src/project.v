/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_ram8_macro (
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

  wire debug_ack;
  wire [7:0] bus;
  core u_core(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif

    .CLK(clk),
    .RESETn(rst_n),

    .DEBUG_REQUEST(1'b0),
    .DEBUG_ACK(debug_ack),
    .DEBUG_DATA(8'b0),

    .D_CLR(1'b0),
    .D_HLT(1'b0),
    .D_CE(1'b0),
    .D_SU(1'b0),
    .D_AIn(1'b0),
    .D_BIn(1'b0),
    .D_OIn(1'b0),
    .D_IIn(1'b0),
    .D_Jn(1'b0),
    .D_FIn(1'b0),
    .D_MIn(1'b0),
    .D_RI(1'b0),
    .D_DOn(1'b0),
    .D_AOn(1'b0),
    .D_BOn(1'b0),
    .D_IOn(1'b0),
    .D_COn(1'b0),
    .D_EOn(1'b0),
    .D_ROn(1'b0),
    .D_NOn(1'b0),

    .BUS(bus),
    .INREG(ui_in),
    .OUTREG(uo_out),
    .HALTED(uio_out[0])
  );

  assign uio_out[7:1] = 7'b0;
  assign uio_oe[0] = 1'b1;
  assign uio_oe[7:1] = 7'b0;

endmodule
