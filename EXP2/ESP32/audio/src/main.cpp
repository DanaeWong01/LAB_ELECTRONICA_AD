#include <Arduino.h>

#define PIN_lectura 34
#define PIN_out 16

void setup() {
    analogReadResolution(12); //esta es la resolucion del adc
    analogSetPinAttenuation(PIN_lectura, ADC_11db); // atenuacion del adc

    Serial . begin (115200) ;
    delay(0.1) ;
    Serial.println("Leyendo audio") ;

    Serial2.begin(115200,SERIAL_8N1,-1,16) ; //enviamos el dato a la fpga

}

void loop () {

 uint16_t adc_in = analogRead (PIN_lectura) ; //leemos el adc

 uint8_t adc_out = adc_in >> 4; //cuantizamos a 8 bist requeridos

//Serial.println (adc_in ) ; // solo para ver los datos
//Serial.println (adc_out ) ; // solo para ver los datos

Serial2.write (adc_out) ;
}

