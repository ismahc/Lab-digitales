`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 17:21:26
// Design Name: 
// Module Name: clock_divider
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


module clock_divider
#(parameter COUNTER_MAX = 30)
(
	input  logic clk_in,
	input  logic reset,
	output logic clk_out );

/* localparam permite definir constantes internas al modulo mediante expresiones matematicas complejas. 
	El signo $ especifica una llamada al sistema (computador en que corre la herramienta) y estas 
	expresiones no son sintetizables, sino que se evaluan numericamente al momento de la sintesis 
	logica para obtener una constante. Es decir, al momento de la sintesis esta expresion se 
	convierte en una constante que se puede usar para algun parametro de diseno interno, como
	por ejemplo, el ancho de bits de un bus en base a un parametro del modulo. No es que se este 
	haciendo un circuito capaz de calcular un logaritmo (esto seria bastante complejo).
	Estos parametros son internos al modulo y no son visibles hacia el exterior.
*/
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
