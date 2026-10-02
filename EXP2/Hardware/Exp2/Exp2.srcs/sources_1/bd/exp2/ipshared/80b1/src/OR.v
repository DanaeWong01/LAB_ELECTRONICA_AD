`timescale 1ns / 1ps

module OR(
    input rst,
    input rst_uart,
    output uart_clk_rst
    );
    
    assign uart_clk_rst = rst | rst_uart;
    
endmodule
