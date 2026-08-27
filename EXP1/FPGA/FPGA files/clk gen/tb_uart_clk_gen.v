`timescale 1ns / 1ps

module tb_uart_clk_gen();

    reg clk, rst;
    wire baud;
    
    uart_clk_gen uut ( .clk(clk), .reset(rst), .baud(baud)  );
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rst = 1;
        
        #10 rst = 0;
    end
    
endmodule
