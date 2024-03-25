`default_nettype none
`timescale 1ns/1ps

/*
  known issues:
  - clock stretching for reads has a limit
*/
module i2c_to_apb(
  input wire CLK,
  input wire RESETn,

  input  wire        scl_i,
  output wire        scl_o,
  output wire        scl_t,
  input  wire        sda_i,
  output wire        sda_o,
  output wire        sda_t,

  input wire   [6:0] device_address,
  input wire   [6:0] device_address_mask,

  output wire        PSEL,
  output wire  [4:0] PADDR,
  output wire        PENABLE,
  output wire        PWRITE,
  output wire  [7:0] PWDATA,
  input wire   [7:0] PRDATA,
  input wire         PREADY
);

  wire [7:0] in_data;
  wire       in_valid;
  wire       in_ready;
  wire       in_last;

  wire [7:0] out_data;
  wire       out_valid;
  wire       out_ready;
  wire       out_last;

  wire busy;

  i2c_slave i2cs(
    .clk(CLK),
    .rst(~RESETn),

    .release_bus(1'b0),

    .s_axis_data_tdata(out_data),
    .s_axis_data_tvalid(out_valid),
    .s_axis_data_tready(out_ready),
    .s_axis_data_tlast(out_last),

    .m_axis_data_tdata(in_data),
    .m_axis_data_tvalid(in_valid),
    .m_axis_data_tready(in_ready),
    .m_axis_data_tlast(in_last),

    .scl_i(scl_i),
    .scl_o(scl_o),
    .scl_t(scl_t),
    .sda_i(sda_i),
    .sda_o(sda_o),
    .sda_t(sda_t),

    .busy(busy),
    .bus_address(),
    .bus_addressed(),
    .bus_active(),

    .enable(1'b1),
    .device_address(device_address),
    .device_address_mask(device_address_mask)
  );

  wire [7:0] bus_wdata;
  wire bus_sel, bus_enable, bus_write;

  streams1_to_apb adapter(
    .CLK(CLK),
    .RESETn(RESETn),

    .in_data(in_data),
    .in_valid(in_valid),
    .in_ready(in_ready),
    .in_last(in_last),

    .out_data(out_data),
    .out_valid(out_valid),
    .out_ready(out_ready),
    .out_last(out_last),

    .busy(busy),

    .PSEL(PSEL),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY)
  );
endmodule
