`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2023 16:09:19
// Design Name: 
// Module Name: Contador_maestro
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


module Contador_maestro#(parameter N = 8)(
    input logic clock, reset,
    output logic [N-1:0] counter,
    output logic [N-1:0] counter_1,
    output logic [N-1:0] counter_2);
    
    counter1 #(.N(8)) count1(.clock(clock),
                             .reset(reset),
                             .counter(counter));
                             
    counter2 #(.N(8)) count2(.clock(clock),
                             .reset(reset),
                             .counter(counter_1));
                             
    counter3 #(.N(8)) count3(.clock(clock),
                             .reset(reset),
                             .counter(counter_2));                         
                             
                             
    
endmodule
