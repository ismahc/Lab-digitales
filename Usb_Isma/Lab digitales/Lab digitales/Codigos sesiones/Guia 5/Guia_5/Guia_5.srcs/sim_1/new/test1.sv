`timescale 1ns / 1ps


module test1();
    logic clock, reset;
    logic  [7:0] counter;



    counter1 #(.N(8)) DUT(.clock(clock), 
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
