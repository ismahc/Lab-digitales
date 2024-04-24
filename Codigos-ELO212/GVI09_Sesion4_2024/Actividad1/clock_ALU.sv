`timescale 1ns / 1ps


module clock_ALU (
  input logic [31:0] input_a,
  input logic [31:0] input_b,
  input logic [1:0] op_select,
  output logic [31:0] out
);

  always_comb begin
    case(op_select)
      2'b00: out = input_a + input_b; // Suma
      2'b01: out = input_a & input_b; // AND
      2'b10: out = input_a >> 1; // Desplazamiento hacia la derecha
      2'b11: out = input_a + 1; // Incremento
      default: out = 0; // Valor predeterminado
    endcase
  end

endmodule