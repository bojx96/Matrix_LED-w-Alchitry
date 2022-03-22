/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module max7219_2 (
    input clk,
    input rst,
    input [15:0] addr_in,
    input [15:0] din,
    input start,
    output reg cs,
    output reg dout,
    output reg sck,
    output reg busy
  );
  
  
  
  localparam IDLE_state = 2'd0;
  localparam TRANSFER_ADDR_state = 2'd1;
  localparam TRANSFER_DATA_state = 2'd2;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  reg [15:0] M_data_d, M_data_q = 1'h0;
  wire [1-1:0] M_spi_sdo;
  wire [1-1:0] M_spi_sck;
  wire [8-1:0] M_spi_data_out;
  wire [1-1:0] M_spi_new_data;
  wire [1-1:0] M_spi_busy;
  reg [1-1:0] M_spi_start;
  reg [8-1:0] M_spi_data_in;
  spi_controller_3 spi (
    .clk(clk),
    .rst(rst),
    .sdi(1'h0),
    .start(M_spi_start),
    .data_in(M_spi_data_in),
    .sdo(M_spi_sdo),
    .sck(M_spi_sck),
    .data_out(M_spi_data_out),
    .new_data(M_spi_new_data),
    .busy(M_spi_busy)
  );
  reg [15:0] M_addr_d, M_addr_q = 1'h0;
  reg M_load_state_d, M_load_state_q = 1'h0;
  
  reg [15:0] data_out;
  
  reg mosi;
  
  wire [8-1:0] M_count_value;
  reg [1-1:0] M_count_clk;
  reg [1-1:0] M_count_rst;
  counter_4 count (
    .clk(M_count_clk),
    .rst(M_count_rst),
    .value(M_count_value)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_data_d = M_data_q;
    M_load_state_d = M_load_state_q;
    M_addr_d = M_addr_q;
    
    sck = M_spi_sck;
    M_count_clk = M_spi_sck;
    M_count_rst = 1'h0;
    data_out = 16'hffff;
    M_spi_start = 1'h0;
    mosi = 1'h0;
    busy = M_state_q != IDLE_state;
    dout = 1'h0;
    
    case (M_state_q)
      IDLE_state: begin
        M_load_state_d = 1'h1;
        if (start) begin
          M_addr_d = addr_in;
          M_data_d = din;
          M_count_rst = 1'h1;
          M_load_state_d = 1'h0;
          M_state_d = TRANSFER_ADDR_state;
        end
      end
      TRANSFER_ADDR_state: begin
        M_spi_start = 1'h1;
        data_out = M_addr_q;
        dout = M_spi_sdo;
        if (M_count_value == 5'h10) begin
          M_state_d = TRANSFER_DATA_state;
        end
      end
      TRANSFER_DATA_state: begin
        M_spi_start = 1'h1;
        data_out = M_data_q;
        dout = M_spi_sdo;
        if (M_count_value == 6'h20) begin
          M_load_state_d = 1'h1;
          M_count_rst = 1'h1;
          M_state_d = IDLE_state;
        end
      end
    endcase
    cs = M_load_state_q;
    M_spi_data_in = data_out;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_data_q <= 1'h0;
      M_addr_q <= 1'h0;
      M_load_state_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_data_q <= M_data_d;
      M_addr_q <= M_addr_d;
      M_load_state_q <= M_load_state_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule