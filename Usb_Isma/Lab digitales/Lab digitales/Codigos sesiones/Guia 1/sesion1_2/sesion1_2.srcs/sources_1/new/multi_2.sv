`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 17:30:44
// Design Name: 
// Module Name: multi_2
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


module multi_2(
   input logic [7:0]A, [7:0]B, [7:0]C, [7:0]D, [7:0]E, [3:0]sel,
   output logic [7:0]out
   );
   
   always_comb begin
    case (sel)
        4'd0 : out = A;
        4'd1 : out = B;
        4'd2 : out = C;
        4'd3 : out = D;
        4'd4 : out = E;
        default : out = A; 
    endcase
   end
endmodule