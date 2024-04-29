`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2022 14:12:48
// Design Name: 
// Module Name: Main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Main(
    input logic clkin, BTNC,
    input logic [7:0] SW,
    input logic uart_rx,
    output logic uart_tx,
	output logic [7:0] LEDS
    );
    
    logic button_pressed, rx_ready, tx_start, tx_busy;
    logic [7:0] tx_data, rx_data, data;
    
    assign tx_data = SW;
    assign LEDS=data;
    
    
    /* Debouncer */
	PB_Debouncer_FSM #(
		.DELAY(100000)
	) pb_deb0 (
		.clk(clkin),
		.rst(1'b0),
		.PB(BTNC),
		.PB_pressed_status(),
		.PB_pressed_pulse(button_pressed),
		.PB_released_pulse()
	);
    
    /* Módulo UART a 115200/8 bits datos/No paridad/1 bit stop */
	uart_basic #(
		.CLK_FREQUENCY(100000000),
		.BAUD_RATE(115200)
	)uart_basic_inst (
		.clk          (clkin),
		.reset        (1'b0),
		.rx           (uart_rx),
		.rx_data      (rx_data),
		.rx_ready     (rx_ready),
		.tx           (uart_tx),
		.tx_start     (tx_start),
		.tx_data      (tx_data),
		.tx_busy      (tx_busy)
	);
	
	always_comb begin
	   if (button_pressed && ~tx_busy)
	       tx_start=1'b1;
       else
           tx_start=1'b0;
	end
	
	always_ff @(posedge clkin) begin
	   if (rx_ready)
	       data<=rx_data;
	   else
	       data<=data;
	end
endmodule
