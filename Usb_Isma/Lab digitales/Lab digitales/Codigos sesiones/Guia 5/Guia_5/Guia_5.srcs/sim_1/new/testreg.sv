`timescale 1ns / 1ps

module testreg();
    // Par�metros
    localparam N = 8;
    
    // Se�ales de entrada
    logic clk;
    logic reset;
    logic load;
    logic [N-1:0] D;
    
    // Se�ales de salida
    logic [N-1:0] Q;
    
    // Instancia del m�dulo
    reg_param #(N) dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .D(D),
        .Q(Q)
    );
    
    // Generaci�n de se�ales de prueba
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
        
        
        // Agregar aqu� m�s casos de prueba seg�n sea necesario
        
        // Terminar la simulaci�n
    end
    
    // Generaci�n de clock
    always begin
        #5 clk = ~clk;
    end
endmodule

