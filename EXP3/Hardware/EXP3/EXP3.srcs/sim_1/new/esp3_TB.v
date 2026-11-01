`timescale 1ns / 1ps

module esp3_TB;

    // Señales de entrada
    reg clk_0;
    reg rst_0;

    // Señal de salida
    wire [7:0] wave_0;

    // Instancia del DUT (Design Under Test)
    exp3_wrapper uut (
        .clk_0(clk_0),
        .rst_0(rst_0),
        .wave_0(wave_0)
    );

    // Reloj de 100 MHz: periodo de 10 ns
    initial begin
        clk_0 = 0;
        forever #5 clk_0 = ~clk_0;
    end

    // Secuencia de simulación
    initial begin

        // Inicialización
        rst_0 = 1;

        // Mantener reset durante 100 ns
        #100;
        rst_0 = 0;

        // Observar la señal durante 20 ms
        // (2000000 ciclos de reloj de 100 MHz)
        #20_000_000;

        // Finalizar simulación
        $finish;
    end

    // Monitor de señales
    initial begin
        $monitor("Tiempo = %0t ns | rst = %b | wave = %d",
                  $time, rst_0, wave_0);
    end

endmodule