`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 17:41:18
// Design Name: 
// Module Name: test_mux
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


module test_mux();

    logic [3:0]A;
    logic [3:0]B;
    logic [3:0]C;
    logic [3:0]D;
    logic [3:0]sel;
    logic    out;

    mux DUT(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(sel),
        .out (out));
    initial begin 
        sel =4'b0000;
        #2
         
    end
    

endmodule
