`timescale 1ns / 1ps

module led_enable(
    input [11:0] leds,
    input enable,
        
    output [11:0] leds_enable
    );
    
    assign leds_enable = enable ? leds : 12'd0;
     
endmodule
