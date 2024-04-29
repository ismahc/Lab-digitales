`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2023 18:44:25
// Design Name: 
// Module Name: Sesion2
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


module Sesion2(
    input logic BCD_in,
    output logic sevenSeg
    );
    
    always_comb begin
        case(BCD_in)
            4'd0: sevenSeg = 7'b1111110;
            4'd1: sevenSeg = 7'b0110000;
            4'd2: sevenSeg = 7'b1101101;
            4'd3: sevenSeg = 7'b1111001;
            4'd4: sevenSeg = 7'b0110111;
            4'd5: sevenSeg = 7'b1011011;
            4'd6: sevenSeg = 7'b1011111;
            4'd7: sevenSeg = 7'b1110001;
            4'd8: sevenSeg = 7'b1111111;
            4'd9: sevenSeg = 7'b1110011; 
        endcase    
    end
    
    
endmodule
