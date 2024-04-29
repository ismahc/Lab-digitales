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

    // Señales del testbench
    logic clk;                  // Señal de reloj
    logic [6:0] display1_segments;
    logic [6:0] display2_segments;

    // Instancia del módulo a probar
    nombre dut(
        .clk(clk),
        .display1_segments(display1_segments),
        .display2_segments(display2_segments)
    );

    // Generación de pulsos de reloj
    initial begin
        clk = 0; // Inicializar la señal de reloj en 0
        forever #5ns clk = ~clk; // Generar un pulso cada 10 ns (periódico)
    end

    // Estímulo de entrada para el testbench
    initial begin
        #0;   // Esperar un ciclo de reloj para estabilizar las señales

        // Establecer tus letras "ISMA" y "EL" en los displays
        display1_segments = 7'b100_1000; // Letra 'I'
        display2_segments = 7'b000_0110; // Letra 'L'
        #100; // Esperar 100ns para ver los resultados en los displays

        // Puedes probar diferentes combinaciones para mostrar otras letras o caracteres

        // Finalizar la simulación
        #10;
        $finish;
    end

    // Visualización de las letras en los displays
    always @(posedge clk) begin
        $display("Display 1: %b", display1_segments);
        $display("Display 2: %b", display2_segments);
    end

endmodule

