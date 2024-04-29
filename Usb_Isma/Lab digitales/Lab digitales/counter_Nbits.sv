`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2023 13:05:20
// Design Name: 
// Module Name: counter_Nbits
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



module counter_Nbits(
        input logic clock, reset,
        output logic [2:0] counter
        );
        
        always_ff @(posedge clock) begin
       if (reset)
         counter <= 0;
       else 
         counter <= counter+1;
    end
endmodule
