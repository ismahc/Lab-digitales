`timescale 1ns / 1ps

module BCD_to_sevenSeg(
    input logic [3:0]  BCD_in,
    output logic [6:0]  segments
    );
    always_comb begin 
       case(BCD_in)
          4'd0: segments = 7'b0000001;
          4'd1: segments = 7'b1001111;
          4'd2: segments = 7'b0010010;
          4'd3: segments = 7'b0000110;
          4'd4: segments = 7'b1001100;
          4'd5: segments = 7'b0100100;
          4'd6: segments = 7'b0100000;
          4'd7: segments = 7'b0001111;
          4'd8: segments = 7'b0000000;
          4'd9: segments = 7'b0000100;
          4'd10: segments = 7'b0001000;
          4'd11: segments = 7'b1100000;
          4'd12: segments = 7'b0110001;
          4'd13: segments = 7'b1000010;
          4'd14: segments = 7'b0110000;
          4'd15: segments = 7'b0111000;
          default: segments = 7'b1111111;
      endcase
     end  
endmodule