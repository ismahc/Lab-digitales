`timescale 1ns / 1ps

// Modulo escrito en clases

module count_especial {
    input logic clk, rst, ctrl;
    output logic [3:0] count;

    contador_especial (. clk (clk), .rst (rst), .ctrl (ctrl), .count (count));
     always @(posedge ) begin
        
     end

    initial begin
        
    end
}
endmodule