`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 16:58:13
// Design Name: 
// Module Name: test_fib_rec
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


module test_fib_rec();

    logic [3:0] BCD_in;
    logic       fib;
    
    fib_rec DUT(
        .BCD_in (BCD_in),
        .fib (fib));
        
    initial begin
        BCD_in =4'b0000;
        #2
        BCD_in =4'b0001;
        #2
        BCD_in =4'b0010;
        #2
        BCD_in =4'b0011;
        #2
        BCD_in =4'b0100;
        #2
        BCD_in =4'b0101;
        #2
        BCD_in =4'b0110;
        #2
        BCD_in=4'b0111;
        #2
        BCD_in=4'b1000;
        #2
        BCD_in =4'b1001;
        #2
        BCD_in=4'b1010;
        #2
        BCD_in =4'b1011;
        #2
        BCD_in =4'b1100;
        #2
        BCD_in =4'b1101;
        #2
        BCD_in =4'b1110;
        #2
        BCD_in =4'b1111;    
    end
endmodule
