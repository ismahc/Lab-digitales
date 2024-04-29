`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 16:02:19
// Design Name: 
// Module Name: fibbinario
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


module fibbinario(
    input logic A,B,C,D,
    output logic fib
    );
    
    assign fib = ~A & ~B || ~B && ~C|| ~B && ~D;
endmodule    
