`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 17:04:29
// Design Name: 
// Module Name: test_sistem
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


module test_sistem();
       logic clk,reset,reset2,reset3;
       logic [3:0] DEC;
       logic [6:0] sevenSeg;
       
       sistema_multi DUT(.clk(clk),
                         .DEC(DEC),
                         .reset(reset),
                         .reset2(reset2),
                         .reset3(reset3),
                         .sevenSeg(sevenSeg)
                        );
       always #1 clk=~clk; //genera un reloj de entrada

        initial begin 
            clk=0;
            reset=1;
            reset2 = 1;
            reset3 = 1;
            
            #1.5
           reset = 0;
            
            #10
            
            reset2 = 0;
            reset3 = 0;
            
           
            
        end
        
        
endmodule
