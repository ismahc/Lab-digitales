
module test_reg_simple();
    logic  clock, reset, D, load;
    logic Q;
    
    reg_simple DUT(.clk(clock),
                   .reset(reset),
                   .D(D),
                   .load(load),
                   .Q(Q));
                   
 always #8 clock= ~clock;   
 always #5 D = ~D;
 
 initial begin
 clock=1;
 reset=1;
 load = 1;
 D = 0;
 
 #10 reset=0;
 #80 load = 0;
 
 
 end
             
    
    
    
endmodule