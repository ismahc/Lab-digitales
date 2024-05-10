`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2023 15:39:11
// Design Name: 
// Module Name: test_counter1
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


module test_counters();
    logic clock, reset;
    logic  [7:0] count;
    logic  [7:0] count_1;
    logic  [7:0] count_2;

   top_counter #(.N(8)) DUT(.clock(clock), 
                          .reset(reset), 
                          .counter(count),
                          .counter_1(count_1),
                          .counter_2(count_2));
    
    always #5 clock = ~clock;
    
    initial begin 
    clock = 1;
    reset = 1;
    
    #5 reset = 0; 
    #10 reset = 1;
    #30 reset = 0;
    
    
    end
endmodule