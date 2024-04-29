`timescale 1ns / 1ps



module test_clock_2();
    logic clk_in, reset;
    logic clk_out, clk_out_1, clk_out_2,clk_out_3;
    
clock_divider_par #(.f_out(50_000_000)) DUT(.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out));
clock_divider_par #(.f_out(30_000_000)) DUT1(.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out_1)); 
clock_divider_par #(.f_out(10_000_000)) DUT2(.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out_2)); 
clock_divider_par #(.f_out(1)) DUT3(.clk_in(clk_in),
                     .reset(reset),
                     .clk_out(clk_out_3));              
                                      
    always #1 clk_in= ~clk_in;
    initial begin 
            clk_in=1;
            reset=1;
            #10 reset=0;
            
           
            
           
                        

    end
endmodule
