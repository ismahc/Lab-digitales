`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2024 22:22:50
// Design Name: 
// Module Name: test_act2
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


module test_act2(

    );
    
     logic clock, reset,enable, dec,load;
     logic [3:0] load_ref_value;
     logic [3:0] counterN;
     logic threshold;
     
     
     S4_actividad2 #(.N(4))DUT(.clock(clock),
                                .reset(reset),
                                .enable(enable),
                                .dec(dec),
                                .load(load),
                                .counterN(counterN),
                                .load_ref_value(load_ref_value),
                                .threshold(threshold));
                                                      
       always #1 clock = ~clock;
    
        initial begin
            clock = 0;
            reset = 1;
            enable = 0;
            load = 0;
            load_ref_value = 4'b0011;
            dec = 0;
            #2
            reset = 0;           
            #1
            reset = 1;
            #2
            reset = 0;
            #40 reset= 1;
           
            #40;
            reset = 0;
            enable = 0;
            load = 0;
            dec = 0;
            
            #40;
            reset = 0;
            enable = 0;
            load = 0;
            dec = 1;
            
            #40;
            reset = 0;
            enable = 0;
            load = 1;
            dec = 0;
            
            #40;
            reset = 0;
            enable = 0;
            load = 1;
            dec = 1;
            
            #40;
            reset = 0;
            enable = 1;
            load = 0;
            dec = 0;
            
            #40;
            reset = 0;
            enable = 1;
            load = 0;
            dec = 1;
            
            #40;
            reset = 0;
            enable = 1;
            load = 1;
            dec = 0;
            
            #40;
            reset = 0;
            enable = 1;
            load = 1;
            dec = 1;
            
            #40;
            reset = 1;
            enable = 0;
            load = 0;
            dec = 0;
            
            #40;
            reset = 1;
            enable = 0;
            load = 0;
            dec = 1;
            
            #40;
            reset = 1;
            enable = 0;
            load = 1;
            dec = 0;
            
            #40;
            reset = 1;
            enable = 0;
            load = 1;
            dec = 1;
            
            #40;
            reset = 1;
            enable = 1;
            load = 0;
            dec = 0;
            
            #40;
            reset = 1;
            enable = 1;
            load = 0;
            dec = 1;
            
            #40;
            reset = 1;
            enable = 1;
            load = 1;
            dec = 0;
            
            #40;
            reset = 1;
            enable = 1;
            load = 1;
            dec = 1;
        end
endmodule

