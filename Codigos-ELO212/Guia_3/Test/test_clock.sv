`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 17:46:35
// Design Name: 
// Module Name: test_clock
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


module test_clock();
    logic clk_in, reset;
    logic clk_out;
    
clock_divider_2 DUT(.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out));
    always #1 clk_in= ~clk_in;
    initial begin 
            clk_in=0;
            reset=1;
            #10 reset=0;
            #10 reset=1;
            #10 reset=0;
           
            
           
                        

    end
endmodule
