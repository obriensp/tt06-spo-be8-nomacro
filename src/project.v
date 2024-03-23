/*
 * Copyright (c) 2024 Sean Patrick O'Brien
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_i2c_slave (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  i2c_slave i2cs(
    .clk(clk),
    .rst(~rst_n),

    .release_bus(1'b0),

    .s_axis_data_tdata(ui_in),
    .s_axis_data_tvalid(uio_in[0]),
    .s_axis_data_tready(uio_out[1]),
    .s_axis_data_tlast(uio_in[4]),

    .m_axis_data_tdata(uo_out),
    .m_axis_data_tvalid(uio_out[5]),
    .m_axis_data_tready(uio_in[6]),
    .m_axis_data_tlast(uio_out[7]),

    .scl_i(uio_in[2]),
    .scl_o(uio_out[2]),
    .scl_t(uio_oe[2]),

    .sda_i(uio_in[3]),
    .sda_o(uio_out[3]),
    .sda_t(uio_oe[3]),

    .busy(),
    .bus_address(),
    .bus_addressed(),
    .bus_active(),

    .enable(1'b1),
    .device_address(7'd42),
    .device_address_mask(7'h7F)
  );

  /*
  .s_axis_data_tvalid(uio_in[0]),
  .s_axis_data_tready(uio_out[1]),
  .s_axis_data_tlast(uio_in[4]),
  .m_axis_data_tvalid(uio_out[5]),
  .m_axis_data_tready(uio_in[6]),
  .m_axis_data_tlast(uio_out[7]),
  */

  assign uio_oe[0] = 1'b0;
  assign uio_oe[1] = 1'b1;
  assign uio_oe[4] = 1'b0;
  assign uio_oe[5] = 1'b1;
  assign uio_oe[6] = 1'b0;
  assign uio_oe[7] = 1'b1;

  assign uio_out[0] = 1'b0;
  assign uio_out[4] = 1'b0;
  assign uio_out[6] = 1'b0;

endmodule
