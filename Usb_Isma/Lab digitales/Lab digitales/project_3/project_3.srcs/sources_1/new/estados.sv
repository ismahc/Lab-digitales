`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2023 12:37:36
// Design Name: 
// Module Name: estados
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


module estados(
    input logic  clk, reset,
    input logic Enter_pulse, Undo_pulse,
    
    output logic [12:0] Status,
    output logic LoadOpA, LoadOpB, LoadOpC,LoadOpD,LoadOpE,LoadOpF,LoadOpG,
    output logic ToDisplaySel, updateRes);
    
    enum logic [14:0] {Entering_OpA, Load_OpA, Entering_OpB, Load_OpB, Entering_OpC, Load_OpC,Entering_OpD,Load_OpD,Entering_OpE,Load_OpE,Entering_OpF,Load_OpF,Entering_OpG, Load_OpG, Show_Result} state, next_state,under_state;
    
    
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
            Load_OpB: next_state = Entering_OpC;     
            Entering_OpC: begin 
                if (Enter_pulse)
                    next_state = Load_OpC;
                else if (Undo_pulse)
                    next_state = Entering_OpB;
                else 
                    next_state = Entering_OpC;
            end 
            Load_OpC: next_state = Entering_OpD;
            Entering_OpD: begin 
                if (Enter_pulse)
                    next_state = Load_OpD;
                else if (Undo_pulse)
                    next_state = Entering_OpC;
                else 
                    next_state = Entering_OpD;
            end
            Load_OpD: next_state = Entering_OpE;
            Entering_OpE: begin 
                if (Enter_pulse)
                    next_state = Load_OpE;
                else if (Undo_pulse)
                    next_state = Entering_OpD;
                else 
                    next_state = Entering_OpE;
            end
            Load_OpE: next_state = Entering_OpF;
            Entering_OpF: begin 
                if (Enter_pulse)
                    next_state = Load_OpF;
                else if (Undo_pulse)
                    next_state = Entering_OpE;
                else 
                    next_state = Entering_OpF;
            end
            Load_OpF: next_state = Entering_OpG;
            Entering_OpG: begin 
                if (Enter_pulse)
                    next_state = Load_OpG;
                else if (Undo_pulse)
                    next_state = Entering_OpF;
                else 
                    next_state = Entering_OpG;
            end
            Load_OpF: next_state = Show_Result;
            
            Show_Result: begin 
                if (Enter_pulse)
                    next_state = Entering_OpA;
                else if (Undo_pulse)
                    next_state = Entering_OpG;
                else 
                    next_state =Show_Result;
            end 
            default: next_state = Entering_OpA;         
       endcase
    end
    
    
    always_comb begin 
        LoadOpA = 0;
        LoadOpB = 0;
        LoadOpC = 0;
        LoadOpD = 0;
        LoadOpE = 0;
        LoadOpF = 0;
        LoadOpG = 0;
        ToDisplaySel = 1;
        updateRes = 0;
        case (state)
            Entering_OpA: begin
                Status = 4'b0000;//0
                
            end
            Load_OpA: begin
                Status = 4'b0001;//1
                LoadOpA = 1;    
            end
            Entering_OpB: begin
                Status = 4'b0010;//2
            end
            Load_OpB: begin
                Status = 4'b0011;//3
                LoadOpB = 1;           
            end
            Entering_OpC: begin
                Status = 4'b0100;//4
            end
            Load_OpC: begin
                Status = 4'b0101;//5
                LoadOpC = 1;
            end      
            Entering_OpD: begin
                Status = 4'b0110;//6
            end
            Load_OpD: begin
                Status = 3'b0111;//7
                LoadOpA = 1;    
            end
            Entering_OpE: begin
                Status = 4'b1000;//8
            end
            Load_OpE: begin
                Status = 4'b1001;//9
                LoadOpA = 1;    
            end
            Entering_OpF: begin
                Status = 4'b1010;//10
            end
            Load_OpF: begin
                Status = 4'b1011;//11
                LoadOpA = 1;    
            end
            Entering_OpG: begin
                Status = 4'b1100;//12
            end
            Load_OpG: begin
                Status = 4'b1101;//13
                LoadOpA = 1;
            end
            Show_Result: begin
                Status = 4'b1110;//14
                ToDisplaySel = 0;
                updateRes = 1;
            end 
            default: Status = 3'b000;  
        endcase      
        end 
        
        
endmodule
