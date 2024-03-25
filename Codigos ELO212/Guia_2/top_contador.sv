`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 17:42:55
// Design Name: 
// Module Name: top_contador
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


module top_contador #(parameter WIDTH=4)(
    input logic  clk, reset,
    output logic [WIDTH-1:0] count
    );
   
    always_ff @(posedge clk) begin
       if (reset)
         count <= 0;
       else 
         count <= count+1;
    end
endmodule
