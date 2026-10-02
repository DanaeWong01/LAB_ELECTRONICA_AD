`timescale 1ns / 1ps

module clk_mgnmnt(
    input clk,
    input rst,
    input [1:0] sw,
    output reg clk_div
    );
    parameter N_220 = 888;
    parameter N_391 = 498;
    parameter N_554 = 352;
    parameter N_739 = 264;
    
    reg [9:0] N;
    reg [9:0] count = 0;
    
    always @(posedge(clk)) begin
        case(sw) 
            2'b00: N <= N_220;
            2'b01: N <= N_391;
            2'b10: N <= N_554;
            2'b11: N <= N_739;
            default: N <= N_220;
        endcase
    end    
    
    always @(posedge(clk) or posedge(rst)) begin
        if (rst) begin
            count <= 0;
            clk_div <= 0;
        end
        else if (count >= N) begin
            count <= 0;
            clk_div = ~clk_div;
        end
        else count <= count + 1;
    end
    
endmodule
