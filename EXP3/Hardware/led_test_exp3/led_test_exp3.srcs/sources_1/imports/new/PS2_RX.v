`timescale 1ns / 1ps
// Módulo recibe la lectura de ps2


module PS2_RX(
    input ps2c,
    input ps2d,
    input clk,
    input rst,
    output reg [7:0] msg, // Sacamos el mensaje recibido, sea tecla o mensaje de detención
    output reg msg_ready
    );
    
    parameter IDLE  = 3'b000; // esperamos negedge ps2c
    parameter LECT  = 3'b001; // leemos 8 bits
    parameter PAR   = 3'b010; // leemos paridad
    parameter STOP  = 3'b011; // leemos el stop
    parameter SEND  = 3'b100; // enviamos mensaje
    parameter N     = 8; // Para contar los bits recibidos
    
    reg [2:0] state = IDLE;          // estado inicial idle
    reg [7:0] shift_reg = 8'h00;     // reg de bits rx
    reg [3:0] cuenta_bit = 4'b0000;  // contador de bits rx
    wire es_impar;
    
    paridad check_par(
        .msg(shift_reg),
        .paridad(ps2d),
        .ans(es_impar)
    );
    
    
    // sincronizo ps2c con clk para evitar errores de sincronización con bloques siguientes 
    reg ps2c_sync;
    reg ps2c_prev;
    
    always @(posedge clk) begin
        if (rst) begin
            ps2c_sync <= 1'b1;
            ps2c_prev <= 1'b1;
        end
        else begin
            ps2c_prev <= ps2c_sync;
            ps2c_sync <= ps2c;
        end
    end
    
    wire ps2c_negedge;

    assign ps2c_negedge = ps2c_prev && !ps2c_sync;
    
    
    always @ (posedge(clk)) begin
        msg_ready <= 1'b0;
        if (rst == 1) begin
            state      <= IDLE;
            shift_reg  <= 0;
            cuenta_bit <= 0;
            msg        <= 0;
            msg_ready  <= 0;
        end
        else if (ps2c_negedge) begin
            
            case (state)
            
                IDLE: begin
                    //msg_ready <= 1'b0;
                    
                    if (ps2d == 0) begin
                        state <= LECT;
                        cuenta_bit <= 0;
                    end
                end
                
                LECT: begin
                    shift_reg <= {ps2d, shift_reg[7:1]};
    
                    if (cuenta_bit == N-1) begin
                        state <= PAR;
                        cuenta_bit <= 0;
                    end
                    else begin
                        cuenta_bit <= cuenta_bit + 1;
                    end
                end
                
                PAR: begin                
                    if (es_impar) begin
                        state <= STOP;
                    end
                    else begin
                        state <= IDLE;
                        msg <= 0;
                        cuenta_bit <= 0;
                    end
                end
                
                STOP: begin
                    if (ps2d) begin
                            msg <= shift_reg;
                            msg_ready <= 1'b1;
                        end
                    
                        state <= IDLE;
                        cuenta_bit <= 0;
                end
            
            endcase
        end   
    end
    
    
    
endmodule


module paridad(
    input [7:0] msg,
    input paridad,
    output ans
);

    assign ans = ^( {msg, paridad} );

endmodule