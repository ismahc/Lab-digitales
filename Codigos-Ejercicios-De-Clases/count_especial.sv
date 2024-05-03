module count_especial (

    input logic clk, rst, ctrl;
    output logic [3:0] count;
);
    logic [3:0] count_aux, count_next;

    always_ff @(posedge clock ) 
        count <= count_next;

    always_comb begin
        case (rst)
            1'b1: count_next = 4'b0;
            default: count_next = count_aux;
        endcase
    end


    //recordar que se puede hacer el mux de esta manera (no trivial)
    assign count_aux (ctrl == 1'b1)? count + 4'd2 : count + 4'b1; 
    //

endmodule