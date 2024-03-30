/// sta-blackbox

`default_nettype none
`timescale 1ns/1ns

module i2c_to_apb(
  input wire        CLK,
  input wire        RESETn,

  input  wire       scl_i,
  output wire       scl_o,
  output wire       scl_t,
  input  wire       sda_i,
  output wire       sda_o,
  output wire       sda_t,

  input wire  [6:0] device_address,
  input wire  [6:0] device_address_mask,

  output wire       PSEL,
  output wire [4:0] PADDR,
  output wire       PENABLE,
  output wire       PWRITE,
  output wire [7:0] PWDATA,
  input wire  [7:0] PRDATA,
  input wire        PREADY
);

  reg [4:0] address;
  always @(posedge CLK)
    begin
      if (~RESETn)
        address <= 5'b0;
      else if (state == STATE_IDLE & data_in_valid)
        address <= data_in[4:0];
      else if (PREADY & (state == STATE_WRITE_ACCESS | state == STATE_READ_ACCESS))
        address <= address + 1;
    end

  wire [7:0] data_out;
  reg  data_out_valid;
  wire data_out_ready;
  wire [7:0] data_in;
  wire data_in_valid;
  reg  data_in_ready;
  wire data_in_last;
  wire i2c_busy;
  i2c_slave i2cs(
      .clk(CLK),
      .rst(~RESETn),

      .release_bus(1'b0),

      .s_axis_data_tdata(data_out),
      .s_axis_data_tvalid(data_out_valid),
      .s_axis_data_tready(data_out_ready),
      .s_axis_data_tlast(1'b0),

      .m_axis_data_tdata(data_in),
      .m_axis_data_tvalid(data_in_valid),
      .m_axis_data_tready(data_in_ready),
      .m_axis_data_tlast(data_in_last),

      .scl_i(scl_i),
      .scl_o(scl_o),
      .scl_t(scl_t),
      .sda_i(sda_i),
      .sda_o(sda_o),
      .sda_t(sda_t),

      .busy(i2c_busy),
      .bus_address(),
      .bus_addressed(),
      .bus_active(),

      .enable(1'b1),
      .device_address(device_address),
      .device_address_mask(device_address_mask)
  );

  localparam [2:0]
    STATE_IDLE          = 3'd0,
    STATE_ADDRESSED     = 3'd1,
    STATE_WRITE_SETUP   = 3'd2,
    STATE_WRITE_ACCESS  = 3'd3,
    STATE_READ_SETUP    = 3'd4,
    STATE_READ_ACCESS   = 3'd5;
  reg [2:0] state;
  reg [2:0] state_next;

  always @(*)
    begin
      state_next     = STATE_IDLE;
      data_in_ready  = 1'b0;
      data_out_valid = 1'b0;

      case (state)
        STATE_IDLE:
          begin
            if (data_in_valid)
              state_next = STATE_ADDRESSED;
            else if (data_out_ready)
              state_next = STATE_READ_SETUP;
            data_in_ready = 1'b1;
          end
        STATE_ADDRESSED:
          begin
            if (data_in_valid)
              state_next = STATE_WRITE_SETUP;
            else if (data_out_ready)
              state_next = STATE_READ_SETUP;
            else if (i2c_busy)
              state_next = STATE_ADDRESSED;
          end
        STATE_WRITE_SETUP:
          begin
            state_next = STATE_WRITE_ACCESS;
          end
        STATE_WRITE_ACCESS:
          begin
            if (~PREADY)
              state_next = STATE_WRITE_ACCESS;
            else if (i2c_busy)
              state_next = STATE_ADDRESSED;
            // else if (data_in_valid & ~data_in_last)
              // state_next = STATE_WRITE_SETUP;

            data_in_ready = PREADY;
          end
        STATE_READ_SETUP:
          begin
            state_next = STATE_READ_ACCESS;
          end
        STATE_READ_ACCESS:
          begin
            if (~PREADY)
              state_next = STATE_READ_ACCESS;

            data_out_valid = PREADY;
          end
      endcase
    end

  always @(posedge CLK)
    begin
      if (~RESETn)
        state <= STATE_IDLE;
      else
        state <= state_next;
    end

  assign PSEL    = state == STATE_WRITE_SETUP |
                   state == STATE_WRITE_ACCESS |
                   state == STATE_READ_SETUP |
                   state == STATE_READ_ACCESS;
  assign PADDR   = address;
  assign PENABLE = state == STATE_WRITE_ACCESS |
                   state == STATE_READ_ACCESS;
  assign PWRITE  = state == STATE_WRITE_SETUP |
                   state == STATE_WRITE_ACCESS;
  assign PWDATA  = data_in;
  // assign PRDATA  = data_out;
  assign data_out = PRDATA;
endmodule
