`timescale 1ns / 1ps

module testreg();
    // Parámetros
    localparam N = 8;
    
    // Señales de entrada
    logic clk;
    logic reset;
    logic load;
    logic [N-1:0] D;
    
    // Señales de salida
    logic [N-1:0] Q;
    
    // Instancia del módulo
    reg_param #(N) dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .D(D),
        .Q(Q)
    );
    
    // Generación de señales de prueba
    initial begin
        clk = 0;
        reset = 0;
        load = 0;
        D = 'b0;
        
        #5 reset = 1;
        #10 reset = 0;
        
        #5 load = 1;
        #5 D = 'b10101010;
        #10 load = 0;
        
        #20 D = 'b000001;
        
        
        // Agregar aquí más casos de prueba según sea necesario
        
        // Terminar la simulación
    end
    
    // Generación de clock
    always begin
        #5 clk = ~clk;
    end
endmodule

