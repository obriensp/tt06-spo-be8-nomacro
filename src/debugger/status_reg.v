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
        debug_request <= 1'b1;
      else if (PSEL & PENABLE & ~previous_enable & PWRITE)
        debug_request <= debug_request ^ PWDATA[0];
    end

  localparam COUNTER_MODE_RESET = 1'b0;
  localparam COUNTER_MODE_STEP  = 1'b1;

  reg counter_mode;
  reg [2:0] counter;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        begin
          counter      <= 3'b0;
          counter_mode <= COUNTER_MODE_RESET;
        end
      else if (PSEL & PENABLE & ~previous_enable & PWRITE & PWDATA[2])
        begin
          counter_mode <= COUNTER_MODE_RESET;
          counter      <= 3'b111;
        end
      else if (PSEL & PENABLE & ~previous_enable & PWRITE & PWDATA[4])
        begin
          counter_mode <= COUNTER_MODE_STEP;
          counter      <= 3'b111;
        end
      else if (counter != 3'b0)
        begin
          counter <= counter - 1;
        end
    end

  assign RESET_REQUEST =  counter != 3'b000 && counter_mode == COUNTER_MODE_RESET;
  wire allow_debug_req = !(counter != 3'b000 && counter_mode == COUNTER_MODE_STEP);

  reg previous_enable;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        previous_enable <= 1'b0;
      else
        previous_enable <= PENABLE;
    end

  assign DEBUG_REQUEST = debug_request & allow_debug_req;
  assign PRDATA = {4'h0, HALTED, RESET_REQUEST, DEBUG_ACK, DEBUG_REQUEST};
  assign PREADY = 1'b1;
endmodule
