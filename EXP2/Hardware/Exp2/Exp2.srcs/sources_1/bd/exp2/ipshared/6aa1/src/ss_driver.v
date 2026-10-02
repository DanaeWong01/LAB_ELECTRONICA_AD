`timescale 1ns / 1ps

module ss_driver(
    input [1:0] sw,
    output reg [15:0] display  // La representación BCD de la frecuencia del seno
    );
    
    // constantes de bcd para cada frecuencia
    parameter f_220 = 16'h0220;
    parameter f_391 = 16'h0391;
    parameter f_554 = 16'h0554;
    parameter f_739 = 16'h0739;
    
    always @(sw) begin
        case(sw)
            2'b00: display <= f_220;
            2'b01: display <= f_391;
            2'b10: display <= f_554;
            2'b11: display <= f_739;
        endcase
    end
endmodule
