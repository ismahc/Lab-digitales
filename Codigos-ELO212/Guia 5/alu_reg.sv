`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2023 12:39:20
// Design Name: 
// Module Name: alu_reg
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


module alu_reg #(parameter N = 16)(
    input logic [N-1:0] data_in,
    input logic load_a, load_b, load_Op, clk,reset,updateRes,
    output logic [6:0]Segments,
    output logic [7:0]Anodes,
    output logic [4:0]LEDs
    );
    
    
    logic [1:0] V_op;
    logic [N-1 : 0] V_a, V_b;
    logic [1:0] data_in_op;
    logic [N-1:0] Result;
    logic [4:0] Flags;
    logic [N-1:0] HEX_in;
    assign  data_in_op = data_in[1:0];
    
    
    reg_param #(.N(N)) registro_a (.clk(clk), .reset(reset) , .load(load_a), .D(data_in),.Q(V_a));
    
    reg_param #(.N(N)) registro_b (.clk(clk), .reset(reset) , .load(load_b), .D(data_in),.Q(V_b));
    
    reg_param #(.N(2)) registro_op (.clk(clk), .reset(reset) , .load(load_Op), .D(data_in_op),.Q(V_op));
    
    S4_actividad3 #(.M(N)) alu (.A(V_a), .B(V_b), .OpCode(V_op), .Result(Result), .Flags(Flags));
   
    reg_param #(.N(N)) result_alu (.clk(clk), .reset(reset), .load(updateRes), .D(Result),.Q(HEX_in)); //cambiar seven_seg_imput por la entrada del modulo de seven seg
   
    reg_param #(.N(5)) result_flags (.clk(clk), .reset(reset), .load(updateRes), .D(Flags),.Q(LEDs));
    
    S4_actividad1 Hex_to_sevenseg (.clock(clk), .reset(reset), .HEX_in(HEX_in), .segments (Segments), .anodes(Anodes));
    
endmodule
