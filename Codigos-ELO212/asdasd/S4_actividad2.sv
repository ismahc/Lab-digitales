`timescale 1ns / 1ps

module S4_actividad2 #(parameter N = 32)(
    input  logic            clock, reset,
    input  logic            dec, enable, load,
    input  logic [N-1:0]    Load_Ref_value,
    output logic [N-1:0]    counterN,
	output logic            threshold
    );
    
   always_ff @(posedge clock) begin
       if (reset)
         counterN <= 0;
       else 
         counterN <= counterN+1;
    end
    
endmodule

