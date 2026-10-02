`timescale 1ns / 1ps

module Comparador(
    input [7:0] sgn,
    input [7:0] rampa,
    output pwm
    );
    
    assign pwm = (sgn > rampa);
    
endmodule
