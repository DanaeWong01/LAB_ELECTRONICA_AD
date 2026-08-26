`timescale 1ns / 1ps

module uart_rx(
    input clk,
    input rst,
    input clk_uart,
    input rx,
    output reg [7:0] msg,
    output rst_div,
    output reg msg_ready
    );
    
    parameter IDLE  = 2'b00;
    parameter WAIT  = 2'b01;
    parameter RX    = 2'b10;
    parameter SEND  = 2'b11;
    parameter N     = 8; // Para contar los bits recibidos
    
    reg [1:0] state = IDLE;
    reg reset_uart_clk = 0;
    reg [7:0] mensaje = 8'b00000000;
    reg prev_clk_uart;
    reg [3:0] cuenta_bit = 4'b0000;
    
    always @(posedge(clk) or posedge(rst)) begin
    if (rst == 1) begin
        msg <= 8'b00000000;
        msg_ready <= 1'b0;
    end
        case (state)
            IDLE: begin
                reset_uart_clk <= 0;
                msg_ready <= 1'b0;
            
                if (rx == 0) begin
                    state <= WAIT;
                    reset_uart_clk <= 1;
                end // El estado IDLE espera a que se reciba el bit de start
            end
            WAIT: begin
                reset_uart_clk <= 0;
                
                if (clk_uart && !prev_clk_uart) begin // Esto se activa en el próximo flanco de clk_uart
                    if (rx == 0) begin
                        cuenta_bit <= 0;
                        state <= RX;
                    end
                    else begin
                        state <= IDLE;
                    end
                end
            end
            RX: begin
                if (clk_uart && !prev_clk_uart) begin
                
                    mensaje <= {rx, mensaje[7:1]};

                    if (cuenta_bit == N-1) begin
                        state <= SEND;
                    end
                    else begin
                        cuenta_bit <= cuenta_bit + 1;
                    end
                end
            end
            SEND: begin
                msg <= mensaje;
                msg_ready <= 1'b1;
                state <= IDLE;
            end
        endcase 
    
    prev_clk_uart <= clk_uart;
    end 
    
    
    assign rst_div = reset_uart_clk;
    
endmodule
