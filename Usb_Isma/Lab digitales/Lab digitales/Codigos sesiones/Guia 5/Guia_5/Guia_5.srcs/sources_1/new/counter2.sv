`timescale 1ns / 1ps

module counter2#(parameter N = 8)(
    input logic clock, reset,
    output logic [N-1:0] counter);
    
    logic [N-1:0] counter_next;
    
    always_comb begin
        counter_next = counter + 'd1;
    end 
    
    always_ff @ (posedge clock) begin
    if(reset)
        counter <= 'd0;
    else 
        counter <= counter_next;    
    end    
endmodule
