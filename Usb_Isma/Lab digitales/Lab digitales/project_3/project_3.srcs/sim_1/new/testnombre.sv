`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2023 22:38:50
// Design Name: 
// Module Name: testnombre
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


module testnombre;
    logic [3:0] select;
    logic [6:0] segments;
    logic [6:0] anodes;
    int delay = 10;

    // Instanciar el módulo a probar
    texto dut (
        .select(select),
        .segments(segments),
        .anodes(anodes)
    );

     // Generación de pulsos de reloj
    initial begin
        // Mostrar la letra 'I' en el primer display (anodo 0)
        select = 4'b1000;
        #100; // Esperar un tiempo suficiente para ver el carácter

        // Mostrar la letra 'S' en el segundo display (anodo 1)
        select = 4'b1110;
        #100; // Esperar un tiempo suficiente para ver el carácter

        // Mostrar la letra 'M' en el primer display (anodo 0)
        select = 4'b1100;
        #100; // Esperar un tiempo suficiente para ver el carácter

        // Mostrar la letra 'A' en el segundo display (anodo 1)
        select = 4'b0000;
        #100; // Esperar un tiempo suficiente para ver el carácter

        // Mostrar la letra 'E' en el primer display (anodo 0)
        select = 4'b0101;
        #100; // Esperar un tiempo suficiente para ver el carácter

        // Mostrar la letra 'L' en el segundo display (anodo 1)
        select = 4'b1011;
        #100; // Esperar un tiempo suficiente para ver el carácter

        // Finalizar la simulación
        $finish;
    end

    // Visualización de las letras en el display
    always @(select) begin
        $display("Select: %b", select);
        $display("Segments: %b", segments);
        $display("Anodes: %b", anodes);
    end

endmodule
