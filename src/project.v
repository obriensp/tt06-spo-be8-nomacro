/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_debugger_microcode (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [18:0] outputs;
  debugger_microcode dmc(
    .ADDR(ui_in[4:0]),
    .WRITE(ui_in[5]),
    .STEP(ui_in[7:6]),
    .PREADY(outputs[18]),
    .PADDR_OR_PWDATA(outputs[17]),
    .OUTREG_OR_BUS(outputs[16]),
    .D_AIn(outputs[15]),
    .D_BIn(outputs[14]),
    .D_OIn(outputs[13]),
    .D_IIn(outputs[12]),
    .D_Jn(outputs[11]),
    .D_FIn(outputs[10]),
    .D_MIn(outputs[9]),
    .D_RI(outputs[8]),
    .D_DOn(outputs[7]),
    .D_AOn(outputs[6]),
    .D_BOn(outputs[5]),
    .D_IOn(outputs[4]),
    .D_COn(outputs[3]),
    .D_EOn(outputs[2]),
    .D_ROn(outputs[1]),
    .D_NOn(outputs[0])
  );

  assign uo_out = outputs[7:0];
  assign uio_out = outputs[15:8];
  assign uio_oe = {outputs[18:16], 5'b0};

endmodule
