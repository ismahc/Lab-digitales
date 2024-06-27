`timescale 1ns / 1ps

module Dec_8(
    input logic [2:0] counter,
    output logic [7:0] anodes
     );
  always_comb 
    case(counter)
      3'b000:  anodes = 8'b11111110;
      3'b001:  anodes = 8'b11111101;
      3'b010:  anodes = 8'b11111011;
      3'b011:  anodes = 8'b11110111;
      3'b100:  anodes = 8'b11101111;
      3'b101:  anodes = 8'b11011111;
      3'b110:  anodes = 8'b10111111;
      3'b111:  anodes = 8'b01111111;
      default: anodes = 8'bxxxxxxxx;
     endcase
endmodule