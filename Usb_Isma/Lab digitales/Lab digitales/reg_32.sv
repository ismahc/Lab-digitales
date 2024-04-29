`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2023 23:46:28
// Design Name: 
// Module Name: reg_32
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


module reg_32(
input logic clock, reset, enable, shift_in,
    output logic out
    );
   logic [31:0] shifting;
   
   always_ff@(posedge clock)
        if (reset) begin
            out <= 0;
            end
        else if(enable) begin
            shifting <= {shifting[30:0],shift_in};
            out <= shifting[31];
        end
     
    
endmodule
