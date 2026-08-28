`timescale 1ns / 1ps

module TOP_fpga(
    input wire rx,
    input wire clk,
    input wire rst,
    input wire sw_adc, 
    input wire sw_anlg,
    
    output wire [6:0] segments,
    output wire dp,
    output wire [3:0] an
    
    );
    wire rst_div;
    wire rst_in_div;

    wire baud;

    wire [15:0] v_adc;
    wire [15:0] v_in;

    wire msg_ready;
    wire [7:0] msg;
    
    wire rst_div, rst_in_div;

    
    //Or de resets 
    assign rst_in_div = rst_div | rst;
    
    // Para verificar si alguna vez se recibió correctamente el byte 0xEE
    
    
    uart_clk_gen div_uut ( .clk(clk), .reset(rst_in_div), .baud(baud) );
    
    receptor_msg rx_uut ( .clk(clk), .rst(rst), .clk_uart(baud), .rx(rx), 
        .v_adc(v_adc), .v_in(v_in), .rst_div(rst_div), .msg_ready(msg_ready), .msg(msg) );
        
    display_voltaje selector (.clk(clk), .rst(rst), .sw_adc(sw_adc), .sw_anlg(sw_anlg), .v_adc(v_adc),
        .v_anlg(v_in),  .segments(segments), .an(an), .dp(dp) );
    

endmodule
