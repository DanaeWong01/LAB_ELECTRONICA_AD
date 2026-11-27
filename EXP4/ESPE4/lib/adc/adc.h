#ifndef adc_h
#define adc_h

void adc_init(); //inicializamos el adc
float voltaje(); //recuperamos el voltaje
float temperatura_adc(float voltaje); //esta convierte el voltaje en temperatura

#endif
