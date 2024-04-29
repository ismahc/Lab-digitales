`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 17:52:42
// Design Name: 
// Module Name: test_contador
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


module test_contador();

   logic clk, reset;
   logic [8:0] count,count1,count2;
   
   top_contador #(.WIDTH(4)) DUT(.clk(clk),
                    .reset(reset),
                    .count(count));
   top_contador #(.WIDTH(5)) DUT1(.clk(clk),
                    .reset(reset),
                    .count(count1));
   top_contador #(.WIDTH(8)) DUT2(.clk(clk),
                    .reset(reset),
                    .count(count2));
   always #5 clk = ~clk; 
   
   initial begin
            clk=0;
            reset=1;
            #10 reset=0;
   end                             
endmodule
