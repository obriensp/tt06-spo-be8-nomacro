`default_nettype none
`timescale 1ns/1ps

module debugger_apb(
`ifdef USE_POWER_PINS
  input wire         VPWR,
  input wire         VGND,
`endif
  input wire         PCLK,
  input wire         PRESETn,

  input wire         PSEL,
  input wire   [4:0] PADDR,
  input wire         PENABLE,
  input wire         PWRITE,
  input wire   [7:0] PWDATA,
  output wire  [7:0] PRDATA,
  output wire        PREADY,

  input wire   [7:0] INREG,
  output wire  [7:0] OUTREG,
  output wire        HALTED
);

  // wire [1:0] selected_device;
  // address_decoder decode(
  //   .PADDR(PADDR),
  //   .SEL(selected_device)
  // );
  wire selected_device = PADDR != 5'b0;

  // wire [7:0] id_rdata;
  // wire id_ready;
  // hardware_id id(
  //   .PCLK(PCLK),
  //   .PRESETn(PRESETn),
  //   .PSEL(selected_device == 2'b10),
  //   .PADDR(PADDR),
  //   .PENABLE(PENABLE),
  //   .PWRITE(PWRITE),
  //   .PWDATA(PWDATA),
  //   .PRDATA(id_rdata),
  //   .PREADY(id_ready)
  // );

  wire reset_request;
  wire [7:0] status_rdata;
  wire status_ready;
  status_reg status(
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PSEL(selected_device == 2'b00),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(status_rdata),
    .PREADY(status_ready),
    .DEBUG_REQUEST(DEBUG_REQUEST),
    .DEBUG_ACK(DEBUG_ACK),
    .RESET_REQUEST(reset_request),
    .HALTED(HALTED)
  );

  wire [7:0] cpu_rdata;
  wire       cpu_ready;
  cpu_access cpu(
    .PCLK(PCLK),
    .PRESETn(PRESETn),
    .PSEL(selected_device == 2'b01),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .PRDATA(cpu_rdata),
    .PREADY(cpu_ready),
    .DEBUG_DATA(DEBUG_DATA),
    .D_CLR(D_CLR),
    .D_HLT(D_HLT),
    .D_CE(D_CE),
    .D_SU(D_SU),
    .D_AIn(D_AIn),
    .D_BIn(D_BIn),
    .D_OIn(D_OIn),
    .D_IIn(D_IIn),
    .D_Jn(D_Jn),
    .D_FIn(D_FIn),
    .D_MIn(D_MIn),
    .D_RI(D_RI),
    .D_DOn(D_DOn),
    .D_AOn(D_AOn),
    .D_BOn(D_BOn),
    .D_IOn(D_IOn),
    .D_COn(D_COn),
    .D_EOn(D_EOn),
    .D_ROn(D_ROn),
    .D_NOn(D_NOn),
    .BUS(BUS),
    .OUTREG(OUTREG)
  );

  apb_mux mux(
    .SEL(selected_device),
    .PRDATA(PRDATA),
    .PREADY(PREADY),

    .PRDATA0(status_rdata),
    .PREADY0(status_ready),

    .PRDATA1(cpu_rdata),
    .PREADY1(cpu_ready)

//     .PRDATA2(id_rdata),
//     .PREADY2(id_ready),
//
//     .PRDATA3(8'b0),
//     .PREADY3(1'b1)
  );

  // Register the reset request signal to hopefully prevent glitches on the core's reset line
  reg reset_request_bufn;
  always @(posedge PCLK)
    begin
      if (~PRESETn)
        reset_request_bufn <= 1'b1;
      else if (~reset_request)
        reset_request_bufn <= 1'b1;
      else
        reset_request_bufn <= 1'b0;
    end

  wire       DEBUG_REQUEST;
  wire       DEBUG_ACK;
  wire [7:0] DEBUG_DATA;
  wire       D_CLR, D_HLT, D_CE, D_SU;
  wire       D_AIn, D_BIn, D_OIn, D_IIn, D_Jn, D_FIn, D_MIn, D_RI;
  wire       D_DOn, D_AOn, D_BOn, D_IOn, D_COn, D_EOn, D_ROn, D_NOn;
  wire [7:0] BUS;
  core core(
`ifdef USE_POWER_PINS
    .VPWR(VPWR),
    .VGND(VGND),
`endif
    .CLK(PCLK),
    .RESETn(PRESETn & reset_request_bufn),
    .DEBUG_REQUEST(DEBUG_REQUEST),
    .DEBUG_ACK(DEBUG_ACK),
    .DEBUG_DATA(DEBUG_DATA),
    .D_CLR(D_CLR),
    .D_HLT(D_HLT),
    .D_CE(D_CE),
    .D_SU(D_SU),
    .D_AIn(D_AIn),
    .D_BIn(D_BIn),
    .D_OIn(D_OIn),
    .D_IIn(D_IIn),
    .D_Jn(D_Jn),
    .D_FIn(D_FIn),
    .D_MIn(D_MIn),
    .D_RI(D_RI),
    .D_DOn(D_DOn),
    .D_AOn(D_AOn),
    .D_BOn(D_BOn),
    .D_IOn(D_IOn),
    .D_COn(D_COn),
    .D_EOn(D_EOn),
    .D_ROn(D_ROn),
    .D_NOn(D_NOn),
    .BUS(BUS),
    .INREG(INREG),
    .OUTREG(OUTREG),
    .HALTED(HALTED)
  );

endmodule


module address_decoder(
  input wire [4:0] PADDR,
  output reg [1:0] SEL
);

  always @(*)
    begin
      if (PADDR == 8'b0)
        SEL <= 2'b00;
      else if (PADDR[4:3] == 5'b11)
        SEL <= 2'b10;
      else
        SEL <= 2'b01;
    end

endmodule


module apb_mux(
  input wire        SEL,

  output reg  [7:0] PRDATA,
  output reg        PREADY,

  input wire  [7:0] PRDATA0,
  input wire        PREADY0,

  input wire  [7:0] PRDATA1,
  input wire        PREADY1

//   input wire  [7:0] PRDATA2,
//   input wire        PREADY2,
//
//   input wire  [7:0] PRDATA3,
//   input wire        PREADY3
);

  always @(*)
    begin
      if (SEL == 1'b0)
        begin
          PRDATA <= PRDATA0;
          PREADY <= PREADY0;
        end
      else //if (SEL == 2'b01)
        begin
          PRDATA <= PRDATA1;
          PREADY <= PREADY1;
        end
      // else if (SEL == 2'b10)
      //   begin
      //     PRDATA <= PRDATA2;
      //     PREADY <= PREADY2;
      //   end
      // else // if (SEL == 2'b11)
      //   begin
      //     PRDATA <= PRDATA3;
      //     PREADY <= PREADY3;
      //   end
    end

endmodule


module hardware_id(
  input wire         PCLK,
  input wire         PRESETn,

  input wire         PSEL,
  input wire   [4:0] PADDR,
  input wire         PENABLE,
  input wire         PWRITE,
  input wire   [7:0] PWDATA,
  output wire  [7:0] PRDATA,
  output wire        PREADY
);
  reg [7:0] data;
  assign PRDATA = data;
  assign PREADY = 1'b1;

  always @(*)
    begin
      case (PADDR[2:0])
      3'd0: data <= 8'h42;
      3'd1: data <= 8'h45;
      3'd2: data <= 8'h2D;
      3'd3: data <= 8'h38;
      3'd4: data <= 8'h00;
      3'd5: data <= 8'h00;
      3'd6: data <= 8'h00;
      3'd7: data <= 8'h01;
      endcase
    end
endmodule
