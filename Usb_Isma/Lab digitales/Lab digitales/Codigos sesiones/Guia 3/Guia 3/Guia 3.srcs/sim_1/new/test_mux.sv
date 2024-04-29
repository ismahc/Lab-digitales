`timescale 1ns / 1ps

module test_mux();
    logic [15:0] in_16;
    logic [3:0]  out_4;
    logic [1:0] count;
    
    MUX_temporal DUT(
            .out_4(out_4),
            .in_16(in_16),
            .count(count));
            
            
     initial begin
        in_16=16'hABCD;
        #2
        count=2'b00;
        #2
        count=2'b01;
        #2
        count=2'b10;
        #2
        count=2'b11;
        #2
        count=2'b00;
        #2
        count=2'b01;
    end
endmodule