`timescale 1ns / 1ps

module S7_actividad3(
 input logic clk,
 input logic reset,
 input logic Enter, Undo,
 input logic [15:0] DataIn,
 
 output logic [6:0] Segments,
 output logic [7:0] Anodes,
 output logic [4:0] Flags,
 output logic [2:0] Status);
 
 logic Enter_pulse;
 logic OpA, OpB, OpCode;
 logic updateRes;
 logic [15:0] Result_Alu;
 logic ToDisplaySel;
 logic Undo_pulse;
 logic [15:0] ToDisplay;
 logic [7:0] AN;
 
 
 edge_detector  Level_to_Pulse (.clk(clk),
                               .reset(reset),
                               .L(Enter),
                               .P(Enter_pulse));
                               
 edge_detector  Level_to_Pulse_1 (.clk(clk),
                                .reset(reset),
                                .L(Undo),
                                .P(Undo_pulse));                        
 
 ReversePolishFSM  ReversePolishFSM (.clk(clk),
                                    .reset(reset),
                                    .Enter_pulse(Enter_pulse),
                                    .Undo_pulse(Undo_pulse),
                                    .Status(Status),
                                    .LoadOpA(OpA),
                                    .LoadOpB(OpB),
                                    .LoadOpCode(OpCode),
                                    .ToDisplaySel(ToDisplaySel),
                                    .updateRes(updateRes));
                                    
 S6_Actividad1  Sistema_ALU (.clk(clk),
                            .reset(reset),
                            .data_in(DataIn),
                            .load_A(OpA),
                            .load_B(OpB),
                            .load_Op(OpCode),
                            .updateRes(updateRes),
                            .LEDs(Flags),
                            .HEX_in(Result_Alu));                          
  
  Display Display_Selector (.Alu_result(Result_Alu),
                            .DataIN(DataIn),
                            .Todisplaysel(ToDisplaySel),
                            .ToDisplay(ToDisplay));
                            
  
  S4_actividad1 NumTo7Seg (.clock(clk),
                           .reset(reset),
                           .HEX_in(ToDisplay),
                           .segments(Segments),
                           .anodes(AN));
    
   assign Anodes = AN;
   
endmodule
