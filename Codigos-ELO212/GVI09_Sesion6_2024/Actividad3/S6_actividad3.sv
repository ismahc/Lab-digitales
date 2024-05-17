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
    input logic load_a, load_b, load_Op,updateRes,
    output logic    CA,CB,CC,CD,CE,CF,CG,
    output logic [7:0]  AN,
    output logic [4:0] LED
    );
    
    
        logic [2:0] counter;
        logic [3:0] BCD_4;
        logic reset;
        logic [6:0] segments;
        logic [7:0] anodes;
        logic clk;
        logic [N-1:0] data_in,Result;
        
        
        assign reset = ~CPU_RESETN;
        assign segments = {CA,CB,CC,CD,CE,CF,CG};
        assign anodes = AN;
        
        assign V_a = {SW[15],SW[14],SW[13],SW[12],SW[11],SW[10],SW[9]};
        assign V_b = {SW[8],SW[7],SW[6],SW[5],SW[4],SW[3],SW[2]};
        assign V_Op = {SW[1],SW[0]};
        assign Flags = {LED[4],LED[3],LED[2],LED[1],LED[0]};
        
        
        logic [31:0] HEX_in = { 24'b0 ,Result};
        
        
    //
    
            clock_divider_par #(.F_IN(100000000), .F_OUT(500)) clock_100_to_1 (.clk_in(CLK100MHZ),
                                            .reset(reset),
                                            .clk_out(clk));

    //
    
        
    reg_param #(.N(N)) registro_a (.clk(clk), .reset(reset) , .load(load_a), .D(data_in),.Q(V_a));

    reg_param #(.N(N)) registro_b (.clk(clk), .reset(reset) , .load(load_b), .D(data_in),.Q(V_b));

    reg_param #(.N(2)) registro_op (.clk(clk), .reset(reset) , .load(load_Op), .D(data_in_op),.Q(V_op));

    S4_actividad3 #(.M(N)) alu (.A(V_a), .B(V_b), .OpCode(V_op), .Result(Result), .Flags(Flags));

    reg_param #(.N(N)) result_alu (.clk(clk), .reset(reset), .load(updateRes), .D(Result),.Q(HEX_in)); //cambiar seven_seg_imput por la entrada del modulo de seven seg

    reg_param #(.N(5)) result_flags (.clk(clk), .reset(reset), .load(updateRes), .D(Flags),.Q(LED));

    S4_actividad1 Hex_to_sevenseg (.clock(clk), .reset(reset), .HEX_in(HEX_in), .segments (segments), .anodes(anodes)); 

endmodule
