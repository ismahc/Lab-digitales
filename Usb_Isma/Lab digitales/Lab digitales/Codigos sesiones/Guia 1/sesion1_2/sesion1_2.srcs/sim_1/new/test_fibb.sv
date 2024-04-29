`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 16:58:33
// Design Name: 
// Module Name: test_fibb
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


module test_fibb();

   logic [3:0] BCD_in;
   logic    fib;
   
   fibbi_rec DUT(
       .BCD_in (BCD_in),
       .fib (fib));
   
   initial begin
       BCD_in = 4'b0000;
       #3
       BCD_in = 4'b0001;
       #3
       BCD_in = 4'b0010;
       #3
       BCD_in = 4'b0011;
       #3
       BCD_in = 4'b0100;
       #3
       BCD_in = 4'b0101;
       #3
       BCD_in = 4'b0110;
       #3
       BCD_in = 4'b0111;
       #3
       BCD_in = 4'b0000;
       #3
       BCD_in = 4'b0001;
       #3
       BCD_in = 4'b0011;
       #3
       BCD_in = 4'b0111;
   end 

endmodule
