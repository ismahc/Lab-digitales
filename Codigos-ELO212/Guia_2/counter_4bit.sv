`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 15:55:10
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit (
    input logic  clk, reset,
    output logic [3:0] count
    );
    
    always_ff @(posedge clk) begin
       if (reset)
         count <= 4'b0;
       else 
         count <= count+1;
    end
endmodule
