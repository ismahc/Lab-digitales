`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 22:37:41
// Design Name: 
// Module Name: test_1
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


module test_1(

    );
    logic A_test, B_test, C_test, Y_test;
    
    mod1 DUT(
        .A(A_test),
        .B(B_test),
        .C(C_test),
        .Y(Y_test)
    );
    
    initial begin
        A_test = 1'b0;
        B_test = 1'b0;
        C_test = 1'b0; 
        
        #5
        A_test = 1'b1;
        #5
        B_test = 1'b1;
        #5
        C_test = 1'b1;
        A_test = 1'b0;

    end
endmodule
