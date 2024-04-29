`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2023 22:30:50
// Design Name: 
// Module Name: nombre
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


module nombre(

    output logic [6:0] display1_segments,
    output logic [6:0] display2_segments
);

    // Tabla de verdad para representar las letras en los displays de 7 segmentos
    //                abcdefg
    logic [6:0] I = 7'b100_1000;
    logic [6:0] S = 7'b010_0011;
    logic [6:0] M = 7'b000_1101;
    logic [6:0] A = 7'b000_1111;
    logic [6:0] E = 7'b000_0111;
    logic [6:0] L = 7'b000_0110;

    // Conexión de los segmentos para formar las letras "ISMAEL"
    always_comb begin
        display1_segments = {I,S,M,A}; // Display 1 muestra "ISMA"
        display2_segments = {E,L,A};   // Display 2 muestra "ELA"
    end

endmodule

