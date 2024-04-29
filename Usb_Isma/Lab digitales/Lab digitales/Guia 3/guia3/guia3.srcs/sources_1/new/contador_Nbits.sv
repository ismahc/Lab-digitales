`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 18:43:25
// Design Name: 
// Module Name: contador_Nbits
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


module contador_Nbits
    #(parameter WIDTH=2)(
    input logic  clk, reset,
    output logic [WIDTH-1:0] count
    )
    always_ff @(posedge clk) begin
       if (reset)
         count <= 0;
       else 
         count <= count+1;
    end
    case
endmodule