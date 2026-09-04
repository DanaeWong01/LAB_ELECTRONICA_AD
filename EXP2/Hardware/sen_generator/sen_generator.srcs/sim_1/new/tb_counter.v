`timescale 1ns / 1ps

module tb_counter(    );
    
    reg clk_div, rst;
    wire [7:0] addr;
    
    counter uut( .clk_div(clk_div), .rst(rst), .addr(addr) );
    
    always begin
        #5 clk_div = ~clk_div;
    end
    
    initial begin
        rst = 1;
        clk_div = 0;
        
        #10 rst = 0;
        
    end
    
endmodule
