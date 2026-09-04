`timescale 1ns / 1ps

module tb_sen_gen(    );
    
    reg clk, rst;
    reg [7:0] addr;
    wire[7:0] n_out;
    
    generador_seno uut( .clk(clk), .rst(rst), .addr(addr),  .n_out(n_out) );
    
    always begin
        #5 clk = ~clk;
        addr = addr + 1;
    end
    
    initial begin
        rst = 1;
        clk = 0;
        addr = 0;
        
        #10 rst = 0;
        
    end
    
endmodule
