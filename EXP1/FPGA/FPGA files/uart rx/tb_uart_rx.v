`timescale 1ns / 1ps

module tb_uart_rx( );
    
    reg rx, clk, rst;
    wire baud, rst_div, rst_in_div, msg_ready;
    wire [7:0] msg;
    
    assign rst_in_div = rst | rst_div;
    
    uart_clk_gen div_uut ( .clk(clk), .reset(rst_in_div), .baud(baud) );
    uart_rx rx_uut ( .clk(clk), .rst(rst), .clk_uart(baud), .rx(rx), .msg(msg), .rst_div(rst_div), .msg_ready(msg_ready) );

    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rx = 1;
        rst = 1;
        
        #10 rst = 0;
        
        // espero un tiempo arbitrario hasta enviar el mensaje. Este será 8'b10101000
        #130000 rx = 0;
        // Los bits de UART están separados por 1/9.600 = 104.166 ns
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 0;
        #104166 rx = 1;
        #104166 rx = 1; // STOP
    end

endmodule
