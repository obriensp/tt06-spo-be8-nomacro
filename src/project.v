/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_microcode (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [17:0] outputs;
  microcode mc(
    .OPCODE(ui_in[7:4]),
    .FLAGS(ui_in[3:2]),
    .STEP(ui_in[1:0]),

    .HLT(outputs[17]),
    .CE(outputs[16]),
    .SU(outputs[15]),
    .AIn(outputs[14]),
    .BIn(outputs[13]),
    .OIn(outputs[12]),
    .IIn(outputs[11]),
    .Jn(outputs[10]),
    .FIn(outputs[9]),
    .MIn(outputs[8]),
    .RI(outputs[7]),

    .AOn(outputs[6]),
    .BOn(outputs[5]),
    .IOn(outputs[4]),
    .COn(outputs[3]),
    .EOn(outputs[2]),
    .ROn(outputs[1]),
    .NOn(outputs[0])
  );

  assign uo_out[7:0]  = outputs[7:0];
  assign uio_out[7:0] = outputs[15:8];
  assign uio_oe[7:0]  = 8'b1;

endmodule
