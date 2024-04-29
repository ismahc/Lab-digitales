`timescale 1ns / 1ps



module top_module(
    input logic CLK100MHZ, CPU_RESETN, BTNC, BTNU, BTND, BTNL,BTNR,
    input logic [15:0] SW,
    output logic CA, CB , CC, CD, CE, CF, CG,
    output logic [15:0] LED,
    output logic [7:0]AN);
    
    logic clk;
   
    
     
    
    Clock_divader #(.F_IN(100000000), .F_OUT(100000)) clock (.clk_in(CLK100MHZ),
                                                             .reset(BTNL),
                                                             .clk_out(clk));
    
    S8_actividad2 #(.N_DEBOUNCER(10)) Sistema (.clk(clk),
                           .resetN(!CPU_RESETN),
                           .Enter(BTNC),
                           .Undo(BTNR),
                           .DisplayFormat(BTND),
                           .DataIn(SW),
                           .Anodes(AN),
                           .Segments({CA,CB,CC,CD,CE,CF,CG}),
                           .Flags(LED[4:0]),
                           .Status(LED[15:13])
                           );
                           
    
    assign LED [12:5] = 'b0;

endmodule
