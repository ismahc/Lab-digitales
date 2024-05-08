`timescale 1ns / 1ps

module test_count_especial();
    input logic clk, rst, ctrl;
    output logic [3:0] count;
    
count_especial DUT(.clk(clk),
                    .rst(rst),
                    .ctrl(ctrl)
                    .count(count));
    always #1 clk= ~clk;
    initial begin 
            clk=0;
            rst=1;
            ctrl=1;
            #10 rst=0;
            #10 rst=1;
            #10 rst=0;
           
            
           
                        

    end
endmodule
