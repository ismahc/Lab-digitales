module test_reg_des();

    logic clock, reset, enable, shift_in;
    logic out;
    
    
    reg_desplazamiento DUT(.clock(clock),
                 .reset(reset),
                 .enable(enable),
                 .shift_in(shift_in),
                 .out(out));
 always #10 clock=~clock;
 always #100 shift_in = ~shift_in;
 
 initial begin
 clock=0;
 reset=1;
 enable = 1;
 shift_in = 1;
 
 #10 reset=0;
 #20 reset = 1;
 #15 reset =0 ; 
 
 
 end
                
                 
endmodule
