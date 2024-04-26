module S4_actividad2 #(parameter N = 32)(
	input  logic            clock, reset,
	input  logic            dec, enable, load,
	input  logic [N-1:0]    Load_Ref_value,
	output logic [N-1:0]    counterN,
	output logic            threshold
    	);
    
	
	
	
	 //Para la comparacion de threshold se usara un modulo always_ff diferente al de las condiciones anteriore.
    //Esto ya que su comporamiento no depende de ninguna de las demas señales y no esta sujeto a la prioridad pedida en el circuito.

	

	
	//Se evaluan las condiciones de las demas entradas
	
	
	always_ff @(posedge clock  ) begin
		if (reset==1) //prioridad 1
			counterN <= 0;
			
		else //entra a enable
		    if (enable==1)//entra a dec
		    
			     if (dec == 1) //resta 1
			         counterN <= counterN-1;
			     else //dec == 0 suma 1
			         counterN <= counterN+1;
			else //si enable es 0 entra a load 
			     if (load == 1)
			         counterN <= Load_Ref_value;
                 else 
                 // si load == 0 sigue con  las demas instrucciones. 
                 //En este caso solo pasara a mantener el valor actual de counterN

                 counterN <= counterN;
                 
            //se terminan las condiciones
                 
           //se entrega el resultado de counterN a la salida.      
               
               
	end


	always_ff @(posedge clock  ) begin
    
           if (counterN <= Load_Ref_value)
           
                 threshold <= 0;
                 
           else
           
                 threshold <=1; 

    end
endmodule  
    


