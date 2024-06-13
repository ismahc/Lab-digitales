`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2023 12:43:08
// Design Name: 
// Module Name: reg_param
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


module reg_param#(parameter N = 8)(
    input logic clk, reset, load,
    input logic [N-1:0] D,
    output logic [N-1:0]Q
    );
    
    always_ff@(posedge clk)
        if (reset)
            Q <= 'b0;
        else if (load)
            Q <= D; 
        else 
            Q <= Q;
endmodule
