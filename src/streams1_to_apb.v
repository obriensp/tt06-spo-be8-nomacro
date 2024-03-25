`default_nettype none
`timescale 1ns/1ps

module streams1_to_apb(
  input wire         CLK,
  input wire         RESETn,

  input wire   [7:0] in_data,
  input wire         in_valid,
  output wire        in_ready,
  input wire         in_last,

  output wire  [7:0] out_data,
  output wire        out_valid,
  input wire         out_ready,
  output wire        out_last,

  input wire         busy,

  output wire        PSEL,
  output wire  [4:0] PADDR,
  output wire        PENABLE,
  output wire        PWRITE,
  output wire  [7:0] PWDATA,
  input wire   [7:0] PRDATA,
  input wire         PREADY
);

  // The first byte written during a transaction is the start address.
  // Consume the byte before passing subsequent data to the bus.
  reg [4:0] address;
  reg got_first_byte;
  reg previous_got_first_byte;
  always @(posedge CLK)
  begin
    if (~RESETn)
      begin
        address                 <= 5'b0;
        got_first_byte          <= 1'b0;
        previous_got_first_byte <= 1'b0;
      end
    else
      begin
        previous_got_first_byte <= got_first_byte;
        if (~busy)
          begin
            got_first_byte <= 1'b0;
          end
        else if (in_valid & ~got_first_byte)
          begin
            address         <= in_data[4:0];
            got_first_byte  <= 1'b1;
          end
      end
  end

  reg previous_busy;
  always @(posedge CLK)
    begin
      if (~RESETn)
        previous_busy <= 1'b0;
      else
        previous_busy <= busy;
    end

  // Connect byte streams and address to the bus
  wire apb_in_ready;
  streams4_to_apb apb(
    .CLK(CLK),
    .RESETn(RESETn),

    .in_data(in_data),
    .in_valid(in_valid & got_first_byte),
    .in_ready(apb_in_ready),

    .out_data(out_data),
    .out_valid(out_valid),
    .out_ready(out_ready),

    .base_address(address),
    .latch_address(got_first_byte & ~previous_got_first_byte | busy & ~previous_busy),

    .PSEL(PSEL),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY)
  );

  assign in_ready = apb_in_ready | ~got_first_byte;
  assign out_last = 1'b0;

endmodule
