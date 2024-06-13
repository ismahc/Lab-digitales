`timescale 1ns / 1ps

module S4_actividad3#(parameter M=8)(
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
            2'b00: R = A - B;  // RESTA
            2'b01: R = A + B;     // SUMA
            2'b10: R = (A | B);  // OR 
            2'b11: R = (A & B);  // AND
            default: R = 0;       // Default 
        endcase

        Result = R[M-1:0];

        // Flags
        Z = (Result == 0);  // Z

        N = Result[M-1];  // N


        P = (^Result); //si el Xor bit a bit da 0. entonces es par, en 1 es impar


        if(OpCode == 2'b00)begin
            V = ((~A[M-1] & B[M-1] & Result[M-1]) | (A[M-1] & ~B[M-1] & ~Result[M-1]));  // V
            C = R[M];  // C
        end else if(OpCode == 2'b01)begin
             V =((~A[M-1] & ~B[M-1] & Result[M-1]) | (A[M-1] & B[M-1] & ~Result[M-1]));  // V
            C = R[M];
        end else begin
            V = 0;  // V
            C = 0;  // C
        end

    end 

    assign Flags = {N,Z,C,V,P};

endmodule
