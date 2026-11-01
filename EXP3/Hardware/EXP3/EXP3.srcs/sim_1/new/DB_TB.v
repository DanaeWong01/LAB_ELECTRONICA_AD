`timescale 1ns / 1ps

module DB_TB(   );
    
    reg clk;
    reg ps2c;
    reg rst;
    reg clk10khz;
    wire ps2c_DB,ps2c_sync;
    
    DB uut(   .clk(clk), .ps2c(ps2c), .rst(rst), .ps2c_DB(ps2c_DB), .ps2c_sync(ps2c_sync)   );
    
    always begin
        #5
        clk = ~clk;
    end
    
    always begin
        #50000
        clk10khz = ~clk10khz;
    end
    
    initial begin
        rst = 1;
        ps2c = 1;
        clk = 0;
        clk10khz = 0;
        
        #50
        
        rst = 0;
        #10
        ps2c = 0;
        #1
        ps2c = 1;
        #2
        ps2c = 0;
        #5
        ps2c = 1;
        #30
        ps2c = 0;
        #40
        ps2c = 1;
        #80
        ps2c = 0;
        #120
        ps2c = 1;
        #20
        ps2c = 0;
        #2000
        ps2c = 1;
        #20
        ps2c = 0;
    end
    
    
    
    
    
endmodule
