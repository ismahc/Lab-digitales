`timescale 1ns / 1ps

module semaforo(
    input logic clk,reset,TA,TB,
    output logic [2:0] LA,LB
    );
    
    localparam Yellow = 3'b001;
    localparam Red = 3'b010;
    localparam Green = 3'b100;
    
    enum logic [3:0] {S0, S1, S2, S3} state, Next_state;
    
    always_ff @(posedge clk) begin 
        if (reset)
            state <= S0;
        else 
            state <= Next_state;
    end
    
    always_comb begin 
        case(state)
            S0: begin 
                if (TA)
                    Next_state = S0;
                else 
                    Next_state = S1;
            end
            S1: Next_state = S2;
            S2: begin 
                if (TB)
                    Next_state = S2;
                else 
                    Next_state = S3;
            end
            S3: Next_state = S0;
            default: Next_state = S0;
        endcase
    end
    
    always_comb begin 
        case (state)
            S0: begin 
                LA = Green;
                LB = Red;
            end
            S1: begin 
                LA = Yellow;
                LB = Red;
            end
            S2: begin 
                LA = Red;
                LB = Green;
            end
            S3: begin 
                LA = Red;
                LB = Yellow;
            end
        endcase 
     end          
endmodule
