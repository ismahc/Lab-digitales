`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 17:04:29
// Design Name: 
// Module Name: test_sistem
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


module test_sistem();
       logic clk,reset;
       logic [3:0] DEC;
       logic [6:0] sevenSeg;
       
       
       sistema_multi DUT(.clk(clk),
                         .DEC(DEC),
                         .reset(reset),
                         .sevenSeg(sevenSeg));
       always #5 clk=~clk;

        initial begin 
            clk=0;
            reset=0;
            #4 reset = 1;
            #1.5 reset = 0;   
        end
endmodule
