`timescale 1ns / 1ps

module tb_selector();

    reg switch;
    reg [15:0] voltaje_adc, voltaje_in;
    
    wire [3:0] decena, unidad, decima, centec;
    
    selector_voltaje uut(   .voltaje_adc(voltaje_adc), 
                            .voltaje_in(voltaje_in), 
                            .switch(switch), 
                            .decena(decena), 
                            .unidad(unidad), 
                            .decima(decima), 
                            .centec(centec) 
                            );
    
    initial begin
        switch = 1;
        voltaje_adc = 16'h0158;
        voltaje_in  = 16'h0907;
        
        #250 switch = 0;
        #250 voltaje_adc = 16'h0293;
        voltaje_in = 16'h1023;
        #250 switch = 1;
    end
endmodule
