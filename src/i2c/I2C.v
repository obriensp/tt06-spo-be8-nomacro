/// -- sta-blackbox

`define default_netname none
`timescale 1ns/1ps

module I2C(
`ifdef USE_POWER_PINS
    input wire        VPWR,
    input wire        VGND,
`endif
    input  wire [3:2] uio_in,   // IOs: Input path
    output wire [3:2] uio_out,  // IOs: Output path
    output wire [3:2] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset

    output wire        PCLK,
    output wire        PRESETn,
    output wire        PSEL,
    output wire  [4:0] PADDR,
    output wire        PENABLE,
    output wire        PWRITE,
    output wire  [7:0] PWDATA,
    input wire   [7:0] PRDATA,
    input wire         PREADY
);
  wire scl_i;
  wire scl_o;
  wire scl_t;
  wire sda_i;
  wire sda_o;
  wire sda_t;

  wire psel;
  wire [4:0] paddr;
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

    .PSEL(PSEL),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY)
  );

  reg reset_reg;
  always @(posedge clk)
    begin
      reset_reg <= rst_n;
    end

  assign PCLK    = clk;

  // reset with async assertion, sync deassertion
  assign PRESETn = reset_reg & rst_n;

  assign scl_i = uio_in[2];
  assign sda_i = uio_in[3];
  assign uio_out[2] = scl_o;
  assign uio_out[3] = sda_o;
  assign uio_oe[2]  = ~scl_t;
  assign uio_oe[3]  = ~sda_t;

endmodule
