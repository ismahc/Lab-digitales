`timescale 1ns / 1ps

module unsigned_to_bcd
(
	input  logic 		clk, 	 // Reloj
				      reset,   // Reset
	input  logic 	trigger, // Inicio de conversión
	input  logic [31:0] 	in,      // Número binario de entrada
	output logic  		idle,    // Si vale 0, indica una conversión en proceso
	output logic [31:0] 	bcd 	 // Resultado de la conversión
);

	
	 
	localparam COUNTER_MAX = 32;
	
	(* fsm_encoding = "one_hot" *) enum logic [2:0] {S_IDLE, S_SHIFT, S_ADD3} state, state_next;

	logic [31:0] shift, shift_next;
	logic [31:0] bcd_next;
	logic [5:0] counter, counter_next; /* Contador 6 bit para las iteraciones */

	always_comb begin
		{state_next, shift_next, bcd_next, counter_next} = {state, shift, bcd, counter};
		idle = 1'b0; 

		case (state)
		S_IDLE: begin
			counter_next = 'd1;
			shift_next = 'd0;
			idle = 1'b1;
			if (trigger) begin
				state_next = S_SHIFT;
			end
		end
		S_ADD3: begin
			
			if (shift[31:28] >= 5)
				shift_next[31:28] = shift[31:28] + 4'd3;

			if (shift[27:24] >= 5)
				shift_next[27:24] = shift[27:24] + 4'd3;

			if (shift[23:20] >= 5)
				shift_next[23:20] = shift[23:20] + 4'd3;

			if (shift[19:16] >= 5)
				shift_next[19:16] = shift[19:16] + 4'd3;

			if (shift[15:12] >= 5)
				shift_next[15:12] = shift[15:12] + 4'd3;

			if (shift[11:8] >= 5)
				shift_next[11:8] = shift[11:8] + 4'd3;

			if (shift[7:4] >= 5)
				shift_next[7:4] = shift[7:4] + 4'd3;

			if (shift[3:0] >= 5)
				shift_next[3:0] = shift[3:0] + 4'd3;

			state_next = S_SHIFT;
		end
		S_SHIFT: begin
			
			shift_next = {shift[30:0], in[COUNTER_MAX - counter_next]};

			if (counter == COUNTER_MAX) begin
				bcd_next = shift_next;
				state_next = S_IDLE;
			end else
				state_next = S_ADD3;

			
			counter_next = counter + 'd1;
		end
		default: begin
			state_next = S_IDLE;
		end
		endcase
	end

	always @(posedge clk) begin
		if(!reset) begin
			{shift, bcd, counter} <= 'd0;
			state <= S_IDLE;
		end
		else
			{state, shift, bcd, counter} <= {state_next, shift_next, bcd_next, counter_next};
	end

endmodule
