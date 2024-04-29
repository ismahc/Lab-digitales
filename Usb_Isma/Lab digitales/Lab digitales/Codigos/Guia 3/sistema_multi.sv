`timescale 1ns / 1ps


module sistema_multi(
        input logic clk, reset,
        output logic [3:0] DEC,
        output logic [6:0] sevenSeg  
        );
        logic [1:0] count_2;
        logic [15:0] count_16;
        logic clk_1, clk_2;
      
        
        contador_Nbits #(.WIDTH(2)) contador1(
                .clk(clk_1),
                .reset(reset),
                .count(count_2));
        contador_Nbits #(.WIDTH(16)) contador2(
                .clk(clk_2),
                .reset(reset),
                .count(count_16));         
        decodificador_binario decodificador(
                .a(count_2),
                .y(DEC));
                
        logic [3:0] BCD_in;
        
        MUX_temporal MUx(
                .count(count_2),
                .in_16(count_16),
                .out_4(BCD_in));
         
        BCD_to_sevenSeg BCD(
                .BCD_in(BCD_in),
                .sevenSeg(sevenSeg));
        
        clock_divider_par #(.F_IN(100), .F_OUT(50))
        Reloj(.clk_in(clk),
              .reset(reset),
              .clk_out(clk_1));
                 
        clock_divider_par #(.F_IN(100), .F_OUT(16))
        Reloj_2(.clk_in(clk),
              .reset(reset),
              .clk_out(clk_2));
endmodule
