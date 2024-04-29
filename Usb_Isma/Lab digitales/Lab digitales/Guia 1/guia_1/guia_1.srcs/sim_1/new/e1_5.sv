`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 11:45:20
// Design Name: 
// Module Name: e1_5
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


module e1_5();
    
    logic A, B, C;
    logic X, Y, Z;
    
    e1_4 DUT(
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
        #3
        
        A = 1'b1;
        #6
        B = 1'b'1;
        #4
        C = 1'b1;
        
     end
endmodule
