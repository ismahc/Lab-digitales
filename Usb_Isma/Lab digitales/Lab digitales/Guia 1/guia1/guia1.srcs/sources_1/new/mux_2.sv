`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 17:34:07
// Design Name: 
// Module Name: mux_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_2(
    input logic [3:0]A,[3:0]B,[3:0]C,[3:0]D,[3:0]E,[3:0]sel,
    output logic [3:0]out
    );
    
    always_comb begin
        case(sel)
          3'd0 : out= A;
          3'd1 : out= B;
          3'd2 : out= C; 
          3'd3 : out= D;
          3'd4 : out= E;
          default : out=A;
        endcase 
    end
    
endmodule
