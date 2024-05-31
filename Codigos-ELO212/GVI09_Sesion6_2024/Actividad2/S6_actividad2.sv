`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2024 22:04:05
// Design Name: 
// Module Name: S6_actividad2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module S6_actividad2(

    input  logic        CLK100MHZ,
    input  logic        CPU_RESETN,
    input  logic [15:0] SW,
    output logic        CA,CB,CC,CD,CE,CF,CG,
    output logic [1:0] LED,
    output logic [7:0]  AN
    
    );
    
        logic [2:0] counter;
        logic [3:0] BCD_4;
        logic clock2;
        logic [6:0] segments;
        logic [7:0] anodes;
        
        
        assign reset = ~CPU_RESETN;

        
        logic [3:0] counterN;
        assign segments = {CA,CB,CC,CD,CE,CF,CG};
        assign anodes = AN;
        
        
        //reductor de frecuencia de reloj
        
        clock_divider_par #(.F_IN(100000000), .F_OUT(1)) clock_100_to_1 (.clk_in(CLK100MHZ),
                                            .reset(reset),
                                            .clk_out(clock2));
    
    
         S4_actividad2 contador_principal
         (
            .clock(clock2), 
            .reset(reset),
            .dec(SW[0]),
            .enable(SW[1]), 
            .load(SW[2]),
            .load_ref_value({SW[15],SW[14],SW[13],SW[12]}),
            .counterN(counterN),
            .threshold(LED[0])
                );
       

   
                
                assign AN = {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0};
                            
                
                BCD_to_sevenSeg BCD_to_sevenSeg(.BCD_in(counterN),
                                                .segments(segments)); 
endmodule
