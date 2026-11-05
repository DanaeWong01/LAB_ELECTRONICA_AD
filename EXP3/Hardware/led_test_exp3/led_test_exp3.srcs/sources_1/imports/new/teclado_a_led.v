`timescale 1ns / 1ps

module teclado_a_led(
    input clk,
    input rst,
    input [7:0] msg,
    input msg_ready,
    
    output reg [11:0] leds,
    output reg [7:0] tecla_presionada,
    output reg nota_activa
    );

    reg nota_libre;
    
    always @(posedge clk) begin 
        if (rst) begin
            tecla_presionada <= 3'd0;
            nota_activa <= 1'b0;
            nota_libre <= 1'b0;
        end
        else if (msg_ready) begin
            // cuando se suelta una tecla, el teclado envía un mensaje F0 para indicar que se soltó
            // y luego envía nuevamnete la tecla que se soltó
            // si se suelta la tecla, entonces llega un mensaje específico para indicarlo
            if (msg == 8'hF0) begin
                nota_libre <= 1'b1;
            end
            // si se soltó la tecla, entonces
            else if (nota_libre) begin
                nota_libre <= 1'b0;
                if (msg == tecla_presionada) begin
                    nota_activa <= 1'b0; //desactiva la nota que estaba activa
                    tecla_presionada <= 8'd0;
                end
            end
            
            else begin // recibimos una tecla, una nota valida
                if (msg != tecla_presionada) begin
                        nota_activa <= 1'b1; // activo la nota solo si es una nueva
                end
                case (msg)
                        
                        8'h15: begin leds <= 12'b1000_0000_00; tecla_presionada<=msg; end
                        8'h1D: begin leds <= 12'b0100_0000_00; tecla_presionada<=msg; end
                        8'h24: begin leds <= 12'b0010_0000_00; tecla_presionada<=msg; end
                        8'h2D: begin leds <= 12'b0001_0000_00; tecla_presionada<=msg; end
                        8'h2C: begin leds <= 12'b0000_1000_00; tecla_presionada<=msg; end
                        8'h35: begin leds <= 12'b0000_0100_00; tecla_presionada<=msg; end
                        8'h3C: begin leds <= 12'b0000_0010_00; tecla_presionada<=msg; end
                        8'h43: begin leds <= 12'b0000_0001_00; tecla_presionada<=msg; end
                        8'h44: begin leds <= 12'b0000_0000_10; tecla_presionada<=msg; end
                        8'h4D: begin leds <= 12'b0000_0000_01; tecla_presionada<=msg; end
                        
                        8'h1E, 8'h26, 8'h2E, 8'h36,
                        8'h3D, 8'h43, 8'h44, 
                        8'h45, 8'h1A, 8'h1B,
                        8'h22, 8'h23, 8'h21, 8'h2B,
                        8'h2A: begin
                            tecla_presionada <= msg;
                            leds <= 12'b0000_0000_0000;
                        end
                        default: begin
                            tecla_presionada <= 8'd0;
                            leds <= 12'b0000_0000_0000;
                        end
                endcase
            end
        end
    end
endmodule
