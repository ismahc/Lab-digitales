`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 15:33:11
// Design Name: 
// Module Name: test1
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


module test1();
    logic [3:0] BCD_in;
    logic [6:0] sevenSeg;
    
    BCD_to_sevenSeg DUT(
            .BCD_in(BCD_in),
            .sevenSeg(sevenSeg));
            
    initial begin
        BCD_in=4'd0;
        #2
        BCD_in=4'd1;
        #2
        BCD_in=4'd2;
        #2
        BCD_in=4'd3;
        #2
        BCD_in=4'd4;
        #2
        BCD_in=4'd5;
        #2
        BCD_in=4'd6;
        #2
        BCD_in=4'd7;
        #2
        BCD_in=4'd8;
        #2
        BCD_in=4'd9;
        #2
        BCD_in=4'd10;
        #2
        BCD_in=4'd11;
        #2
        BCD_in=4'd12;
        #2
        BCD_in=4'd13;
        #2
        BCD_in=4'd14;
        #2
        BCD_in=4'd15;
       
    end
        
endmodule
