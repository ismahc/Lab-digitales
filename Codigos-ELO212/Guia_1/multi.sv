`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 17:15:41
// Design Name: 
// Module Name: multi
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


module multi(
   input logic [3:0]A, [3:0]B, [3:0]C, [3:0]D, [2:0]sel,
   output logic [3:0]out
   );
   
   always_comb begin
    case (sel)
        2'b00 : out = A;
        2'b01 : out = B;
        2'b10 : out = C;
        2'b11 : out = D;
        default : out = A; 
    endcase
   end
endmodule
