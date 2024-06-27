`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 23:08:41
// Design Name: 
// Module Name: registro
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


module registro(
    input logic D, clk, reset, load,
    output logic Q
    );
    
    logic Q_temp;
    
    always_ff@(posedge clk)

            Q <=  Q_temp;
            
    always_comb
        if (reset) begin
        
            Q_temp = 'b0;
        end 
             
        else begin
            if (load) begin
                Q_temp = Q;
            end
            
            else begin
                Q_temp = D;
            end
        end    
        
endmodule
