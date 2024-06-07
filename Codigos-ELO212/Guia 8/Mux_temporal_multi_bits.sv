`timescale 1ns / 1ps

module Mux_temporal_multi_bits(
        input logic [15:0] HEX_in,
        input logic [2:0] counter,
        output logic [3:0] BCD_4
        );
        
        always_comb begin 
        case(counter)
        3'b000: BCD_4 = HEX_in[3:0];
        3'b001: BCD_4 = HEX_in[7:4];
        3'b010: BCD_4 = HEX_in[11:8];
        3'b011: BCD_4 = HEX_in[15:12];
        default: BCD_4 = 4'd0;
        endcase
        end
endmodule