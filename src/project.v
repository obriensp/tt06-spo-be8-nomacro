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
  // All output pins must be assigned. If not used, assign to 0.
assign uo_out  = ui_in - uio_in;  // Example: ou_out is the difference of ui_in and uio_in

reg [7:0] in0, in1;
always @(posedge clk)
  begin
    if (~rst_n)
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

wire scl_i;
wire scl_o;
wire scl_t;
wire sda_i;
wire sda_o;
wire sda_t;

wire psel;
wire [7:0] paddr;
wire penable;
wire pwrite;
wire [7:0] pwdata;
wire [7:0] prdata;
wire pready;
i2c_to_apb adapter(
  .CLK(clk),
  .RESETn(rst_n),

  .scl_i(scl_i),
  .scl_o(scl_o),
  .scl_t(scl_t),
  .sda_i(sda_i),
  .sda_o(sda_o),
  .sda_t(sda_t),

  .device_address(7'd42),
  .device_address_mask(7'h7F),

  .PSEL(psel),
  .PADDR(paddr),
  .PENABLE(penable),
  .PWRITE(pwrite),
  .PWDATA(pwdata),
  .PRDATA(prdata),
  .PREADY(pready)
);

debugger_apb debugger(
`ifdef USE_POWER_PINS
  .VPWR(VPWR),
  .VGND(VGND),
`endif
  .PCLK(clk),
  .PRESETn(rst_n),
  .PSEL(psel),
  .PADDR(paddr),
  .PENABLE(penable),
  .PWRITE(pwrite),
  .PWDATA(pwdata),
  .PRDATA(prdata),
  .PREADY(pready),
  .INREG(in1)
);

assign scl_i = uio_in[2];
assign sda_i = uio_in[3];
assign uio_out[2] = scl_o;
assign uio_out[3] = sda_o;
assign uio_oe[2]  = scl_t;
assign uio_oe[3]  = sda_t;

assign uio_out[1:0] = 2'b0;
assign uio_out[7:4] = 4'b0;
assign uio_oe[1:0]  = 2'b0;
assign uio_oe[7:4]  = 4'b0;

endmodule
