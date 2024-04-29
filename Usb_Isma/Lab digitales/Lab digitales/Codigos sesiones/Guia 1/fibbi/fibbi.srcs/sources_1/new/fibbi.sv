`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 00:50:18
// Design Name: 
// Module Name: fibbi
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


module fibbi(
    input logic a, b, c, d,
    output logic f
    );
    
    assign f = (~a && ~c) || (~b && ~c) || (~b && ~d);
endmodule
