`timescale 1ns / 1ps



module top_module(
    input logic CLK100MHZ, CPU_RESETN, BTNC, BTNU, BTND, BTNL,BTNR,
    input logic [15:0] SW,
    output logic CA, CB , CC, CD, CE, CF, CG,
    output logic [4:0] LED,
    output logic [7:0]AN);
    logic clk;
    logic [7:0]anodes;
    
    Clock_divader #(.F_in(100000000), .F_out(100000)) clock (.clk_in(CLK100MHZ),
                                                             .reset(CPU_RESETN),
                                                             .clock_out(clk));
    
    alu_reg #(.N(16)) Alu (.clk(clk),
                           .data_in(SW),
                           .reset(BTNC),
                           .load_a(BTNU),
                           .load_b(BTND),
                           .load_Op(BTNL),
                           .updateRes(BTNR),
                           .AN(anodes),
                           .Segments({CA,CB,CC,CD,CE,CF,CG}),
                           .LEDs(LED)
                           );
                           
    
    
   assign AN = {4'b1111, anodes[3:0]};
    
endmodule
