`timescale 1ns / 1ps

module Eight_digit(
        input logic clock, reset, [31:0]HEX_in,
        output logic [6:0]segments, [7:0]anodes
        );
        
        logic [2:0] counter;
        logic [3:0] BCD_4;
        
        
        counter_Nbits contador_3bits(.clock(clock),
                                      .reset(reset),
                                      .counter(counter));
                                      
        Mux_temporal_multi_bits Mux_temporal_multi_bits(.HEX_in(HEX_in),
                                                        .counter(counter),
                                                        .BCD_4(BCD_4));
        Dec_8 Dec_8(.counter(counter),
                    .anodes(anodes));
                    
        BCD_to_sevenSeg BCD_to_sevenSeg(.BCD_in(BCD_4),
                                        .segments(segments));         
       
        
      
endmodule
