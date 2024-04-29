`timescale 1ns / 1ps

module clock_divider_par 
#(parameter F_IN = 100, F_OUT = 10)

(
	input  logic clk_in,
	input  logic reset,
	output logic clk_out );

    localparam COUNTER_MAX = F_IN/(2*F_OUT); // aproxima frecuencias no exactas para arriba
    localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
    logic [DELAY_WIDTH-1:0] counter = 'd0;
    
    always_ff @(posedge clk_in) begin
        if (reset == 1'b1) begin
            counter <= 'd0;
            clk_out <= 0;
        end else if (counter == COUNTER_MAX - 1) begin
            counter <= 'd0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 'd1; //(TOUT=N*T_IN*2) => (N=T_OUT/2*T_IN) =>(N=CLK_IN/2*CLK_OUT)
            clk_out <= clk_out;
        end
     end
endmodule
