`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2023 17:07:00
// Design Name: 
// Module Name: test_register
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


module test_register();
    logic clock,reset,D,load;
    logic Q;
    
    
    registro DUT(.clk(clock),
                 .reset(reset),
                 .D(D),
                 .load(load),
                 .Q(Q));
 always #8 clock=~clock;
 always #5 D = ~D;
 
 initial begin
 clock=1;
 reset=1;
 load = 1;
 D = 0;
 
 #10 reset=0;
 #80 load = 0;
 
 
 end
                
                 
endmodule
