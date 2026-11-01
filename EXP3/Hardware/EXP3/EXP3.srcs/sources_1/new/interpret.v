`timescale 1ns / 1ps

module interpret(   
    input clk,
    input rst,

    input [7:0] msg,
    input msg_ready,

    output reg [7:0] tecla,
    output reg valid,
    output reg soltada
    );

    reg apagar;

    always @(posedge clk) begin
        if (rst) begin
            apagar  <= 0;
            tecla    <= 0;
            valid   <= 0;
            soltada <= 0;
        end
        else begin

            soltada <= 0;

            if (msg_ready) begin

                if (msg == 8'hF0) begin
                    apagar <= 1;
                end

                else begin
                    
                    if (apagar) begin
                        soltada <= 1;
                        valid <= 0;
                        apagar <= 0;
                    end

                    else begin
                        tecla <= msg;
                        valid <= 1;
                    end

                end
            end
        end
    end
endmodule
