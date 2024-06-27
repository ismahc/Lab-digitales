`timescale 1ns / 1ps
module test_alu_reg();
    logic [15:0] data_in;
    logic load_A, load_B, load_Op, clk,reset,updateRes;
    logic [6:0]Segments;
    logic [7:0]Anodes;
    logic [4:0]LEDs;
    
    alu_reg #(.N(16)) DUT (.data_in(data_in),
                           .load_A(load_A),
                           .load_B(load_B),
                           .load_Op(load_Op),
                           .clk(clk),
                           .reset(reset),
                           .updateRes(updateRes),
                           .Segments(Segments),
                           .Anodes(Anodes),
                           .LEDs(LEDs));
                           
    always #10 clk = ~clk;
   
    
    initial begin 
    data_in = 16'h20;
    clk = 0 ;
    reset = 1;
    load_A = 0;
    load_B = 0;
    load_Op= 1;
    updateRes = 1;
    

    
    #30 reset = 0;


    #20 data_in = 16'h17;
        load_A = 1;
        
    #10 load_A = 0;
        
    #30 data_in = 16'h25;
        load_B = 1;
        
    #10 load_B = 0;
    
    #30 load_A = 1;
        data_in = 16'h39;
  
    #10 load_A = 0;
       
    #30 load_B = 1;
        data_in = 16'h40;
        
    #10 load_B = 0;
    
    #30  load_A = 1;
         data_in = 16'h87;
         
    #10 load_A = 0;
    
    #30 data_in = 16'h95;
        load_B = 1;
        
    #10 load_B = 0;
    
    #30 load_A = 1;
        data_in = 16'h3;
  
    #10 load_A = 0;
       
    #30 load_B = 1;
        data_in = 16'h32;
        
    #10 load_B = 0;
    
    #30  load_A = 1;
         data_in = 16'h16;
         
    #10 load_A = 0;

   
    end   
endmodule
