`timescale 1ns / 1ps 

module display_voltaje( 
    input wire clk, 
    input wire rst, 
    input wire [15:0] display_value,
     
    output wire [6:0] segments, //
    output reg [3:0] an, 
    output reg dp // dp es el punto de cada display
); 

    reg [16:0] refresh; //variable/registro para entradas del multiplexor  
    reg [3:0] digit; //digito que se muestra en el display 
     
    wire [6:0] segments_decoder; 
     
    //El siguiente bloque es para 
    always @(posedge clk or posedge rst) begin 
        if (rst) 
            refresh <= 0; 
        else 
            refresh <= refresh + 1; 
    end 
 
     
    // hacemos un mux para los digitos de value de display 
    always @(*) begin 
        digit = 4'b0000; 
        an = 4'b1111; 
        // el punto apagado 
        dp = 1'b1;  
         
        //este bloque if va a comenzar a mostrar los digitos 
        
            case (refresh[16:15]) 
            //mostramos la centesima en el display de la derecha 
                2'b00: begin     
                    an = 4'b1110; 
                    digit = display_value[3:0]; 

                    //no encendemos el punto 
                    dp = 1'b1; 
                end 
                 
           // mostramos la décima en el display siguiente  
                2'b01: begin 
                    an = 4'b1101; 
                    digit = display_value[7:4]; 
                    
                    dp = 1'b1; 
                end 

          // mostramos la unidad en el diplay siguiente 
                2'b10: begin 
                    an = 4'b1011; 
                    digit = display_value[11:8]; 
                    
                    dp = 1'b1; 
                end 

          // mostramos la decena, encendemos el display mas de la izquierda  
                2'b11: begin 
                    an = 4'b0111; 
                    digit = display_value[15:12]; 
                    
                    dp = 1'b1; 
                end 
             endcase 
                       
    end             
     
    seven_segment_display_anodo decoder (
        .digit(digit), 
        .segments(segments_decoder)
    ); 

    assign segments = segments_decoder; 
 
endmodule 
 