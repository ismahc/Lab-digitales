`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 22:58:11
// Design Name: 
// Module Name: sumador
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


module sumador #(parameter WIDTH = 4)  (    
    input logic [WIDTH -1 : 0] A,B,
    output logic [WIDTH -1 : 0] y
 );
 
    assing Y = A+B;
 
 
 
 
endmodule
