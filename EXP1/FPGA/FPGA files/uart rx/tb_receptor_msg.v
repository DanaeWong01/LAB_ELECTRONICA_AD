`timescale 1ns / 1ps


module tb_receptor_msg();
    
    reg rx, clk, rst;
    wire baud, rst_div, rst_in_div, msg_ready;
    wire [7:0] msg;
    wire [15:0] v_adc, v_in;
       
    
    assign rst_in_div = rst | rst_div; // Este reset se entrega a uart clock gen porque es reiniciado por el reset manual y por el bloque de receptor
    
    uart_clk_gen div_uut ( .clk(clk), .reset(rst_in_div), .baud(baud) );
    receptor_msg rx_uut ( .clk(clk), .rst(rst), .clk_uart(baud), .rx(rx), .v_adc(v_adc), .v_in(v_in), .rst_div(rst_div), .msg_ready(msg_ready), .msg(msg) );

    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rx = 1;
        rst = 1;
        
        #10 rst = 0;
        
        // espero un tiempo arbitrario hasta enviar el mensaje.
        // Este será 8'b11101110 (byte inicio), 8'b00010001, 8'b00100010, 8'b01000100, 8'b10001000, 8'b11111111 (byte final)
        #130000 rx = 0;
        // Los bits de UART están separados por 1/9.600 = 104.166 ns
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1; // STOP byte inicio
        #104166 rx = 1; // START byte 1
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1; // STOP byte 1
        #104166 rx = 0; // START byte 2
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1; // STOP byte 2
        #104166 rx = 0; // START byte 3
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 1; // STOP byte 3
        #104166 rx = 0; // START byte 4
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 1; // STOP byte 4
        #104166 rx = 0; // START stop byte 
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1;
        #104166 rx = 1; // STOP stop byte
    end
    
    
    
    
    
    
endmodule
