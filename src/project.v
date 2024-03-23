/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_datapath (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [18:0] inputs;
  wire [5:0] outputs;
  wire [7:0] outreg;
  datapath dp(
    .CLK(clk),
    .RESETn(rst_n),

    .CLR(inputs[18]),
    .CE(inputs[17]),
    .SU(inputs[16]),
    .AIn(inputs[15]),
    .BIn(inputs[14]),
    .OIn(inputs[13]),
    .IIn(inputs[12]),
    .Jn(inputs[11]),
    .FIn(inputs[10]),
    .MIn(inputs[9]),
    .RI(inputs[8]),
    .DOn(inputs[7]),
    .AOn(inputs[6]),
    .BOn(inputs[5]),
    .IOn(inputs[4]),
    .COn(inputs[3]),
    .EOn(inputs[2]),
    .ROn(inputs[1]),
    .NOn(inputs[0]),

    .DEBUG(ui_in),

    .BUS(uo_out),
    .OPCODE(outputs[3:0]),
    .CF(outputs[4]),
    .ZF(outputs[5]),

    .INREG(ui_in),
    .OUTREG(outreg)
  );

  assign uio_out = {2'b0, outputs};
  assign uio_oe = 8'b0;

  reg toggle;
  always @(posedge clk)
    if (~rst_n)
      toggle <= 1'b0;
    else
      toggle <= ~toggle;

  assign inputs = {3'b011, uio_in, ui_in};

endmodule
