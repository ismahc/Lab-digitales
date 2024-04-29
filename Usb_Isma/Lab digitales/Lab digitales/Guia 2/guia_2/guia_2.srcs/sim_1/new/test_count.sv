`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 16:04:14
// Design Name: 
// Module Name: test_count
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

module test_count();

    logic       clk, reset;
    logic [3:0] count;

    counter_4bit DUT (.clk(clk),
                        .reset(reset),
                        .count(count));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;

        #25 reset = 1;
        #5 reset = 0;

    end

endmodule

