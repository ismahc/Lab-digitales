`timescale 1ns / 1ps

module debouncer_testbench();
  
    // We need to give values at the inputs, so we define them as registers  
	logic clk, rst, PB;
	logic PB_pressed_status_FSM, PB_pressed_pulse_FSM, PB_released_pulse_FSM;
	
	
	PB_Debouncer DUT_FSM(
        .clk                (clk),
        .rst                (rst),
        .PB                 (PB),
        .PB_pressed_status  (PB_pressed_status_FSM),
        .PB_pressed_pulse   (PB_pressed_pulse_FSM),
        .PB_released_pulse  (PB_released_pulse_FSM)
        );
        
            
	// generate a clock signal that inverts its value every five time units
	always  #1 clk=~clk;
	
	//here we assign values to the inputs
	initial begin
		clk = 1'b0;
		rst = 1'b0;
		PB = 1'b0;
		#60 rst = 1'b1;
        #30 rst = 1'b0;
		#50 PB = 1'b1;
		#50 PB = 1'b0;
		#50 PB = 1'b1;
		#3  PB = 1'b0;
		#20 PB = 1'b1;
		#80 PB = 1'b0;
	end

endmodule