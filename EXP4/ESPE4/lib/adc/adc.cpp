
#include "adc.h"
#include <Arduino.h>

// recordar acondicionar la senal entre 0.3 y 3V (con acondicionador analogico)
// 0 grados son 0.3V y 100 grados son 3V
// remapeamos para el adc, considerando que se recibe
// V_adc = 0.3 + (3-0.3)*T/100, con T siendo la temperatura

const int PIN_ADC = 34; // pin para leer el ADC conectado al sensor

const float V_min = 0.3;
const float V_max = 3.0;
const float T_min = 0.0;
const float T_max = 100.0;

// inicializamos el ADC de la ESP
void adc_init() {
    pinMode(PIN_ADC, INPUT); // pin como entrada
    analogReadResolution(12); // resolucion de 12 bits (0 a 4095)
    analogSetPinAttenuation(PIN_ADC, ADC_11db); // configuramos la atenuacion
}

// leemos el voltaje que mide el ADC
float voltaje() {
    float vt = 0;
    int muestras = 10;

    // tomamos varias mediciones para reducir ruido
    for (int i = 0; i < muestras; i++) {

        // analogReadMilliVolts entrega milivolts
        vt += analogReadMilliVolts(PIN_ADC);
    }

    // calculamos el promedio y convertimos a volts
    // asi tenemos una medicion mas limpia del voltaje
    float voltaje = (vt / muestras) / 1000.0;

    return voltaje;
}

// pasamos de voltaje a temperatura en Celsius
float temperatura_adc(float voltaje) {

    // usamos la relacion lineal del acondicionador
    float temperatura = T_min +
        (voltaje - V_min) *
        (T_max - T_min) /
        (V_max - V_min);

    return temperatura;
}
