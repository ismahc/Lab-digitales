`timescale 1ns / 1ps

module test2 ();
    logic clk, reset;
    logic Enter;
    logic Undo;
    logic [15:0] DataIn;
    logic [15:0] ToDisplay;
    logic [4:0] Flags;
    logic [2:0] Status;
    
    S7_actividad2 DUT(.clk(clk),
                      .reset(reset),
                      .Enter(Enter),
                      .Undo(Undo),
                      .DataIn(DataIn),
                      .ToDisplay(ToDisplay),
                      .Flags(Flags),
                      .Status(Status));
    
    always #7 clk = ~clk;
    initial begin 
    reset= 1;
    clk = 0;
    Enter= 0;
    Undo = 0;
    
    #20 reset = 0;
        DataIn = 15'h8;
        
    #17 Enter = 1;
    #25 Enter = 0;
    
    #10 DataIn = 15'h3;
    #30 DataIn = 15'h7;
    
    
    
    
    #15 Enter = 1;
    #25 Enter = 0;
    
    #20 DataIn = 15'h2;
    
    
    #40 Undo = 1;
    #20 Undo = 0;
    
    
    #30 DataIn = 15'h6;
    
    #38 Enter = 1;
    #17 Enter = 0;
    
    #40 DataIn = 15'h3;
    
    #38 Enter = 1;
    #17 Enter = 0;
 
    
  
    end       
endmodule
