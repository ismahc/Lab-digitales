`timescale 1ns / 1ps

module reg_param#(parameter N = 8)(
    input logic clk, reset, load,
    input logic [N-1:0] D,
    output logic [N-1:0]Q
    );
    
    always_ff@(posedge clk)
        if (reset)
            Q <= 'b0;
        else if (load)
            Q <= D; 
        else 
            Q <= Q;
endmodule
