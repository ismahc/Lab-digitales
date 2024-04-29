`timescale 1ns / 1ps

module S4_actividad3_optimizada #(parameter M=8)(
    input logic [M-1:0] A,
    input logic [M-1:0] B,
    input logic [1:0] OpCode,
    output logic [4:0] flags,
    output logic [M-1:0] Result
);
    // Variables internas
    logic V, C, Z, N, P;
    logic [M:0] R;
    always_comb begin
        case(OpCode)
            2'b00: R = ~(A | B);  // NOR 
            2'b01: R = ~(A & B);  // NAND 
            2'b10: R = A + B;     // SUMA
            2'b11: R = A - B;     // RESTA 
            default: R = 0;       // Default 
        endcase

        Result = R[M-1:0];

        // Flags
        Z = (Result == 0);  // Z

        N = Result[M-1];  // N

        P = ((^Result) & 1'b1);  // P

        if(OpCode == 2'b10)begin
            V = ((~A[M-1] & ~B[M-1] & Result[M-1]) | (A[M-1] & B[M-1] & ~Result[M-1]));  // V
            C = (R[M] == 1);  // C
        end else if(OpCode == 2'b11)begin
            V = ((~A[M-1] & B[M-1] & Result[M-1]) | (A[M-1] & ~B[M-1] & ~Result[M-1]));  // V
            C = (A < B);  // C
        end else begin
            V = 0;  // V
            C = 0;  // C
        end

    end 

    assign flags = {V, C, Z, N, P};

endmodule
