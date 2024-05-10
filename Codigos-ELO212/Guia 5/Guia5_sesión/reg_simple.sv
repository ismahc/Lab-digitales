`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2024 19:15:58
// Design Name: 
// Module Name: reg_simple
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


module reg_simple(
    input logic D, clk, reset, load,
    output logic Q
    );
    
    always_ff@(posedge clk)
        if(reset)
            Q <= 'b0;
        else if(load)
            Q <= D;
        else 
            Q <= Q;
endmodule
