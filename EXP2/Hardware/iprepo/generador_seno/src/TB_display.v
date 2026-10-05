`timescale 1ns / 1ps

module TB_display(    );
    
    reg clk, rst;
    reg [15:0] display_value;
     
    wire [6:0] segments; //
    wire [3:0] an;
    wire dp; // dp es el punto de cada display

    display_voltaje uut (    .clk(clk), .rst(rst), .display_value(display_value), .segments(segments), .an(an), .dp(dp)    );
    
    
    always begin
        #5 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        clk = 0;
        display_value = 16'h0001;
        
        #10 rst=0;
        display_value = 16'h0739;    
    end
    
    
endmodule
