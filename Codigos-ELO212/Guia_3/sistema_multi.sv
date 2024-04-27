`timescale 1ns / 1ps


module sistema_multi(
        input logic clk, reset,reset2,reset3,
        output logic [3:0] DEC,
        output logic [6:0] sevenSeg 
        
        );
        
        
        //logic [1:0] count_2;
        logic [15:0] count_16;
        logic clk_1, clk_2;
        logic [1:0] count_2;
        
        // Se generan los dos relojes 
        
        clock_divider_par #(.F_IN(100), .F_OUT(50))
        Reloj(.clk_in(clk),
              .reset(reset),
              .clk_out(clk_1));
                 
        clock_divider_par #(.F_IN(100), .F_OUT(16))
        Reloj_2(.clk_in(clk),
              .reset(reset),
              .clk_out(clk_2));        
        
        
        //Se generan los condadores de 2 y 16 bit
        contador_Nbits #(.WIDTH(2)) contador1(
                .clk(clk_1),
                .reset(reset2),
                .count(count_2));
            // Genera un contador de 2 bits 
             
        contador_Nbits #(.WIDTH(16)) contador2(
                .clk(clk_2),
                .reset(reset2),
                .count(count_16));  
                
            // Genera un contador de 16 bits      
            
            
      //Decodificador binario. Encargado de alternar  los display de 7 seg
                    
        decodificador_binario decodificador(
                .a(count_2),
                .y(DEC));
                
        logic [3:0] BCD_in;
        
        // dependiendo de la entrada entrega los 4 bits para el digito BCD 
        MUX_temporal MUx(
                .count(count_2),
                .in_16(count_16),
                .out_4(BCD_in));
        //muestra  el mismo digito en todo los segmentos - pero solo uno se prende desde DEC 
        BCD_to_sevenSeg BCD(
                .BCD_in(BCD_in),
                .sevenSeg(sevenSeg));
        

              
endmodule
