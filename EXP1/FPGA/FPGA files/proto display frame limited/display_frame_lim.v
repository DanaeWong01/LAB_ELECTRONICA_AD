`timescale 1ns / 1ps

// El parámetro nos dice cuanto se divide el reloj de actualización del número, el genérico es un refresh rate de 2Hz
module display_frame_lim #(parameter N_refr_num = 50000000)( 
    input wire clk, 
    input wire rst, 
    input wire sw_adc, 
    input wire sw_anlg, 
    input wire [15:0] v_adc, //esto los recibimos en el receptor 
    input wire [15:0] v_anlg, // recibido desde el receptor 
     
    output reg [26:0] count_refr_num,
    output wire [6:0] segments, //
    output reg [3:0] an, 
    output reg dp // dp es el punto de cada display
); 

    reg [16:0] refresh; //variable/registro para entradas del multiplexor  
    reg [15:0] voltaje; // voltaje seleccionado 
    reg [3:0] digit; //digito que se muestra en el display 
    reg display_enable; //para habilitar el display 
    
    // Cuenta para hacer el refresh rate de actualización de números, permite hasta 1Hz (100.000.000 div. -> 27 bits)
    //reg [26:0] count_refr_num = 0; 
    // Registros para asignar los voltajes de entrada a la salida
    reg [15:0] v_adc_out, v_anlg_out;
    wire [6:0] segments_decoder; 
    
    // El siguiente bloque es para la división que hace el refresh de números
    always @(posedge clk or posedge rst) begin 
        if (rst) begin
            count_refr_num <= 0; 
            v_adc_out <= 16'h0000;
            v_anlg_out <= 16'h0000;
        end
        else if (count_refr_num>=N_refr_num-1) begin
            count_refr_num <= 0; 
            v_adc_out <= v_adc;
            v_anlg_out <= v_anlg;
        end
        else count_refr_num <= count_refr_num+1;
    end 
    
    //El siguiente bloque es para hacer la división de multiplex de dígitos
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
            voltaje = v_adc_out; 
            display_enable = 1'b1; 
        end 
         
        //Para ver el voltaje de entrada original al circuito 
        2'b10: begin 
            voltaje = v_anlg_out; 
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
     
    seg7_coder decoder (
        .digit(digit), 
        .segments(segments_decoder)
    ); 

    assign segments = (!display_enable) 
                    ? 7'b1111111 
                    : segments_decoder; 
 
endmodule 
 