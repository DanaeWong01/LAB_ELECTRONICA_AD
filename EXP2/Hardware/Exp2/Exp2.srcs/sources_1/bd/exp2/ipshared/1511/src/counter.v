`timescale 1ns / 1ps

module counter(
    input clk_div,
    input rst,
    output reg [7:0] addr
    );
    
    // Recibimos el reloj ya dividido y contamos hasta 255
    always @(posedge(clk_div) or posedge(rst))begin
        if (rst) addr = 0;
        else addr = addr + 1;
    end
    
    
endmodule
