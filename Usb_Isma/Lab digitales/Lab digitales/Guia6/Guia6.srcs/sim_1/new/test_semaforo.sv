`timescale 1ns / 1ps

module test_semaforo();
    logic clk, reset;
    logic TA, TB;
    logic [2:0] LA; 
    logic [2:0] LB;
    
    semaforo DUT(.clk(clk),
                  .reset(reset),
                  .TA(TA),
                  .TB(TB),
                  .LA(LA),
                  .LB(LB));
                  
    always #10 clk = ~clk; 
    
    initial begin
        clk = 0;
        reset = 1;
        TA = 0;
        TB = 0;
        
        #20 reset = 0;
        #5 TA = 1;
        #30 TA = 0;
            TB = 1;
        #30 TA = 1;    
        #50 TB = 0;
   
    end       
endmodule
