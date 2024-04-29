`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 15:19:22
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

    logic A_test, B_test, C_test;
    logic X,Y,Z;

    logica_simple Instancia1 (
        .A(A_test),
        .B(B_test),
        .C(C_test),
        .X(X),
        .Y(Y),
        .Z(Z)
      );

    initial begin
        A_test = 1'b0;
        B_test = 1'b0;
        C_test = 1'b0;
       
        #3
        
        A_test = 1'b1;
        
        #20
        
        B_test = 1'b1;
        A_test = 1'b0;
        
        #20
       
        C_test = 1'b1;
        B_test = 1'b0;
        
     end   
        
  
endmodule
