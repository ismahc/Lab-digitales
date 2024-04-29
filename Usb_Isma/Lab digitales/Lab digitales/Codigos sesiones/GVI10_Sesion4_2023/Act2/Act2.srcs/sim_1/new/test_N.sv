`timescale 1ns / 1ps

module test_N();
 logic clock, reset,enable, dec,load;
 logic [3:0] Load_Ref_value;
 logic [3:0] counterN;
 logic threshold;
 
 
 S4_actividad2 #(.N(4))DUT(.clock(clock),
                            .reset(reset),
                            .enable(enable),
                            .dec(dec),
                            .load(load),
                            .counterN(counterN),
                            .Load_Ref_value(Load_Ref_value),
                            .threshold(threshold));
                                                  
   always #5 clock = ~clock;

    initial begin
        clock = 0;
        reset = 1;
        enable = 0;
        load = 1;
        Load_Ref_value = 4'd0;
        dec = 0;
       
        #10 reset = 0;
        #20 load = 0;
        #10 enable = 1;
            dec = 0;
        #300 enable = 0;
        
    end
endmodule
