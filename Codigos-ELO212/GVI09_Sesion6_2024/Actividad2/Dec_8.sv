`timescale 1ns / 1ps


module Dec_8(
    input logic [2:0] counter,
    output logic [7:0] anodes
     );
  always_comb 
    case(counter) //contador one-cold. Es necesaria ya que la placa debe tener los anodos en estado activo. La logica de la placa esta invertida.
      3'b000:  anodes = 8'b11111110;
      default: anodes = 8'b11111110;
     endcase
endmodule
