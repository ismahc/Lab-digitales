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
            output logic [3:0] count, 
            output logic [7:0] sevenSeg,
            output logic fib

 );
 
    
    counter_4bit #(
        .WIDTH(8)
    )mod1(
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    
    BCD_to_sevenSeg #(
        .WIDTH(8)
    )mod2(
        .count(count),
        .seveSeg(sevenSeg)
    );
    
    fib_rec #(
        .WIDTH(8)
    )mod3(
        .count(count),
        .fib(fib)
    );
        
    
endmodule
