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
    
    parameter IDLE  = 3'b000;
    parameter WAIT  = 3'b001;
    parameter RX    = 3'b010;
    parameter STOP  = 3'b011;
    parameter SEND  = 3'b100;
    parameter N     = 8; // Para contar los bits recibidos
    
    reg [2:0] state = IDLE;
    reg reset_uart_clk = 0;
    reg [7:0] mensaje = 8'b00000000;
    reg prev_clk_uart;
    reg [3:0] cuenta_bit = 4'b0000;
    
    always @(posedge(clk)) begin
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
                        state <= STOP;
                    end
                    else begin
                        cuenta_bit <= cuenta_bit + 1;
                    end
                end
            end
            STOP: begin
                if (clk_uart && !prev_clk_uart) begin
                    if (rx) begin
                        state <= SEND;
                    end
                    else state <= IDLE;
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
