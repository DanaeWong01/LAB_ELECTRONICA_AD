`timescale 1ns / 1ps
// Módulo genera la señal de salida según lo que le llega de la memoria y el indicador del semiciclo actual

module wave_gen(
    input [7:0] value,
    input semi_pos,
    input clk,
    input rst,
    
    output reg [7:0] wave
    );
    
    
    always @(posedge clk) begin
        if (rst) begin
            wave <= 8'd128;
        end
        else begin
            if (semi_pos)
                wave <= 8'd128 + (value >> 1);
            else
                wave <= 8'd128 - (value >> 1);
        end
    end
endmodule
