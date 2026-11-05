`timescale 1ns / 1ps

module gen_frecuencias(
    input clk,
    input rst,
    input clkdiv,
    input [6:0] salto_entero, //tamaño 7 bits para saltos hasta 128, pues el máximo es de 63)
    input [6:0] salto_decimal, // parte decimal del salto, tamaño 7 bits
  
    output reg [8:0] posicion //9 bits para tener 512 posiciones
    );
    // acumulación de la parte fraccionaria de los saltos
    reg [6:0] decimal_ac;
    // acumula la suma de los decimales de los saltos
    wire [7:0] acumulador;
    // define el acumulador como la suma de la parte fraccionaria del salto mas el salto decimal
    assign acumulador = {1'b0, decimal_ac}+{1'b0, salto_decimal};
    
    
    
    // sincronizo clkdiv con clk para evitar errores de sincronización con bloques siguientes 
    reg clkdiv_prev;
    reg clkdiv_sync;
     
    
    always @(posedge clk) begin
        if (rst) begin
            clkdiv_prev <= 1'b0;
            clkdiv_sync <= 1'b0;
        end
        else begin
            clkdiv_prev <= clkdiv_sync;
            clkdiv_sync <= clkdiv;
        end
    end
    
    wire clkdiv_posedge;

    assign clkdiv_posedge = !clkdiv_prev && clkdiv_sync;
    
    
    
    
    
    always @(posedge clk) begin
        if (rst) begin
            posicion <= 9'd0;
            decimal_ac <= 7'd0;
        end
        else if (clkdiv_posedge) begin
            if (acumulador >= 8'd100) begin
                posicion <= posicion + salto_entero + 1'b1;
                decimal_ac <= acumulador - 8'd100;
            end
        
            else begin
                posicion <= posicion + salto_entero;
                decimal_ac <= acumulador;
            end
        end
    end
endmodule
