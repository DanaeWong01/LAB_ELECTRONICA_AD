`timescale 1ns / 1ps
// este modulo se encarga de reconocer las notas asociadas a cada tecla
// es decir, traducir la tecla a su nota (frecuencia)
module dec_notas(
    input [7:0] tecla_presionada,
    
    output reg [6:0] salto_entero,
    output reg [6:0] salto_decimal
    );
    always @(*) begin
        salto_entero = 7'd0;
        salto_decimal = 7'd0;
        
        //definimos las teclas con sus notas respectivas
        case (tecla_presionada)
        
        //PRIMERA 8VA DE LA ESCALA
            8'h15: begin // Q (DO)
                salto_entero = 7'd16;
                salto_decimal = 7'd74;
            end

            8'h1E: begin // 2 (DO#)
                salto_entero = 7'd17;
                salto_decimal = 7'd74;
            end

            8'h1D: begin // W (RE)
                salto_entero = 7'd18;
                salto_decimal = 7'd79;
            end

            8'h26: begin // 3 (RE#)
                salto_entero = 7'd19;
                salto_decimal = 7'd91;
            end

            8'h24: begin // E (MI)
                salto_entero = 7'd21;
                salto_decimal = 7'd10;
            end

            8'h2D: begin // R (FA)
                salto_entero = 7'd22;
                salto_decimal = 7'd35;
            end

            8'h2E: begin // 5 (FA#)
                salto_entero = 7'd23;
                salto_decimal = 7'd68;
            end

            8'h2C: begin // T (SOL)
                salto_entero = 7'd25;
                salto_decimal = 7'd9;
            end

            8'h36: begin // 6 (SOL#)
                salto_entero = 7'd26;
                salto_decimal = 7'd58;
            end

            8'h35: begin // Y (LA)
                salto_entero = 7'd28;
                salto_decimal = 7'd16;
            end

            8'h3D: begin // 7 (LA#)
                salto_entero = 7'd29;
                salto_decimal = 7'd83;
            end

            8'h3C: begin // U (SI)
                salto_entero = 7'd31;
                salto_decimal = 7'd61;
            end

            //SEGUNDA 8VA DE LA ESCALA
            8'h46: begin // I (DO)
                salto_entero = 7'd33;
                salto_decimal = 7'd49;
            end

            8'h43: begin // 9 (DO#)
                salto_entero = 7'd35;
                salto_decimal = 7'd48;
            end

            8'h44: begin // O (RE)
                salto_entero = 7'd37;
                salto_decimal = 7'd59;
            end

            8'h45: begin // 0 (RE#)
                salto_entero = 7'd39;
                salto_decimal = 7'd82;
            end

            8'h4D: begin // P (MI)
                salto_entero = 7'd42;
                salto_decimal = 7'd19;
            end

            8'h1A: begin // Z (FA)
                salto_entero = 7'd44;
                salto_decimal = 7'd70;
            end

            8'h1B: begin // S (FA#)
                salto_entero = 7'd47;
                salto_decimal = 7'd36;
            end

            8'h22: begin // X (SOL)
                salto_entero = 7'd50;
                salto_decimal = 7'd18;
            end

            8'h23: begin // D (SOL#)
                salto_entero = 7'd53;
                salto_decimal = 7'd16;
            end

            8'h21: begin // C (LA)
                salto_entero = 7'd56;
                salto_decimal = 7'd32;
            end

            8'h2B: begin // F (LA#)
                salto_entero = 7'd59;
                salto_decimal = 7'd67;
            end

            8'h2A: begin // V (SI)
                salto_entero = 7'd63;
                salto_decimal = 7'd22;
            end
            
        endcase
    end
endmodule
