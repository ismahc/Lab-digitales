`timescale 1ns / 1ps


module test_nose();

  // Parámetros
  localparam real CLK_PERIOD = 10; // Período de la señal de reloj en ns

  // Señales
  logic clk;
  logic reset;
  logic trigger;
  logic [31:0] in;
  logic idle;
  logic [31:0] bcd;

  // Instancia del módulo a probar
  unsigned_to_bcd dut (
    .clk(clk),
    .reset(reset),
    .trigger(trigger),
    .in(in),
    .idle(idle),
    .bcd(bcd)
  );

  // Generación de la señal de reloj
  always #5 clk = ~clk;
  

  // Estímulo
  initial begin
    clk = 0;
    reset = 1;
    trigger = 0;
    in = 0;
    
    #20 reset = 0;
        in = 32'h0;
    
    #40 in = 32'hf;
        trigger = 1;
        
        
    #100 trigger = 0;
    #50 in = 32'h3;    
  end

endmodule