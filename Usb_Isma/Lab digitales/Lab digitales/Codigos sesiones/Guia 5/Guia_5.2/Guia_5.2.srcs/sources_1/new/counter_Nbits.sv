`timescale 1ns / 1ps

module counter_Nbits(
        input logic clock, reset,
        output logic [2:0] counter
        );
        
        always_ff @(posedge clock) begin
       if (reset)
         counter <= 0;
       else 
         counter <= counter+1;
    end
endmodule
