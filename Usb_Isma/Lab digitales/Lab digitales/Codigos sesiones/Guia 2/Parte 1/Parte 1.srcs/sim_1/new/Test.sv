`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 15:20:41
// Design Name: 
// Module Name: Test
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


module Test();
    logic [3:0] BCD_in;
    logic [6:0] senSeg;
    
    BCD_to_sevenSeg DUT (
            .BCD_in(BCD_in),
            .sevenSeg(sevenSeg));
    
    initial begin;
    
    BCD_in = 4
             
endmodule
