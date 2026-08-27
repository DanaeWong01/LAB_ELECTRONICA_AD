`timescale 1ns / 1ps

module receptor_msg(
    
    input clk,
    input rst,
    input clk_uart,
    input rx,
    output reg [15:0] v_adc,
    output reg [15:0] v_in,
    output rst_div,
    output msg_ready,
    output [7:0] msg
    
    );
    
    parameter IDLE  = 2'b00;
    parameter RX    = 2'b01;
    parameter SEND  = 2'b10;
    
    reg [1:0] state = IDLE;
    reg [7:0] d_u_vadc; // Decenas y unidades del voltaje de adc
    reg [7:0] d_c_vadc; // Décimas y centésimas del voltaje de adc
    reg [31:0] str_mensaje = 32'h00000000; // Registro de shift para guardar el mensaje entero mientras llega
    reg [2:0] cuenta; // Cuenta la cantidad de mensajes UART recibidos (para recibir 4 paquetes y mandar)
    
    // Leo lo que entrega el UART
    uart_rx comp1(clk, rst, clk_uart, rx, msg, rst_div, msg_ready);
    
    always @(posedge(clk)) begin
        if(rst==1) begin
            // Si se reinicia enviamos 0 a la salida, reiniciamos el mensaje, volvemos a estado IDLE y reseteamos la cuenta
            v_adc <= 16'b0000000000000000;
            v_in  <= 16'b0000000000000000;
            cuenta <= 3'b000;
            state <= IDLE;
        end
        
        case (state)
            IDLE: begin
                // Solo salgo de IDLE si el mensaje es 0xEE
                if (msg_ready && msg == 8'hEE) begin
                    cuenta <= 3'b000;
                    str_mensaje <= 32'h00000000;
                    state <= RX;
                end
            end
            
            RX: begin
                
                if (msg_ready) begin
                    if (cuenta < 4) begin
                        str_mensaje <= {str_mensaje[23:0], msg};
                        cuenta <= cuenta + 1;
                    end
                    else begin
                        state <= SEND;
                    end
                end 
            end
            
            SEND: begin
                v_adc <= str_mensaje[31:16];
                v_in  <= str_mensaje[15:0];
                
                state <= IDLE;
            end
        endcase
    
    end
    
    // Cada vez que el mensaje está listo, este se agrega al shift reg (a menos q sea el bit de inicio o fin)
    
endmodule
