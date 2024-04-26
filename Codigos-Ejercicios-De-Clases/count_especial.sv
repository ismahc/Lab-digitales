module count_especial (

    input logic clk, rst, ctrl;
    output logic [3:0] count;
);

    always @(posedge clk) begin
        if (rst) begin
            count <= 4'b0000;
        end else if (ctrl) begin
            count <= count + 1;
        end
    end

endmodule