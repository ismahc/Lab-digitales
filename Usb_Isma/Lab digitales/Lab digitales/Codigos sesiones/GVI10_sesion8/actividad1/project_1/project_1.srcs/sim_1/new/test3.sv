`timescale 1ns / 1ps

module test3 ();
    logic clk, resetN;
    logic Enter;
    logic Undo;
    logic [15:0] DataIn;
    logic [4:0] Flags;
    logic [2:0] Status;
    logic [6:0] Segments;
    logic [7:0] Anodes;
    
    
    S8_actividad1 DUT(.clk(clk),
                      .resetN(resetN),
                      .Enter(Enter),
                      .Undo(Undo),
                      .DataIn(DataIn),
                      .Flags(Flags),
                      .Status(Status),
                      .Segments(Segments),
                      .Anodes(Anodes));
    
    always #1 clk = ~clk;
    initial begin 
    resetN= 0;
    clk = 1;
    Enter= 0;
    Undo = 0;
    
    #8 resetN = 1;
        DataIn = 15'ha;
        
    #30 Enter = 1;
    #30 Enter = 0;
    
    //#10 DataIn = 15'h3;
    #40 DataIn = 15'h7;
    
    #30 Undo = 1;
    #30 Undo = 0;
    
    
    
    #30 Enter = 1;
    #25 Enter = 0;
    
    //#20 DataIn = 15'h2;
    
    
    #10 DataIn = 15'h2;
    
    #30 Enter = 1;
    #40 Enter = 0;
    
    #60 DataIn = 15'h3;
    
    #38 Enter = 1;
    #10 Enter = 0;
    
    
    #100 Enter = 1;
    #10 Enter = 0;
    
 
    
  
    end       
endmodule