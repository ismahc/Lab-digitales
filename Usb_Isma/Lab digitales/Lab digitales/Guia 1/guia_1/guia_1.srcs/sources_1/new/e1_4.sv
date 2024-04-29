`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 11:19:18
// Design Name: 
// Module Name: e1_4
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


module e1_4(
    input logic A,B,C,
    output logic X,Y,Z
    );
    
    assign X = A;
    assign Y = ~A;
    assign Z = B & C; 
endmodule
