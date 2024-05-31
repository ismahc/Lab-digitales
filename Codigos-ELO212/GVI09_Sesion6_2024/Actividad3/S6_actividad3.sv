`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2024 11:43:10
// Design Name: 
// Module Name: S6_actividad3
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


module S6_actividad3  #(parameter N = 7)(
    input logic CLK100MHZ,
    input logic CPU_RESETN,
    input logic [15:0] SW,
    output logic    CA,CB,CC,CD,CE,CF,CG,
    output logic [7:0]  AN,
    output logic [4:0] LED
    );

        logic reset;
        logic [6:0] segments;
        logic [7:0] anodes;
        logic clk;
        logic [N-1:0] Result;
        logic [N-1:0] V_a,V_b;
        logic [1:0] V_Op;
        logic [4:0] Flags;
        
        assign reset = ~CPU_RESETN;
        assign  {CA,CB,CC,CD,CE,CF,CG} =segments ;
        assign  AN = anodes;
        
        assign {SW[15],SW[14],SW[13],SW[12],SW[11],SW[10],SW[9]} = V_a;
        assign  {SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2]} = V_b;
        assign  {SW[1],SW[0]} = V_Op;
        assign  {LED[4],LED[3],LED[2],LED[1],LED[0]} = Flags; //{N,Z,C,V,P};
        
        
        logic [31:0] HEX_in = { 25'b0 ,Result};
        
        
    //
    
            clock_divider_par #(.F_IN(100000000), .F_OUT(500)) clock_100_to_1 (.clk_in(CLK100MHZ),
                                            .reset(reset),
                                            .clk_out(clk));

    //
    
    S4_actividad3 #(.M(N)) Alu (.A(V_a), .B(V_b), .OpCode(V_Op), .Result(Result), .Flags(Flags));
    S4_actividad1 Hex_to_sevenseg (.clock(clk), .reset(reset), .HEX_in(HEX_in), .segments (segments), .anodes(anodes)); 

endmodule
