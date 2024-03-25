`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 16:02:48
// Design Name: 
// Module Name: fibbi
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


module fibbi(
    input logic A, B, C, D,
    output logic F
    );
    
    assign F = (~A && ~C) || (~B && ~C) || (~B && ~D);
endmodule
