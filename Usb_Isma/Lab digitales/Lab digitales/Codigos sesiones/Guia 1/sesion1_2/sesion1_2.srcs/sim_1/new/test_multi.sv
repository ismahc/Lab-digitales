`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 17:43:10
// Design Name: 
// Module Name: test_multi
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


module test_multi();
    logic [7:0]A;
    logic [7:0]B;
    logic [7:0]C;
    logic [7:0]D;
    logic [7:0]E;
    logic [3:0]sel;
    logic [7:0]out;
  
  multi DUT (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .sel(sel),
    .out(out)
    
    );
  initial begin
     A=4'd0;
     B=4'd0;
     C=4'd0;
     D=4'd0;
     E=4'd0;
     #3
     A=4'd1;   
  end  
endmodule
