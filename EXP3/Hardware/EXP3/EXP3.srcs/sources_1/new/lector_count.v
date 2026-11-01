`timescale 1ns / 1ps
// Módulo que entrega los address que leer de la rom según el step que recibe

module lector_count(
    input wire clk,
    input wire rst,
    input wire sample_tick,

    // step multiplicado por 2^16
    input wire [22:0] step_q16,

    output reg [6:0] addr,
    output reg semi_pos
);

    // 9 bits enteros + 16 bits fraccionarios
    reg [24:0] phase_q16;

    wire [8:0] phase_index;

    assign phase_index = phase_q16[24:16];

    // Acumulador de fase
    always @(posedge clk) begin
        if (rst) begin
            phase_q16 <= 0;
        end
        else if (sample_tick) begin
            // Al desbordar los 9 bits enteros,
            // el acumulador vuelve automáticamente a cero.
            phase_q16 <= phase_q16 + {2'b00, step_q16};
        end
    end

    // Conversión de fase a dirección de ROM
    always @(*) begin

        case (phase_index[8:7])

            // Primer cuadrante
            2'b00: begin
                addr = phase_index[6:0];
                semi_pos = 1'b1;
            end

            // Segundo cuadrante
            2'b01: begin
                addr = ~phase_index[6:0];
                semi_pos = 1'b1;
            end

            // Tercer cuadrante
            2'b10: begin
                addr = phase_index[6:0];
                semi_pos = 1'b0;
            end

            // Cuarto cuadrante
            2'b11: begin
                addr = ~phase_index[6:0];
                semi_pos = 1'b0;
            end

        endcase
    end

endmodule    
    
