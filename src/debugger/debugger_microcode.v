`default_nettype none
`timescale 1ns/1ps

module debugger_microcode(
  input wire [4:0] ADDR,
  input wire       WRITE,
  input wire [1:0] STEP,
  output wire      PREADY,
  output wire      PADDR_OR_PWDATA,
  output wire      OUTREG_OR_BUS,
  output wire      D_AIn, D_BIn, D_OIn, D_IIn, D_Jn, D_FIn, D_MIn, D_RI,
  output wire      D_DOn, D_AOn, D_BOn, D_IOn, D_COn, D_EOn, D_ROn, D_NOn
);
  reg [18:0] signals;
  always @(*)
    begin
      case ({ADDR, WRITE, STEP})
        // Address: 0x0000 R
        8'b00000000: signals = 19'b1001111111011111111;
        // Address: 0x0000 W
        8'b00000100: signals = 19'b1001111111011111111;
        // Address: 0x0001 R
        8'b00001000: signals = 19'b1001111111010111111;
        // Address: 0x0001 W
        8'b00001100: signals = 19'b1000111111001111111;
        // Address: 0x0002 R
        8'b00010000: signals = 19'b1001111111011011111;
        // Address: 0x0002 W
        8'b00010100: signals = 19'b1001011111001111111;
        // Address: 0x0003 R
        8'b00011000: signals = 19'b1001111111011101111;
        // Address: 0x0003 W
        8'b00011100: signals = 19'b1001110111001111111;
        // Address: 0x0004 R
        8'b00100000: signals = 19'b1001111111011110111;
        // Address: 0x0004 W
        8'b00100100: signals = 19'b1001111011001111111;
        // Address: 0x0005 R
        8'b00101000: signals = 19'b1001111111011111111;
        // Address: 0x0005 W
        8'b00101100: signals = 19'b1001111111011111111;
        // Address: 0x0006 R
        8'b00110000: signals = 19'b1001111111011111110;
        // Address: 0x0006 W
        8'b00110100: signals = 19'b1001111111011111111;
        // Address: 0x0007 R
        8'b00111000: signals = 19'b1101111111011111111;
        // Address: 0x0007 W
        8'b00111100: signals = 19'b1001101111001111111;
        // Address: 0x0008 R
        8'b01000000: signals = 19'b0011111110001111111;
        8'b01000001: signals = 19'b1001111111011111101;
        // Address: 0x0008 W
        8'b01000100: signals = 19'b0011111110001111111;
        8'b01000101: signals = 19'b1001111111101111111;
        // Address: 0x0009 R
        8'b01001000: signals = 19'b0011111110001111111;
        8'b01001001: signals = 19'b1001111111011111101;
        // Address: 0x0009 W
        8'b01001100: signals = 19'b0011111110001111111;
        8'b01001101: signals = 19'b1001111111101111111;
        // Address: 0x000A R
        8'b01010000: signals = 19'b0011111110001111111;
        8'b01010001: signals = 19'b1001111111011111101;
        // Address: 0x000A W
        8'b01010100: signals = 19'b0011111110001111111;
        8'b01010101: signals = 19'b1001111111101111111;
        // Address: 0x000B R
        8'b01011000: signals = 19'b0011111110001111111;
        8'b01011001: signals = 19'b1001111111011111101;
        // Address: 0x000B W
        8'b01011100: signals = 19'b0011111110001111111;
        8'b01011101: signals = 19'b1001111111101111111;
        // Address: 0x000C R
        8'b01100000: signals = 19'b0011111110001111111;
        8'b01100001: signals = 19'b1001111111011111101;
        // Address: 0x000C W
        8'b01100100: signals = 19'b0011111110001111111;
        8'b01100101: signals = 19'b1001111111101111111;
        // Address: 0x000D R
        8'b01101000: signals = 19'b0011111110001111111;
        8'b01101001: signals = 19'b1001111111011111101;
        // Address: 0x000D W
        8'b01101100: signals = 19'b0011111110001111111;
        8'b01101101: signals = 19'b1001111111101111111;
        // Address: 0x000E R
        8'b01110000: signals = 19'b0011111110001111111;
        8'b01110001: signals = 19'b1001111111011111101;
        // Address: 0x000E W
        8'b01110100: signals = 19'b0011111110001111111;
        8'b01110101: signals = 19'b1001111111101111111;
        // Address: 0x000F R
        8'b01111000: signals = 19'b0011111110001111111;
        8'b01111001: signals = 19'b1001111111011111101;
        // Address: 0x000F W
        8'b01111100: signals = 19'b0011111110001111111;
        8'b01111101: signals = 19'b1001111111101111111;
        // Address: 0x0010 R
        8'b10000000: signals = 19'b0011111110001111111;
        8'b10000001: signals = 19'b1001111111011111101;
        // Address: 0x0010 W
        8'b10000100: signals = 19'b0011111110001111111;
        8'b10000101: signals = 19'b1001111111101111111;
        // Address: 0x0011 R
        8'b10001000: signals = 19'b0011111110001111111;
        8'b10001001: signals = 19'b1001111111011111101;
        // Address: 0x0011 W
        8'b10001100: signals = 19'b0011111110001111111;
        8'b10001101: signals = 19'b1001111111101111111;
        // Address: 0x0012 R
        8'b10010000: signals = 19'b0011111110001111111;
        8'b10010001: signals = 19'b1001111111011111101;
        // Address: 0x0012 W
        8'b10010100: signals = 19'b0011111110001111111;
        8'b10010101: signals = 19'b1001111111101111111;
        // Address: 0x0013 R
        8'b10011000: signals = 19'b0011111110001111111;
        8'b10011001: signals = 19'b1001111111011111101;
        // Address: 0x0013 W
        8'b10011100: signals = 19'b0011111110001111111;
        8'b10011101: signals = 19'b1001111111101111111;
        // Address: 0x0014 R
        8'b10100000: signals = 19'b0011111110001111111;
        8'b10100001: signals = 19'b1001111111011111101;
        // Address: 0x0014 W
        8'b10100100: signals = 19'b0011111110001111111;
        8'b10100101: signals = 19'b1001111111101111111;
        // Address: 0x0015 R
        8'b10101000: signals = 19'b0011111110001111111;
        8'b10101001: signals = 19'b1001111111011111101;
        // Address: 0x0015 W
        8'b10101100: signals = 19'b0011111110001111111;
        8'b10101101: signals = 19'b1001111111101111111;
        // Address: 0x0016 R
        8'b10110000: signals = 19'b0011111110001111111;
        8'b10110001: signals = 19'b1001111111011111101;
        // Address: 0x0016 W
        8'b10110100: signals = 19'b0011111110001111111;
        8'b10110101: signals = 19'b1001111111101111111;
        // Address: 0x0017 R
        8'b10111000: signals = 19'b0011111110001111111;
        8'b10111001: signals = 19'b1001111111011111101;
        // Address: 0x0017 W
        8'b10111100: signals = 19'b0011111110001111111;
        8'b10111101: signals = 19'b1001111111101111111;
        // Address: 0x0018 R
        8'b11000000: signals = 19'b0011111110001111111;
        8'b11000001: signals = 19'b1001111111011111101;
        // Address: 0x0018 W
        8'b11000100: signals = 19'b0011111110001111111;
        8'b11000101: signals = 19'b1001111111101111111;
        default:     signals = 19'b0001111111011111111;
      endcase
    end

  assign PREADY          = signals[18];
  assign OUTREG_OR_BUS   = signals[17];
  assign PADDR_OR_PWDATA = signals[16];
  assign D_AIn           = signals[15];
  assign D_BIn           = signals[14];
  assign D_OIn           = signals[13];
  assign D_IIn           = signals[12];
  assign D_Jn            = signals[11];
  assign D_FIn           = signals[10];
  assign D_MIn           = signals[9];
  assign D_RI            = signals[8];
  assign D_DOn           = signals[7];
  assign D_AOn           = signals[6];
  assign D_BOn           = signals[5];
  assign D_IOn           = signals[4];
  assign D_COn           = signals[3];
  assign D_EOn           = signals[2];
  assign D_ROn           = signals[1];
  assign D_NOn           = signals[0];
endmodule
