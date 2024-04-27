
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2024 18:22:18
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


module clock_divider_asincronico
#(parameter COUNTER_MAX = 10)
(
    input logic clk_in,
    input logic reset,
    output logic clk_out
);

    // Parámetros locales permiten definir constantes internas al modulo mediante expresiones matemáticas complejas.
    // El signo $ especifica una llamada al sistema (computador en que corre la herramienta) y estas expresiones no son sintetizables,
    // sino que se evalúan numéricamente al momento de la síntesis lógica para obtener una constante.
    // Es decir, al momento de la síntesis esta expresión se convierte en una constante que se puede usar para algún parámetro de diseño interno,
    // como por ejemplo, el ancho de bits de un bus en base a un parámetro del modulo.
    // No es que se esté haciendo un circuito capaz de calcular un logaritmo (esto sería bastante complejo).
    // Estos parámetros son internos al modulo y no son visibles hacia el exterior.
    
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter = 'd0;

    // Resetea el contador e invierte el valor del reloj de salida cada vez que el contador llega a su valor máximo.
    
    always_ff @(posedge clk_in , posedge reset) begin
        if (reset == 1'b1) begin
            // Reset sincrónico, se setea el contador y la salida a un valor conocido
            counter <= 'd0;
            clk_out <= 1'b0;
        end 
        
        else if (counter == COUNTER_MAX-1) begin
            // Se resetea el contador y se invierte la salida
            counter <= 'd0;
            clk_out <= ~clk_out; 
        end 
        
        else begin
            // Se incrementa el contador y se mantiene la salida con su valor anterior
            counter <= counter + 'd1;
            clk_out <= clk_out;
        end
    end

endmodule