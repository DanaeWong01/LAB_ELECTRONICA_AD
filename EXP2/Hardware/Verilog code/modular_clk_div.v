`timescale 1ns / 1ps

module modular_clk_div #(parameter N=8)(
        input clk,
        input rst,
        output reg clk_div
    );
    
    // Hago un contador con suficientes bits para representar el parametro
    reg [$clog2(N)-1:0] count;
    
    always @(posedge(clk) or posedge(rst)) begin
        if (rst) begin
            count <= 0;
            clk_div <= 0;
        end
        else if (count >= N-1) begin
            count <= 0;
            clk_div = ~clk_div;
        end
        else count <= count+1;
    end
    
endmodule
