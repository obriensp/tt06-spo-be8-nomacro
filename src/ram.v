`default_nettype none
`timescale 1ns/1ns

module ram(
  input wire CLK,
  input wire RESETn,

  input wire [3:0] ADDR,
  input wire [7:0] DIN,
  output wire [7:0] DOUT,
  input wire RI
);

  reg [7:0] memory[15:0];

  always @(posedge CLK)
    begin
      if (~RESETn)
        begin
        end
      else if (RI)
        memory[ADDR] <= DIN;
    end

  assign DOUT = RI ? 8'b0 : memory[ADDR];

endmodule
