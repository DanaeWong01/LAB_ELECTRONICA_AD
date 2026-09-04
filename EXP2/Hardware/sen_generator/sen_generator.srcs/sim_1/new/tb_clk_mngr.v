`timescale 1ns / 1ps

module tb_clk_mngr(    );
    
    reg clk, rst;
    reg [1:0] sw;
    wire clk_div;
    
    clk_mgnmnt uut ( .clk(clk), .rst(rst), .sw(sw), .clk_div(clk_div) );
    
    always begin
        #5 clk = ~clk;
    end 
    
    initial begin
        clk = 0;
        rst = 1;
        sw = 2'b00;
        
        #10 rst = 0;
        #60000 sw = 2'b01;
        #60000 sw = 2'b10;
        #60000 sw = 2'b11;

    end
    
endmodule
