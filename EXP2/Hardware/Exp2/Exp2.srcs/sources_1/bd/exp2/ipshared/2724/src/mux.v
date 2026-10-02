`timescale 1ns / 1ps


module mux(
    input [7:0] sen,
    input [7:0] esp,
    input sw_sgnl,
    output [7:0] sgnl
    );
    
    assign sgnl = sw_sgnl ? sen:esp;
    
endmodule
