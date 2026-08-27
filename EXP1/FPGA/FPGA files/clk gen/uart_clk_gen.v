`timescale 1ns / 1ps

module uart_clk_gen
    (
        input clk, 
        input reset,     
        output baud
    );
    
    parameter N = 5208;

    reg [12:0] counter;    
    reg div;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            div <= 0;
        end
        else if(counter==N-1) begin
            counter <= 0;
            div <= ~div;
        end
        else begin
            counter <= counter + 1;
        end
    end
            
    assign baud = div;
       
endmodule