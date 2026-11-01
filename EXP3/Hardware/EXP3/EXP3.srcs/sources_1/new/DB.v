`timescale 1ns / 1ps
// Implementación de un debouncer

module DB(
    input clk,
    input ps2c,
    input rst,
    output ps2c_DB,
    output reg ps2c_sync
    );
    
    reg [7:0] counter;
    reg ps2c_filtered;
    //reg ps2c_sync;
    
    always @(posedge clk) begin
        if (rst) begin
            counter        <= 0;
            ps2c_filtered  <= 1'b1;
            ps2c_sync      <= 1'b1;
        end
        
        else begin
            
            ps2c_sync <= ps2c;
        
            if (ps2c_sync == ps2c_filtered) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
        
                if (counter == 8'd100) begin
                    ps2c_filtered <= ps2c_sync;
                    counter <= 0;
                end
            end
        end
    end
    
    assign ps2c_DB = ps2c_filtered;
endmodule
