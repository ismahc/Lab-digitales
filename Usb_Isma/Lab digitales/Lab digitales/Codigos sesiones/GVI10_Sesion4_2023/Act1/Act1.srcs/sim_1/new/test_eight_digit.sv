`timescale 1ns / 1ps

module test_eight_digit();
    logic clock, reset;
    logic [31:0] HEX_in;
    logic [6:0] segments;
    logic [7:0] anodes;
    
    S4_actividad1 DUT(.clock(clock),.reset(reset),.HEX_in(HEX_in),.segments(segments),.anodes(anodes));
    
    always #1 clock=~clock;
    

    
    initial begin
    HEX_in = 32'hABCD_1234;
    reset = 0;
    clock = 0;  
    
    #1.5 reset = 1;
    #4 reset = 0;
    
 
    
    end
    
endmodule
