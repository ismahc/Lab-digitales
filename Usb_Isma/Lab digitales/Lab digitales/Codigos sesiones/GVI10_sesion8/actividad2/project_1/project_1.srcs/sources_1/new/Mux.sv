`timescale 1ns / 1ps

module Mux(
    input logic [15:0] ToDisplay,
    input logic [31:0] BCD_result,
    input logic DisplayFormat,
    output logic [31:0] Tosegments);
    
    logic [31:0] extend_todisplay;
    
    always_comb begin
        extend_todisplay = {16'b0, ToDisplay};
    end 
    
    always_comb begin
        if (DisplayFormat)
           Tosegments = BCD_result ;
        else
           Tosegments = extend_todisplay;
    end
endmodule
