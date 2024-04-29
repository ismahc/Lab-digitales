`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2023 16:35:55
// Design Name: 
// Module Name: test2
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


module test2();
    logic clock, reset;
    logic  [7:0] counter;



    counter2 #(.N(8)) DUT(.clock(clock), 
                          .reset(reset), 
                          .counter(counter));
                     
    
    always #5 clock = ~clock;
    
    initial begin 
    clock = 1;
    reset = 1;
    
    #10 reset = 0; 
    #20 reset = 1;
    #30 reset = 0;
    end
endmodule
