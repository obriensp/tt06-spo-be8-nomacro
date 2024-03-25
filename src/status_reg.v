`default_nettype none
`timescale 1ns/1ps

module status_reg(
  input wire         PCLK,
  input wire         PRESETn,

  input wire         PSEL,
  input wire   [4:0] PADDR,
  input wire         PENABLE,
  input wire         PWRITE,
  input wire   [7:0] PWDATA,
  output wire  [7:0] PRDATA,
  output wire        PREADY,

  output wire        DEBUG_REQUEST,
  input wire         DEBUG_ACK,

  output wire        RESET_REQUEST,
  input wire         HALTED
);
  reg debug_request;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        debug_request <= 1'b0;
      else if (PSEL & PENABLE & ~previous_enable & PWRITE)
        debug_request <= debug_request ^ PWDATA[0];
    end

  reg [1:0] reset_request;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        reset_request <= 2'b00;
      else if (PSEL & PENABLE & ~previous_enable & PWRITE & PWDATA[2])
        reset_request <= 2'b11;
      else if (RESET_REQUEST)
        reset_request <= reset_request - 1;
    end
  assign RESET_REQUEST = reset_request != 2'b00;

  reg previous_enable;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        previous_enable <= 1'b0;
      else
        previous_enable <= PENABLE;
    end

  assign DEBUG_REQUEST = debug_request;
  assign PRDATA = {4'h0, HALTED, RESET_REQUEST, DEBUG_ACK, DEBUG_REQUEST};
  assign PREADY = 1'b1;
endmodule
