`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 23:01:40
// Design Name: 
// Module Name: top_module
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


module top_module(
            input logic clk,reset,
            output logic [6:0] sevenSeg,
            output logic fib

 );
 
   logic [3:0]count;
   
    counter_4bit mod1(
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    BCD_to_sevenSeg mod2(
         .BCD_in(count),
         .sevenSeg(sevenSeg)
    );
    
    fib_rec mod3(.BCD_in(count),
                 .fib(fib)
    );
        
    
endmodule
