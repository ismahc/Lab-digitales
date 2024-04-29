`timescale 1ns / 1ps



module top_module(
    input logic CLK100MHZ, CPU_RESETN, BTNC, BTNU, BTND, BTNL,BTNR,
    input logic [15:0] SW,
    output logic CA, CB , CC, CD, CE, CF, CG,
    output logic [4:0] LED,
    output logic [7:0]AN);
    logic clk;
    
    //logic [7:0]anodes;
    
    Clock_divader #(.F_IN(100000000), .F_OUT(1000)) clock (.clk_in(CLK100MHZ),
                                                             .reset(~CPU_RESETN),
                                                             .clk_out(clk));
    
    alu_reg #(.N(16)) Alu (.clk(clk),
                           .data_in(SW),
                           .reset(BTNC),
                           .load_A(BTNU),
                           .load_B(BTND),
                           .load_Op(BTNL),
                           .updateRes(BTNR),
                           .Anodes(AN),
                           .Segments({CA,CB,CC,CD,CE,CF,CG}),
                           .LEDs(LED)
                           );
                           
    
    
   //assign AN = {4'b1111, anodes[3:0]};
    
endmodule
   