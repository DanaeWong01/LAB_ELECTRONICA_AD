`timescale 1ns / 1ps

module PS2_RX_tb;

    reg clk;
    reg rst;
    reg ps2c;
    reg ps2d;

    wire [7:0] msg;
    wire msg_ready;

    // Instancia del receptor
    PS2_RX uut (
        .ps2c(ps2c),
        .ps2d(ps2d),
        .clk(clk),
        .rst(rst),
        .msg(msg),
        .msg_ready(msg_ready)
    );

    // Reloj principal: 100 MHz
    always #5 clk = ~clk;

    // Monitor
    always @(posedge clk) begin
        if (msg_ready)
            $display("Tiempo: %0t | Mensaje: 0x%h", $time, msg);
    end

    initial begin

        // Inicialización
        clk  = 0;
        rst  = 1;
        ps2c = 1;
        ps2d = 1;

        #200;
        rst = 0;

        #500;

        // =====================================
        // TEST 1: Enviar Q (0x15)
        // =====================================

        // Start bit
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 0
        ps2d = 1;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 1
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 2
        ps2d = 1;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 3
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 4
        ps2d = 1;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 5
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 6
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Bit 7
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Paridad impar: 1
        ps2d = 0;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        // Stop bit
        ps2d = 1;
        #100;
        ps2c = 0; #100;
        ps2c = 1; #100;

        #1000;

        // =====================================
        // TEST 2: Enviar break code (0xF0)
        // =====================================

        // Start
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bits de 0xF0 (LSB first)

        // Bit 0
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 1
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 2
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 3
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 4
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 5
        ps2d = 1;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 6
        ps2d = 1;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Bit 7
        ps2d = 1;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Paridad impar: 0
        ps2d = 0;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        // Stop
        ps2d = 1;
        #100; ps2c = 0; #100; ps2c = 1; #100;

        #1000;

        $display("Simulacion terminada");
        $finish;

    end

endmodule