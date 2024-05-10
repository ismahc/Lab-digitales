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


module reg_desplazamiento(
     input logic clock, reset, enable, shift_in,
    output logic out
    );
   logic [31:0] shifting;
   logic [31:0] shift_reg;
   
   always_ff @(posedge clock)
    begin 
        shifting <= shift_reg;   
    end
   
   always_comb
    begin
     if (reset) begin
           shift_reg <= 32'd0;
            end
        else if(enable) begin
            shift_reg <= {shifting[30:0],shift_in};
        end else
            shift_reg <= shifting;
        
    end 
   
assign out = shifting[31];    
endmodule
