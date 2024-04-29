`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2023 00:05:36
// Design Name: 
// Module Name: test_registro_32
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


module test_registro_32();
 logic clock, reset, enable, shift_in;
    logic out;
    
    
    registro_32 DUT(.clock(clock),
                 .reset(reset),
                 .enable(enable),
                 .shift_in(shift_in),
                 .out(out));
 always #5 clock=~clock;
 always #7 shift_in = ~shift_in;
 
 initial begin
 clock=1;
 reset=1;
 enable = 1;
 shift_in = 0;
 
 #10 reset=0;
 #20 reset = 1;
 #15 reset =0 ; 
 
 
 end
         
endmodule
