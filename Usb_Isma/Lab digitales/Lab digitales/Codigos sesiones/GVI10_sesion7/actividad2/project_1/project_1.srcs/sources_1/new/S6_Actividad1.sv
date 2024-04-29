`timescale 1ns / 1ps

module S6_Actividad1 #(parameter N = 16)(
    input logic [N-1:0] data_in,
    input logic load_A, load_B, load_Op, clk,reset,updateRes,
    output logic [4:0] LEDs,
    output logic [N-1:0] HEX_in 
    );
    
    logic [1:0] V_op;
    logic [N-1 : 0] V_a, V_b;
    logic [1:0] data_in_op;
    logic [N-1:0] Result;
    logic [4:0] Flags;
    assign  data_in_op = data_in[1:0];
    
    
    reg_param #(.N(N)) registro_a (.clk(clk), .reset(reset) , .load(load_A), .D(data_in),.Q(V_a));
    
    reg_param #(.N(N)) registro_b (.clk(clk), .reset(reset) , .load(load_B), .D(data_in),.Q(V_b));
    
    reg_param #(.N(2)) registro_op (.clk(clk), .reset(reset) , .load(load_Op), .D(data_in_op),.Q(V_op));
    
    S4_actividad3 #(.M(N)) alu (.A(V_a), .B(V_b), .OpCode(V_op), .Result(Result), .Flags(Flags));
   
    reg_param #(.N(N)) result_alu (.clk(clk), .reset(reset), .load(updateRes), .D(Result),.Q(HEX_in)); //cambiar seven_seg_imput por la entrada del modulo de seven seg
   
    reg_param #(.N(5)) result_flags (.clk(clk), .reset(reset), .load(updateRes), .D(Flags),.Q(LEDs));
    
   
endmodule
