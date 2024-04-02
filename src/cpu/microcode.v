`default_nettype none
`timescale 1ns/1ns

module microcode(
  input wire [3:0] OPCODE,
  input wire [1:0] FLAGS,
  input wire [1:0] STEP,

  output wire HLT, CE, SU,
  output wire AIn, BIn, OIn, IIn, Jn, FIn, MIn, RI,
  output wire AOn, BOn, IOn, COn, EOn, ROn, NOn
);
  reg [17:0] signals;

  always @(*)
    begin
      case ({OPCODE, FLAGS, STEP})
        8'b00010000: signals = 18'b000111111001101111;
        8'b00010001: signals = 18'b000011111101111101;
        8'b00010100: signals = 18'b000111111001101111;
        8'b00010101: signals = 18'b000011111101111101;
        8'b00011000: signals = 18'b000111111001101111;
        8'b00011001: signals = 18'b000011111101111101;
        8'b00011100: signals = 18'b000111111001101111;
        8'b00011101: signals = 18'b000011111101111101;
        8'b00100000: signals = 18'b000111111001101111;
        8'b00100001: signals = 18'b000101111101111101;
        8'b00100010: signals = 18'b000011110101111011;
        8'b00100100: signals = 18'b000111111001101111;
        8'b00100101: signals = 18'b000101111101111101;
        8'b00100110: signals = 18'b000011110101111011;
        8'b00101000: signals = 18'b000111111001101111;
        8'b00101001: signals = 18'b000101111101111101;
        8'b00101010: signals = 18'b000011110101111011;
        8'b00101100: signals = 18'b000111111001101111;
        8'b00101101: signals = 18'b000101111101111101;
        8'b00101110: signals = 18'b000011110101111011;
        8'b00110000: signals = 18'b000111111001101111;
        8'b00110001: signals = 18'b000101111101111101;
        8'b00110010: signals = 18'b001011110101111011;
        8'b00110100: signals = 18'b000111111001101111;
        8'b00110101: signals = 18'b000101111101111101;
        8'b00110110: signals = 18'b001011110101111011;
        8'b00111000: signals = 18'b000111111001101111;
        8'b00111001: signals = 18'b000101111101111101;
        8'b00111010: signals = 18'b001011110101111011;
        8'b00111100: signals = 18'b000111111001101111;
        8'b00111101: signals = 18'b000101111101111101;
        8'b00111110: signals = 18'b001011110101111011;
        8'b01000000: signals = 18'b000111111001101111;
        8'b01000001: signals = 18'b000111111110111111;
        8'b01000100: signals = 18'b000111111001101111;
        8'b01000101: signals = 18'b000111111110111111;
        8'b01001000: signals = 18'b000111111001101111;
        8'b01001001: signals = 18'b000111111110111111;
        8'b01001100: signals = 18'b000111111001101111;
        8'b01001101: signals = 18'b000111111110111111;
        8'b01010000: signals = 18'b000011111101101111;
        8'b01010100: signals = 18'b000011111101101111;
        8'b01011000: signals = 18'b000011111101101111;
        8'b01011100: signals = 18'b000011111101101111;
        8'b01100000: signals = 18'b000111101101101111;
        8'b01100100: signals = 18'b000111101101101111;
        8'b01101000: signals = 18'b000111101101101111;
        8'b01101100: signals = 18'b000111101101101111;
        8'b01111000: signals = 18'b000111101101101111;
        8'b01111100: signals = 18'b000111101101101111;
        8'b10000100: signals = 18'b000111101101101111;
        8'b10001100: signals = 18'b000111101101101111;
        8'b11010000: signals = 18'b000011111101111110;
        8'b11010100: signals = 18'b000011111101111110;
        8'b11011000: signals = 18'b000011111101111110;
        8'b11011100: signals = 18'b000011111101111110;
        8'b11100000: signals = 18'b000110111100111111;
        8'b11100100: signals = 18'b000110111100111111;
        8'b11101000: signals = 18'b000110111100111111;
        8'b11101100: signals = 18'b000110111100111111;
        8'b11110000: signals = 18'b100111111101111111;
        8'b11110100: signals = 18'b100111111101111111;
        8'b11111000: signals = 18'b100111111101111111;
        8'b11111100: signals = 18'b100111111101111111;
        default:     signals = 18'b000111111101111111;
      endcase
    end

  assign HLT = signals[17];
  assign CE  = signals[16];
  assign SU  = signals[15];
  assign AIn = signals[14];
  assign BIn = signals[13];
  assign OIn = signals[12];
  assign IIn = signals[11];
  assign Jn  = signals[10];
  assign FIn = signals[9];
  assign MIn = signals[8];
  assign RI  = signals[7];
  assign AOn = signals[6];
  assign BOn = signals[5];
  assign IOn = signals[4];
  assign COn = signals[3];
  assign EOn = signals[2];
  assign ROn = signals[1];
  assign NOn = signals[0];

endmodule
