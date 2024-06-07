`timescale 1ns / 1ps

module testbench();

    logic [6:0] A,B,Result, Result_ref;
    logic [4:0] Flags, Flags_ref;
    logic [1:0] OpCode;
    logic all_right;

    S4_actividad3 #(.M(7))
    MOD1
    (
        .A(A),
        .B(B),
        .Result(Result),
        .Flags(Flags),
        .OpCode(OpCode)
    );

    ALU_ref #(.M(7))
    MOD2
    (
        .A(A),
        .B(B),
        .Result(Result_ref),
        .Flags(Flags_ref),
        .OpCode(OpCode)
    );


    //always #1 B = B + 4'b0001;
    //always #16 A = A + 4'b0001;
    always #256 OpCode = OpCode + 2'b01;
    
    initial
    begin
        OpCode = 2'b00;
        A = 7'b0001101;
        B = 7'b1100000;


    end

    assign all_right = (Result == Result_ref) & (Flags == Flags_ref);


endmodule
