`default_nettype none
`timescale 1ns/1ps

module alchitry_top(
  input wire CLK100MHZ,
  input wire RESETn,

  inout wire SCL,
  inout wire SDA,

  output wire [7:0] LED,
  output wire [7:0] segments,
  output wire [3:0] anodes
);

  wire CLK;
  wire pll_locked;
  pll u_pll(
    .clock_in(CLK100MHZ),
    .clock_out(CLK),
    .locked(pll_locked)
  );

  reg led;
  reg [31:0] counter;

  always @(posedge CLK)
    begin
      if (~RESETn)
        begin
          led <= 1'b1;
          counter <= 0;
        end
      else
        begin
          counter <= counter + 1;

          if (counter == 0)
          begin
            led <= ~led;
          end
        end
    end

  wire scl_i;
  wire scl_o;
  wire scl_t;
  wire sda_i;
  wire sda_o;
  wire sda_t;

  SB_IO #(
    .PIN_TYPE({4'b1010, 2'b01}),
    .IO_STANDARD("SB_LVCMOS"),
    .PULLUP(1'b0)
  ) io_scl (
    .PACKAGE_PIN(SCL),
    .LATCH_INPUT_VALUE(),
    .CLOCK_ENABLE(1'b1),
    .INPUT_CLK(CLK),
    .OUTPUT_CLK(CLK),
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
    .INPUT_CLK(CLK),
    .OUTPUT_CLK(CLK),
    .OUTPUT_ENABLE(~sda_t),
    .D_OUT_0(sda_o),
    .D_OUT_1(sda_o),
    .D_IN_1(sda_i),
    .D_IN_0(),
  );

  wire       psel;
  wire [4:0] paddr;
  wire       penable;
  wire       pwrite;
  wire [7:0] pwdata;
  wire [7:0] prdata;
  wire       pready;
  i2c_to_apb i2c_adapter(
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

  wire [7:0] outreg;
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
    .INREG(8'b0),
    .OUTREG(outreg),
    .HALTED()
  );

  wire [15:0] value = {8'b0, outreg};
  wire [3:0] nibbles[0:3];
  assign nibbles[0] = value[15:12];
  assign nibbles[1] = value[11:8];
  assign nibbles[2] = value[7:4];
  assign nibbles[3] = value[3:0];

  wire [1:0] current_segment = counter[15:12];
  digit_decoder dd(
    .value(nibbles[current_segment]),
    .A(segments[0]),
    .B(segments[1]),
    .C(segments[2]),
    .D(segments[3]),
    .E(segments[4]),
    .F(segments[5]),
    .G(segments[6])
  );

  decoder_inv di(
    .in(current_segment),
    .out(anodes)
  );

  // assign LED = led;
  assign LED = counter[31:24];

  assign segments[7] = 1'b1;
  // assign anodes   = 4'b0111;

endmodule

module decoder_inv(
  input wire [1:0] in,
  output reg [3:0] out
);

  always @(*)
    case (in)
      2'b00: out <= 4'b0111;
      2'b01: out <= 4'b1011;
      2'b10: out <= 4'b1101;
      2'b11: out <= 4'b1110;
    endcase

endmodule

module test_device(
  input wire         PCLK,
  input wire         PRESETn,

  input wire         PSEL,
  input wire   [4:0] PADDR,
  input wire         PENABLE,
  input wire         PWRITE,
  input wire   [7:0] PWDATA,
  output wire  [7:0] PRDATA,
  output wire        PREADY,

  output wire  [7:0] OUTREG
);

  reg [7:0] value;
  wire writing = PSEL & PENABLE & PWRITE;

  always @(posedge PCLK)
    begin
      if (~PRESETn)
        value <= 8'h42;
      else if (writing)
        value <= PWDATA;
    end


  assign PRDATA = writing ? PWDATA : value;
  assign PREADY = 1'b1;
  assign OUTREG = value;

endmodule
