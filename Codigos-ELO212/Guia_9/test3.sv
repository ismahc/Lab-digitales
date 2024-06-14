`timescale 1ns / 1ps

module test3 ();
    logic clk, reset;
    logic Enter;
    logic Undo;
    logic [15:0] DataIn;
    logic [4:0] Flags;
    logic [2:0] Status;
    logic [6:0] Segments;
    logic [7:0] Anodes;
    
    
    S7_actividad3 DUT(.clk(clk),
                      .reset(reset),
                      .Enter(Enter),
                      .Undo(Undo),
                      .DataIn(DataIn),
                      .Flags(Flags),
                      .Status(Status),
                      .Segments(Segments),
                      .Anodes(Anodes));
    
    always #7 clk = ~clk;
    initial begin 
    reset= 1;
    clk = 1;
    Enter= 0;
    Undo = 0;
    
    #8 reset = 0;
        DataIn = 15'ha;
        
    #30 Enter = 1;
    #25 Enter = 0;
    
    //#10 DataIn = 15'h3;
    #40 DataIn = 15'h7;
    
    
    
    
    #30 Enter = 1;
    #25 Enter = 0;
    
    //#20 DataIn = 15'h2;
    
    
    #35 Undo = 1;
    #15 Undo = 0;
    
    
    #10 DataIn = 15'h2;
    
    #30 Enter = 1;
    #15 Enter = 0;
    
    #60 DataIn = 15'h3;
    
    #38 Enter = 1;
    #17 Enter = 0;
    
    
    #120 Enter = 1;
    #17 Enter = 0;
    
 
    
  
    end       
endmodule