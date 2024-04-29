`timescale 1ns / 1ps

module Display(
    input logic[15:0] Alu_result,
    input logic [15:0] DataIN,
    input logic Todisplaysel,
    output logic [15:0] ToDisplay
    );
    
    always_comb
        if (Todisplaysel)
            ToDisplay = DataIN;
        else
            ToDisplay = Alu_result;   
endmodule
