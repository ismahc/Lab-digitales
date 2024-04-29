`timescale 1ns / 1ps


module counter1#(parameter N = 8)(
    input logic clock, reset,
    output logic [N-1:0] counter);
    
    always_ff @(posedge clock) begin
        if (reset)
            counter <= 'd0;
        else
            counter <= counter + 'd1;
            
    end    
endmodule
