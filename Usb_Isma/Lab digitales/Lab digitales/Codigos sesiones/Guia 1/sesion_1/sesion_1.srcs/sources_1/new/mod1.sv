`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 21:26:00
// Design Name: 
// Module Name: mod1
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



module mod1(
    input logic A, B, C,
    output logic Y
    );
    // logica combinacional
    
    logic temp; 
    
    assign temp = A & B;
    assign Y = temp | C;
endmodule
