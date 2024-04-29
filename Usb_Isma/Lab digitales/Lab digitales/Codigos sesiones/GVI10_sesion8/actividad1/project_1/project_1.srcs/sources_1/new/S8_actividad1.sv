`timescale 1ns / 1ps

module S8_actividad1 #(
 parameter N_DEBOUNCER = 10
 )(
 input logic clk,
             resetN,
             Enter,
             Undo,
             DisplayFormat,
 input logic [15:0] DataIn,
 
 output logic [6:0] Segments,
 output logic [7:0] Anodes,
 output logic [4:0] Flags,
 output logic [2:0] Status);
 
 logic Enter_pulse,  Undo_pulse;
 logic pressed_pulse, released_pulse;
 logic pressed_pulse1, released_pulse1;
 logic OpA, OpB, OpCode;
 logic updateRes;
 logic [15:0] Result_Alu;
 logic ToDisplaySel;
 logic [15:0] ToDisplay;
 logic [7:0] AN;
 
 
 PB_Debouncer  #(N_DEBOUNCER) Debouncer_enter(.clk(clk),
                                              .rst(resetN),
                                              .PB(Enter),
                                              .PB_pressed_pulse(Enter_pulse),
                                              .PB_pressed_status(pressed_pulse),
                                              .PB_released_pulse(released_pulse));
 PB_Debouncer  #(N_DEBOUNCER) Debouncer_undo(.clk(clk),
                                              .rst(resetN),
                                              .PB(Undo),
                                              .PB_pressed_pulse(Undo_pulse),
                                              .PB_pressed_status(pressed_pulse1),
                                              .PB_released_pulse(released_pulse1)); 
                                              

                                                           
 ReversePolishFSM  ReversePolishFSM (.clk(clk),
                                    .reset(resetN),
                                    .Enter_pulse(Enter_pulse),
                                    .Undo_pulse(Undo_pulse),
                                    .Status(Status),
                                    .LoadOpA(OpA),
                                    .LoadOpB(OpB),
                                    .LoadOpCode(OpCode),
                                    .ToDisplaySel(ToDisplaySel),
                                    .updateRes(updateRes));
                                    
 S6_Actividad1  Sistema_ALU (.clk(clk),
                            .reset(resetN),
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
                           .reset(resetN),
                           .HEX_in(ToDisplay),
                           .segments(Segments),
                           .anodes(AN));
    
   assign Anodes = AN;
 endmodule