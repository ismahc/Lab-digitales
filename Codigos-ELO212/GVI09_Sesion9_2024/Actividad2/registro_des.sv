`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 23:52:16
// Design Name: 
// Module Name: registro_des
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


module registro_des(
    input logic clock, reset, enable, shift_in,
    output logic out
    );
   logic [31:0] shift;
   
   always_ff@(posedge clock)
        if (reset) begin
            out <= 0;
            end
        else if(enable) begin
            shift <= {shift[30:0],shift_in};
            out <= shift[31];
            end
        else 
            out <= out;
        
endmodule
