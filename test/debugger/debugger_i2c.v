`default_nettype none
`timescale 1ns/1ps

module debugger_i2c(
  input wire       CLK,
  input wire       RESETn,

  input wire [7:0] INREG,

  input wire       scl_i,
  input wire       scl_o,
  input wire       scl_t,
  input wire       sda_i,
  input wire       sda_o,
  input wire       sda_t
);

  wire psel;
  wire [7:0] paddr;
  wire penable;
  wire pwrite;
  wire [7:0] pwdata;
  wire [7:0] prdata;
  wire pready;
  i2c_to_apb adapter(
    .CLK(CLK),
    .RESETn(RESETn),

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
    .PCLK(CLK),
    .PRESETn(RESETn),
    .PSEL(psel),
    .PADDR(paddr),
    .PENABLE(penable),
    .PWRITE(pwrite),
    .PWDATA(pwdata),
    .PRDATA(prdata),
    .PREADY(pready),
    .INREG(INREG)
  );
endmodule
