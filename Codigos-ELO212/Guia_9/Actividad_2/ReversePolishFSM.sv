`timescale 1ns / 1ps

module ReversePolishFSM(
    input logic  clk, reset,
    input logic Enter_pulse, Undo_pulse,
    
    output logic [2:0] Status,
    output logic LoadOpA, LoadOpB, LoadOpCode,
    output logic ToDisplaySel, updateRes);
    
    enum logic [6:0] {Entering_OpA, Load_OpA, Entering_OpB, Load_OpB, Entering_OpCode, Load_OpCode, Show_Result} state, next_state,under_state;
    
    
    always_ff @ (posedge clk)
    begin
        if (reset)
            state <= Entering_OpA;
        else 
            state <= next_state;       
    end
    
   
   //polaca
    always_comb begin 
       case (state)
            Entering_OpA: begin 
                if (Enter_pulse)
                    next_state = Load_OpA;
                else 
                    next_state = Entering_OpA ;
            end
            Load_OpA: next_state = Entering_OpB;
            Entering_OpB: begin 
                if (Enter_pulse)
                    next_state = Load_OpB;
                else if (Undo_pulse)
                    next_state = Entering_OpA;
                else 
                    next_state = Entering_OpB;
            end
            Load_OpB: next_state = Entering_OpCode;     
            Entering_OpCode: begin 
                if (Enter_pulse)
                    next_state = Load_OpCode;
                else if (Undo_pulse)
                    next_state = Entering_OpB;
                else 
                    next_state = Entering_OpCode;
            end 
            Load_OpCode: next_state = Show_Result;
            Show_Result: begin 
                if (Enter_pulse)
                    next_state = Entering_OpA;
                else if (Undo_pulse)
                    next_state = Entering_OpCode;
                else 
                    next_state =Show_Result;
            end 
            default: next_state = Entering_OpA;         
       endcase
    end
    
    
    always_comb begin 
        LoadOpA = 0;
        LoadOpB = 0;
        LoadOpCode = 0;
        ToDisplaySel = 1;
        updateRes = 0;
        case (state)
            Entering_OpA: begin
                Status = 3'b000;
            end
            Load_OpA: begin
                Status = 3'b001;
                LoadOpA = 1;    
            end
            Entering_OpB: begin
                Status = 3'b010;
            end
            Load_OpB: begin
                Status = 3'b011;
                LoadOpB = 1;           
            end
            Entering_OpCode: begin
                Status = 3'b100;
            end
            Load_OpCode: begin
                Status = 3'b101;
                LoadOpCode = 1;  
                
            end
            Show_Result: begin
                Status = 3'b110;
                ToDisplaySel = 0;
                updateRes = 1;
            end 
            default: Status = 3'b000;  
        endcase      
        end 
        
        
endmodule
