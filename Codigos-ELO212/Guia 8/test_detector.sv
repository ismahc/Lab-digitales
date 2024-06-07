`timescale 1ns / 1ps

module test_detector();
    logic clk, reset;
    logic L;
    logic P;
    
    
    edge_detector DUT(.clk(clk),
                      .reset(reset),
                      .L(L),
                      .P(P));
                      
    
    always #10 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        L = 0;
        #20 reset = 0;
        #5 L = 1;
        #50 L = 0;      
        #20 L = 1;
        #40 L = 0;
        
        #60 L = 1;
        #20 L = 0;
       
    end          
endmodule
