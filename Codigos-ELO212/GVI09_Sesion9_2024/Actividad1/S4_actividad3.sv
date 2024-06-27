`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 21:14:24
// Design Name: 
// Module Name: S4_actividad3
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

module S4_actividad3 #(parameter M=8)(
    input logic [M-1:0] A,
    input logic [M-1:0] B,
    input logic [1:0] OpCode,
    output logic [4:0] Flags,
    output logic [M-1:0] Result
);
    // Variables internas
    logic V, C, Z, N, P;
    logic [M:0] R;
	always_comb begin
		case(OpCode)
			2'b00: begin
			    //RESTA
			    {C, Result} = A - B;
				V = (Result[M-1] & ~A[M-1] & B[M-1]) | (~Result[M-1] & A[M-1] & ~B[M-1]);
			end

			2'b01: begin
			    //SUMA
			    {C, Result} = A + B;
				V = (Result[M-1] & ~A[M-1] & ~B[M-1]) | (~Result[M-1] & A[M-1] & B[M-1]);		
			end

			2'b10: begin
			    //OR 
				Result = (A | B);
				C = 1'b0;
				V = 1'b0;
			end

			2'b11: begin
			    //AND
				Result = (A & B);
				C = 1'b0;
				V = 1'b0;
			end

		endcase

		N = Result[M-1];
		Z = (Result == '0);
		P = ^Result;

		Flags = {N, Z, C, V, P};
	end

endmodule


