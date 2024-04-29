`timescale 1ns / 1ps

module shifter(
    input logic clock, reset, enable, shift_in,
    output logic out
    );
   logic [31:0] shifting;
   logic [31:0] ahishifting;
   
   always_ff @(posedge clock)
    begin 
        shifting <= ahishifting;   
    end
   
   always_comb
    begin
     if (reset) begin
           ahishifting <= 32'd0;
            end
        else if(enable) begin
            ahishifting <= {shifting[30:0],shift_in};
        end else
            ahishifting <= shifting;
        
    end 
   
assign out = shifting[31];    
endmodule
