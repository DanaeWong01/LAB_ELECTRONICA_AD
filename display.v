`timescale 1ns / 1ps 
 //este modulo se encarga principalmente de decidir con los switch qué entrada va a mostrar en la fpga
 // y a partir de esa entrada, asignar cada dígito (y el punto) a su display correspondiente
 // display enumerados de izquierda a derecha 4321
 // centesima (display 1), decima (display 2), unidad (display 3), decena (display 4)
 // luego de asignar, le dice al módulo de display_7segmentos para darle el número a mostrar y el 
 // hace la traducción del bcd a los segmentos a encender
module display_voltaje( 
    input wire clk, 
    input wire rst, 
    input wire sw_adc, 
    input wire sw_anlg, 
    input wire [15:0] v_adc, //esto los recibimos en el receptor 
    input wire [15:0] v_anlg, // recibido desde el receptor 
     
    output wire [6:0] segments, //
    output reg [3:0] an, 
    output reg dp // dp es el punto de cada display
); 

    reg [16:0] refresh; //variable/registro para entradas del multiplexor  
    reg [15:0] voltaje; // voltaje seleccionado 
    reg [3:0] digit; //digito que se muestra en el display 
    reg display_enable; //para habilitar el display 
 
     
    wire [6:0] segments_decoder; 
     
     
    //El siguiente bloque es para 
    always @(posedge clk or posedge rst) begin 
        if (rst) 
            refresh <= 0; 
        else 
            refresh <= refresh + 1; 
    end 
 
    //el siguiente bloque es para hacer la seleccion con los switch 0 y 1 
    //para determinar cuál voltaje mostrar
    always @(*) begin 
        case({sw_anlg, sw_adc}) 

        //Para ver el voltaje del ADC de la esp32 
        2'b01: begin 
            voltaje = v_adc; 
            display_enable = 1'b1; 
        end 
         
        //Para ver el voltaje de entrada original al circuito 
        2'b10: begin 
            voltaje = v_anlg; 
            display_enable = 1'b1; 
        end
             
        // para deuggear que no estén ambos encendidos o ambos apagados 
        default: begin 
            voltaje = 16'h0000; 
            display_enable = 1'b0; 
        end 
        endcase    
    end  
     
    // hacemos un mux para los digitos de voltaje 
    always @(*) begin 
        digit = 4'b0000; 
        an = 4'b1111; 
        // el punto apagado 
        dp = 1'b1;  
         
        //este bloque if va a comenzar a mostrar losdigitos 
        if (display_enable) begin 
            case (refresh[16:15]) 
            //mostramos la centesima en el display de la derecha 
                2'b00: begin     
                    an = 4'b1110; 
                    digit = voltaje[3:0]; 

                    //no encendemos el punto 
                    dp = 1'b1; 
                end 
                 
           // mostramos la décima en el display siguiente  
                2'b01: begin 
                    an = 4'b1101; 
                    digit = voltaje[7:4]; 
                    //no encendemos el punto 
                    dp = 1'b1; 
                end 

          // mostramos la unidad en el diplay siguiente 
                2'b10: begin 
                    an = 4'b1011; 
                    digit = voltaje[11:8]; 
                    //ahora si encendemos el punto después de la unidad 
                    dp = 1'b0; 
                end 

          // mostramos la decena, encendemos el display mas de la izquierda  
                2'b11: begin 
                    an = 4'b0111; 
                    digit = voltaje[15:12]; 
                    //no encendemos el punto 
                    dp = 1'b1; 
                end 
             endcase 
         end                
    end             
     
    seven_segment_display_anodo decoder (
        .digit(digit), 
        .segments(segments_decoder)
    ); 

    assign segments = (!display_enable) 
                    ? 7'b1111111 
                    : segments_decoder; 
 
endmodule 
 