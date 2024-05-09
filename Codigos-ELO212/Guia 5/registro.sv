`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 23:08:41
// Design Name: 
// Module Name: registro
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


module registro(
    input logic D, clk, reset, load,
    output logic Q
    );
    
    always_ff@(posedge clk)
        if (reset)
            Q <= 'b0;

        else if (load)
            Q <= D; 
        else 
            Q <=  Q;
endmodule
