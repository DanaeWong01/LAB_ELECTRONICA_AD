`timescale 1ns / 1ps
// Módulo genera la señal de salida según lo que le llega de la memoria y el indicador del semiciclo actual
// se encarga de generar el seno a partir de los datos en memoria
module sinusoide(
    //entradas
    input clk,
    input rst,
    input nota_activa,
    input [8:0] posicion, //posicion entregada desde el gen de frecuencias
    input [7:0] ROM_data, //señal para el dato en la rom
    
    output reg [6:0] ROM_addr, // es la direccion misma a la que accedemos de la ROM
    output reg [7:0] wave
    );
    
    
    // revisamos la direccion de la rom
    // Determina la direccion a la que accederemos de la ROM
    always@(*) begin
        if (posicion[7])
            ROM_addr = ~posicion[6:0];
        else
            ROM_addr = posicion[6:0];
    end
    
    reg semi_pos_c1; // Detecta el ciclo de reloj en que pasamos al otro semiciclo
    reg semi_pos_c2; // Detecta el ciclo inmediatamente posterior al anterior
    // Esto es necesario ya que la ROM tiene un delay de un ciclo para leer el nuevo dato
    // al triggerear el cambio de semiciclo un período de clock más tarde aseguramos que tengamos continuidad
    
    always @(posedge clk) begin
        if (rst) begin
            semi_pos_c1 <= 1'b1;
            semi_pos_c2 <= 1'b1;
        end
        else begin
            semi_pos_c1 <= ~posicion[8];
            semi_pos_c2 <= semi_pos_c1;
        end
    end
    
    // generamos la sinusoide completa con los datos en las direcciones de la ROM
    always @(posedge clk) begin
        if (rst)
            wave <= 8'd128;
        else if (!nota_activa)
            wave <= 8'd128;
        else begin
            if (semi_pos_c2)
                wave <= ROM_data;
            else 
                wave <= 8'd256 - ROM_data;
        end

    end 

endmodule
