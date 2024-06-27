`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 21:23:23
// Design Name: 
// Module Name: S9_actividad2
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

`timescale 1ns / 1ps

module S9_actividad3(
 input logic clk,
 input logic reset,
 input logic Enter, Undo,
 input logic [15:0] DataIn,
 
 //output logic [15:0] ToDisplay,
 output logic [4:0] Flags,
 output logic [2:0] Status,
 output logic [7:0] Anodes,
 output logic [6:0] Segments // Only segments, do not consider the decimal point
 );
 
 logic Enter_pulse;
 logic OpA, OpB, OpCode;
 logic updateRes;
 logic [15:0] Result_Alu;
 logic ToDisplaySel;
 logic Undo_pulse;
 
 logic [31:0] ToDisplay;

 
 
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
                                    
 S8_actividad2  Sistema_ALU (.clk(clk),
                            .reset(reset),
                            .data_in(DataIn),
                            .load_A(OpA),
                            .load_B(OpB),
                            .load_Op(OpCode),
                            .updateRes(updateRes),
                            .LEDs(Flags),
                            .Result_Alu(Result_Alu));                          
  
  Display   #(.N(32)) Display_Selector(.Alu_result(Result_Alu),
                            .DataIN(DataIn),
                            .Todisplaysel(ToDisplaySel),
                            .ToDisplay(ToDisplay)
                            );
                            
  //logic [31:0] ToDisplay = {16'b0000000000000000,ToDisplay1};
  
  S4_actividad1 Hex_to_sevenseg (.clock(clk), .reset(reset), .HEX_in(ToDisplay), .segments (Segments), .anodes(Anodes));

   
endmodule