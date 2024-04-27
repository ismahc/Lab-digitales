`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 17:34:19
// Design Name: 
// Module Name: clock_divider_2
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


module clock_divider_2 #(parameter COUNTER_MAX = 4)
(
	input  logic clk_in,
	input  logic reset,
	output logic clk_out );


	localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
	logic [DELAY_WIDTH-1:0] counter = 'd0, counter_next;
	logic clk_out_next;
	 
	/*L?gica combinacional para el contador*/
	always_comb
	begin
		if (reset == 1'b1)
			counter_next = 'd0;// Reset sincronico, setea el contador
		else if (counter == (COUNTER_MAX - 1))
			counter_next = 'd0;// Se resetea el contador
		else
			counter_next = counter + 'd1; // Se incrementa el contador
	end
	 
	 /*L?gica Combinacional para la salida*/
	always_comb
	begin
		if (reset == 1'b1)
			clk_out_next = 'd0; // Reset sincronico, setea la salida a un valor conocido
		else if (counter == COUNTER_MAX-1)
			clk_out_next = ~clk_out;// Se invierte la salida
		else
			clk_out_next = clk_out;//se mantiene la salida con su valor anterior
	 end

	/*L?gica Secuencial*/
	always_ff@(posedge clk_in)
	begin
		counter <= counter_next;
		clk_out <= clk_out_next;
	end
endmodule
