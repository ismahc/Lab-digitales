`timescale 1ns / 1ps



module test_clock_2();
    logic clk_in, reset;
    logic clk_out, clk_out_1, clk_out_2,clk_out_3;
    
clock_divider_par #(. F_OUT(50),.F_IN(100)) DUT (.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out));
clock_divider_par #(. F_OUT(30),.F_IN(100)) DUT1 (.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out_1)); 
clock_divider_par #(. F_OUT(10),.F_IN(100)) DUT2 (.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out_2)); 
clock_divider_par #(. F_OUT(1),.F_IN(100)) DUT3 (.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out_3));              
                                      
    always #1 clk_in= ~clk_in;
    initial begin 
            clk_in=1;
            reset=1;
            #10 reset=0;
            
           
            
           
                        

    end
endmodule
