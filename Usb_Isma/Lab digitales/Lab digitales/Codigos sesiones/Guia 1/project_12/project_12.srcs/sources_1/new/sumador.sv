`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 15:03:40
// Design Name: 
// Module Name: sumador
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

module sumador(
     input logic [3:0] A, B,
     input logic cin,
     output logic [3:0] C, 
     output logic cout
      );
     assign {C,cout} = A+B+cin;    
endmodule
