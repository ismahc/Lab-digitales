`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 00:04:56
// Design Name: 
// Module Name: testbench_simple
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


module testbench_simple();
    logic A, B, C;
    logic X, Y, Z;
    
    logica_simple DUT(
       .A (A),
       .B (B),
       .C (C),
       .X (X),
       .Y (Y),
       .Z (Z)
      );
    
    initial begin 
       A = 1'b0;
       B = 1'b0;
       C = 1'b0;
       #4
       A = 1'b1;
       B = 1'b1;
       #10
       B = 1'b0;
       #2
       C = 1'b1;
    end  
endmodule
