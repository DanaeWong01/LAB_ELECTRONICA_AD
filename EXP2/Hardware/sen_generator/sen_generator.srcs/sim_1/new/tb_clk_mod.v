`timescale 1ns / 1ps

module tb_clk_mod(    );
    parameter N = 8;
    reg clk, rst;
    wire clk_div;
    
    modular_clk_div #(.N(N)) uut ( .clk(clk), .rst(rst), .clk_div(clk_div) );
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rst = 1;
        
        #10 rst = 0;
        
    end
    
endmodule
