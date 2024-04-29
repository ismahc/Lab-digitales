`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 00:38:24
// Design Name: 
// Module Name: test_simple
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


module test_simple();

   logic [3:0] BCD_in;
   logic    fib;
   
   fib_rec DUT(
       .BCD_in (BCD_in),
       .fib (fib));
   
   initial begin
       BCD_in = 4'b0000;
       #3
       BCD_in = 4'b0001;
       #3
       BCD_in = 4'b0011;
       #3
       BCD_in = 4'b0111;
   end 
endmodule
