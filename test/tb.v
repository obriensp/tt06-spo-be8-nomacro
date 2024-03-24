`default_nettype none `timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  // reg [7:0] ui_in;
  // reg [7:0] uio_in;
  // wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  reg WE;
  reg [3:0] ADDR;
  reg [7:0] DIN;
  reg [7:0] DOUT;

  /*
  RAM8 u_ram(
    .CLK(clk),
    .EN0(rst_n),
    .WE0(uio_in[3]),
    .A0(uio_in[2:0]),
    .Di0(ui_in),
    .Do0(uo_out)
  );
  */

  // Replace tt_um_example with your module name:
  tt_um_ram8_macro user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (DIN),    // Dedicated inputs
      .uo_out (DOUT),   // Dedicated outputs
      .uio_in ({3'b0, WE, ADDR}),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

endmodule
