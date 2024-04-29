`timescale 1ns / 1ps

module S4_actividad2 #(parameter N = 32)(
    input  logic            clock, reset,
    input  logic            dec, enable, load,
    input  logic [N-1:0]    Load_Ref_value,
    output logic [N-1:0]    counterN,
	output logic            threshold
    );
    
   logic [N-1:0] next_counter;

   always_ff @(posedge clock) begin
       if (reset)
         counterN <= 0;
       else 
         counterN <= next_counter;
    end 
    
    always_comb begin
        if (load==1)
            next_counter= Load_Ref_value;
        else if (enable==0)
                next_counter = counterN;
                
             else if (dec==1)
                    next_counter = counterN-1;
                  else
                    next_counter = counterN+1; 
                
                    
       if (counterN <= Load_Ref_value)
            threshold = 0;
       else
            threshold =1; 
            
    end                 
    
endmodule

