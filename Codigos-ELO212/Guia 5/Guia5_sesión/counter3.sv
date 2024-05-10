`timescale 1ns / 1ps

module counter3#(parameter N = 8)(
    input logic clock, reset,
    output logic [N-1:0] counter);
    
    logic [N-1:0] counter_next;
    
    always_comb begin 
        if(reset)
            counter_next = 'd0;
        else
            counter_next = counter + 'd1;
    end
    
    always_ff @(posedge clock) begin 
        counter <= counter_next;
    end
endmodule
