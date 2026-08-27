`timescale 1ns / 1ps

module selector_voltaje(
    input [15:0] voltaje_adc,
    input [15:0] voltaje_in,
    input switch,
    output [3:0] decena,
    output [3:0] unidad,
    output [3:0] decima,
    output [3:0] centec
    );    
    
    assign decena = switch ? (voltaje_adc[15:12]) : (voltaje_in[15:12]);
    assign unidad = switch ? (voltaje_adc[11:8]) : (voltaje_in[11:8]);
    assign decima = switch ? (voltaje_adc[7:4]) : (voltaje_in[7:4]);
    assign centec = switch ? (voltaje_adc[3:0]) : (voltaje_in[3:0]);    
    
endmodule
