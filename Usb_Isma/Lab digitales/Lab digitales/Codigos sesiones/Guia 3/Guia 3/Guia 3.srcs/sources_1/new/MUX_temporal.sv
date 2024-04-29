`timescale 1ns / 1ps

module MUX_temporal(
    input logic [1:0] count,
    input logic [15:0] in_16,
    output logic [3:0] out_4
    );
   
    always_comb begin
    case(count)
    2'b00: out_4 = in_16[3:0];
    2'b01: out_4 = in_16[7:4];
    2'b10: out_4 = in_16[11:8];
    2'b11: out_4 = in_16[15:12];
    default: out_4 = 4'd0;
    endcase
    end 
endmodule
