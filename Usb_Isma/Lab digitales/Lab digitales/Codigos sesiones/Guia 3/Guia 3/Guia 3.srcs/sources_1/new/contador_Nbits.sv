`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 16:11:40
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


module contador_Nbits #(parameter WIDTH=4)(
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
