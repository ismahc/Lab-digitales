`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 16:56:23
// Design Name: 
// Module Name: test_simulador
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


module test_simulador();
  logic clk, reset;
  logic [3:0] count;
  logic [6:0] sevenSeg;
  logic fib;
  
  top_module DUT(.clk(clk),
                 .reset(reset),
                 .count(count),
                 .sevenSeg(sevenSeg),
                 .fib(fib));
  always #5 clk=~clk;
  
  initial begin 
        clk=0;
        reset=1;
        #10 reset=0;
  end            
endmodule
