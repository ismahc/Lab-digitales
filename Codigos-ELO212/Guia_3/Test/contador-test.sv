`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2024 14:07:27
// Design Name: 
// Module Name: contador-test
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


module contador_test();
       logic clk,reset;
       logic [1:0] count;
       
       contador_Nbits #(.WIDTH(2)) DUT (.clk(clk),
                         .reset(reset),
                         
                         .count(count));
       always #1 clk=~clk; //genera un reloj de entrada

        initial begin 
            clk=0;
            reset=0;
            #5 reset = 1;
            #1.5 reset = 0;   
        end


endmodule
