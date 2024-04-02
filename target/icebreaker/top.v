`default_nettype none
`timescale 1ns/1ps

module icebreaker_top(
  input wire CLK12MHZ,
  input wire RESETn,
  inout wire SCL,
  inout wire SDA,

  input wire P1B1, P1B2, P1B3, P1B4, P1B7, P1B8, P1B9, P1B10
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
    .CLK(CLK12MHZ),
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

  reg [7:0] in0, in1;
  always @(posedge CLK12MHZ)
    begin
      if (~RESETn)
        begin
          in0 <= 8'b0;
          in1 <= 8'b0;
        end
      else
        begin
          in0 <= {P1B1, P1B2, P1B3, P1B4, P1B7, P1B8, P1B9, P1B10};
          in1 <= in0;
        end
    end

  debugger_apb debugger(
    .PCLK(CLK12MHZ),
    .PRESETn(RESETn),
    .PSEL(psel),
    .PADDR(paddr),
    .PENABLE(penable),
    .PWRITE(pwrite),
    .PWDATA(pwdata),
    .PRDATA(prdata),
    .PREADY(pready),
    .INREG(in1)
  );

  SB_IO #(
    .PIN_TYPE({4'b1010, 2'b01}),
    .IO_STANDARD("SB_LVCMOS"),
    .PULLUP(1'b0)
  ) io_scl (
    .PACKAGE_PIN(SCL),
    .LATCH_INPUT_VALUE(),
    .CLOCK_ENABLE(1'b1),
    .INPUT_CLK(CLK12MHZ),
    .OUTPUT_CLK(CLK12MHZ),
    .OUTPUT_ENABLE(~scl_t),
    .D_OUT_0(scl_o),
    .D_OUT_1(scl_o),
    .D_IN_1(scl_i),
    .D_IN_0(),
  );

  SB_IO #(
    .PIN_TYPE({4'b1010, 2'b01}),
    .IO_STANDARD("SB_LVCMOS"),
    .PULLUP(1'b0)
  ) io_sda (
    .PACKAGE_PIN(SDA),
    .LATCH_INPUT_VALUE(),
    .CLOCK_ENABLE(1'b1),
    .INPUT_CLK(CLK12MHZ),
    .OUTPUT_CLK(CLK12MHZ),
    .OUTPUT_ENABLE(~sda_t),
    .D_OUT_0(sda_o),
    .D_OUT_1(sda_o),
    .D_IN_1(sda_i),
    .D_IN_0(),
  );

endmodule
