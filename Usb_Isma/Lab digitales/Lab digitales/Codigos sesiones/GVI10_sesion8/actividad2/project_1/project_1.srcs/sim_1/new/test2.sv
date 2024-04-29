`timescale 1ns / 1ps

module test2();

  // Parámetro para el debouncer
  localparam N_DEBOUNCER = 10;

  // Señales de entrada
  logic clk;
  logic resetN;
  logic Enter;
  logic Undo;
  logic DisplayFormat;
  logic [15:0] DataIn;

  // Señales de salida
  logic [6:0] Segments;
  logic [7:0] Anodes;
  logic [4:0] Flags;
  logic [2:0] Status;

  // Instanciar el módulo bajo prueba
  S8_actividad2 dut (
    .clk(clk),
    .resetN(resetN),
    .Enter(Enter),
    .Undo(Undo),
    .DisplayFormat(DisplayFormat),
    .DataIn(DataIn),
    .Segments(Segments),
    .Anodes(Anodes),
    .Flags(Flags),
    .Status(Status)
  );
   always #1 clk = ~clk;  
      // Generar estímulos de prueba
  initial begin
    // Inicializar las señales
    clk = 0;
    resetN = 0;
    Enter = 0;
    Undo = 0;
    DisplayFormat = 0;
    DataIn = 0;

  
    
    #8 resetN = 1;
        DataIn = 15'ha;
        
        
    #30 Enter = 1;
    #20 DisplayFormat = 1;
    #80 Enter = 0;
        DisplayFormat = 0;
        
    
    //#10 DataIn = 15'h3;
    #60 DataIn = 15'h7;
    
    
    
    
    #30 Enter = 1;
    #25 Enter = 0;
    
    //#20 DataIn = 15'h2;
    
    
    #35 Undo = 1;
    #15 Undo = 0;
    
    
    #10 DataIn = 15'h2;
    
    #30 Enter = 1;
    #40 Enter = 0;
    
    #60 DataIn = 15'h3;
    
    #38 Enter = 1;
    #17 Enter = 0;
    
    
    #120 Enter = 1;
    #17 Enter = 0;
   
  end

  
  

endmodule
