`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 16:34:43
// Design Name: 
// Module Name: test_decodificador
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


module test_decodificador();
        logic [1:0] a;
        logic [3:0] y;
        
        decodificador_binario DUT(.a(a),
                                  .y(y));
        
        initial begin 
            a=3'b000;
            #2
            a=3'b001;
            #2
            a=3'b010;
            #2
            a=3'b011;
            #2
            a=3'b100;
            #2
            a=3'b101;
            #2
            a=3'b110;
            #2
            a=3'b111;
        end

endmodule
