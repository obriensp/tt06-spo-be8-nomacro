`default_nettype none
`timescale 1ns/1ps

module streams4_to_apb(
  input wire         CLK,
  input wire         RESETn,

  input wire   [7:0] in_data,
  input wire         in_valid,
  output wire        in_ready,

  output wire  [7:0] out_data,
  output wire        out_valid,
  input wire         out_ready,

  input wire   [4:0] base_address,
  input wire         latch_address,

  output wire        PSEL,
  output wire  [4:0] PADDR,
  output wire        PENABLE,
  output wire        PWRITE,
  output wire  [7:0] PWDATA,
  input wire   [7:0] PRDATA,
  input wire         PREADY
);

  reg [4:0] current_address;
  always @(posedge CLK)
    begin
      if (~RESETn)
        current_address <= 5'b0;
      else if (latch_address & bus_is_idle)
        current_address <= base_address;
      else if (bus_is_completing)
        // Increment the current address at the end of the read/write.
        current_address <= current_address + 1;
    end

  assign in_ready = bus_is_idle;
  reg [7:0] in_data_reg;
  always @(posedge CLK)
    begin
      if (~RESETn)
        in_data_reg  <= 8'b0;
      else if (in_valid & in_ready)
        in_data_reg <= in_data;
    end

  reg [7:0] out_data_reg;
  reg out_valid_reg;
  assign out_data = out_data_reg;
  assign out_valid = out_valid_reg;
  always @(posedge CLK)
    begin
      if (~RESETn)
        begin
          out_data_reg  <= 8'b0;
          out_valid_reg <= 1'b0;
        end
      else if (~bus_write & bus_is_completing)
        begin
          // Read from APB completed
          out_data_reg  <= PRDATA;
          out_valid_reg <= 1'b1;
        end
      else if (out_valid_reg & out_ready)
        begin
          // Output data was consumed
          out_data_reg  <= 8'b0;
          out_valid_reg <= 1'b0;
        end
    end

  // State machine for managing the bus
  wire should_start_write = in_valid;
  wire should_start_read  = out_ready & ~out_valid;
  wire bus_should_start   = bus_is_idle & (should_start_read | should_start_write);

  localparam [1:0]
    BUS_STATE_IDLE     = 2'b00,
    BUS_STATE_PREAMBLE = 2'b01,
    BUS_STATE_HOLD     = 2'b10;
  reg [1:0] bus_state;
  reg bus_write;
  wire bus_write_next = bus_should_start ? should_start_write : bus_write;
  always @(posedge CLK)
    begin
      if (~RESETn)
        begin
          bus_state <= BUS_STATE_IDLE;
          bus_write <= 1'b0;
        end
      else
        begin
          bus_write <= bus_write_next;

          casez ({bus_state, PREADY, bus_should_start})
          {BUS_STATE_IDLE,     1'b?, 1'b0}: bus_state <= BUS_STATE_IDLE;
          {BUS_STATE_IDLE,     1'b?, 1'b1}: bus_state <= BUS_STATE_PREAMBLE;
          {BUS_STATE_PREAMBLE, 1'b?, 1'b?}: bus_state <= BUS_STATE_HOLD;
          {BUS_STATE_HOLD,     1'b0, 1'b?}: bus_state <= BUS_STATE_HOLD;
          {BUS_STATE_HOLD,     1'b1, 1'b?}: bus_state <= BUS_STATE_IDLE;
          default:                          bus_state <= BUS_STATE_IDLE;
          endcase
        end
    end

  wire bus_is_idle       = bus_state == BUS_STATE_IDLE;
  wire bus_is_completing = bus_state == BUS_STATE_HOLD & PREADY;

  assign PSEL    = ~bus_is_idle;
  assign PADDR   = current_address;
  assign PENABLE = bus_state[1];
  assign PWRITE  = bus_is_idle ? 1'b0 : bus_write;
  assign PWDATA  = in_data_reg;
endmodule
