`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 12:00:34
// Design Name: 
// Module Name: test_act3
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


module test_act3;

    // Parámetros del testbench


    // Señales de entrada del DUT
    logic [3:0] A;
    logic [3:0] B;
    logic [1:0] OpCode;

    // Señales de salida del DUT
    logic [4:0] Flags;
    logic [3:0] Result;

    // Clock del testbench


    // Instancia del DUT
    S4_actividad3 #(.M(4)) dut (
        .A(A),
        .B(B),
        .OpCode(OpCode),
        .Flags(Flags),
        .Result(Result)
    );

    // Proceso que genera las señales de entrada

    // Proceso que cambia el clock

    // Proceso que imprime los resultados





      initial begin
      
        A = 4'b1111;
        B = 4'b0001;

        OpCode = 2'b00;
        #10 OpCode = 2'b01;
        #10 OpCode = 2'b10;
        #10 OpCode = 2'b11;

        #10  A = 4'b1111;
             B = 4'b0000;

        OpCode = 2'b00;
        #10 OpCode = 2'b01;
        #10 OpCode = 2'b10;
        #10 OpCode = 2'b11;

       // #10  A = 8'b10100;
       //      B = 8'b11001;

       // OpCode = 2'b00;
       // #10 OpCode = 2'b01;
       // #10 OpCode = 2'b10;
       // #10 OpCode = 2'b11;
      end 




endmodule
