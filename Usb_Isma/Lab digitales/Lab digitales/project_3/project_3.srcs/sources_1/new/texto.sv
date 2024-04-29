`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2023 00:22:35
// Design Name: 
// Module Name: texto
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


module texto(
    input logic [3:0] select,
    output logic [6:0] segments,
    output logic [6:0] anodes
);

    logic [6:0] segment_patterns [15:0]; // Patrones de segmentos para el abecedario

    // Definir los patrones de segmentos para cada letra
    initial begin
        segment_patterns[4'b0000] = 7'b1000000; // 'A'
        segment_patterns[4'b0001] = 7'b1111001; // 'B'
        segment_patterns[4'b0010] = 7'b0100111; // 'C'
        segment_patterns[4'b0011] = 7'b0010010; // 'D'
        segment_patterns[4'b0100] = 7'b0110000; // 'E'
        segment_patterns[4'b0101] = 7'b0111000; // 'F'
        segment_patterns[4'b0110] = 7'b0011111; // 'G'
        segment_patterns[4'b0111] = 7'b1001001; // 'H'
        segment_patterns[4'b1000] = 7'b0000001; // 'I'
        segment_patterns[4'b1001] = 7'b0001110; // 'J'
        segment_patterns[4'b1010] = 7'b0110001; // 'K'
        segment_patterns[4'b1011] = 7'b0000111; // 'L'
        segment_patterns[4'b1100] = 7'b1100010; // 'M'
        segment_patterns[4'b1101] = 7'b1110010; // 'N'
        segment_patterns[4'b1110] = 7'b1110111; // 'O'
        segment_patterns[4'b1111] = 7'b0111001; // 'P'
    end

    // Asignar el patrón de segmentos y habilitar los ánodos según la selección
    always_comb begin
        segments = segment_patterns[select];
        anodes = ~{1'b0, select}; // Habilitar el ánodo correspondiente al dígito seleccionado
    end

endmodule
