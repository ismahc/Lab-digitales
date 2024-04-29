`timescale 1ns / 1ps

module test_shfter();
 logic clock, reset, enable, shift_in;
    logic out;


    shifter DUT(.clock(clock),
                 .reset(reset),
                 .enable(enable),
                 .shift_in(shift_in),
                 .out(out));
 always #10 clock=~clock;
 always #100 shift_in = ~shift_in;
 
 initial begin
 clock=0;
 reset = 1;
 enable = 1;
 shift_in = 1;
 
 #32 reset=0;


 
 
 
 end

endmodule
