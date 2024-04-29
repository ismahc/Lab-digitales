`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 15:59:11
// Design Name: 
// Module Name: test_counter
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


module test_counter();
   logic clk, reset;
   logic [3:0] count;
   
   counter_4bit DUT(.clk(clk),
                    .reset(reset),
                    .count(count));
   always #5 clk = ~clk; 
   
   initial begin
            clk=0;
            reset=1;
            #10 reset=0;
            #100 reset =1;
            #10 reset = 0;
            
   end                             
endmodule
