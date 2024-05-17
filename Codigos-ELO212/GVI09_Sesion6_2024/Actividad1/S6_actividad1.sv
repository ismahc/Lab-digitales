`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// University: Universidad Tecnica Federico Santa Maria
// Course: ELO212 
// Students: 
// 
// Create Date: 
// Design Name: Guia 4
// Module Name: S4_actividad1
// Project Name: 
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado 2021.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S4_actividad1(
    input  logic        CLK100MHZ,
    input  logic        CPU_RESETN,
    input  logic [15:0] SW,
    output logic        CA,CB,CC,CD,CE,CF,CG,
    output logic [7:0]  AN
    );
        
        logic [2:0] counter;
        logic [3:0] BCD_4;
        logic clock2;
        logic [6:0] segments;
        logic [7:0] anodes;
        
        
        assign reset = ~CPU_RESETN;

        logic [31:0] HEX_in = { 16'b0 ,SW[15:0]};
        assign segments = {CA,CB,CC,CD,CE,CF,CG};
        assign anodes = AN;
        
        
        //reductor de frecuencia de reloj
        
        clock_divider_par #(.F_IN(100000000), .F_OUT(500)) clock_100_to_1 (.clk_in(CLK100MHZ),
                                            .reset(reset),
                                            .clk_out(clock2));

        // 
        

        logic  clock = clock2;
        
        counter_Nbits contador_3bits(.clock(clock),
                                      .reset(reset),
                                      .counter(counter));
        
        
                                      
        Mux_temporal_multi_bits Mux_temporal_multi_bits(.HEX_in(HEX_in),
                                                        .counter(counter),
                                                        .BCD_4(BCD_4));
        Dec_8 Dec_8(.counter(counter),
                    .anodes(anodes));
                    
        
        BCD_to_sevenSeg BCD_to_sevenSeg(.BCD_in(BCD_4),
                                        .segments(segments));         
       
            
    
    
endmodule
