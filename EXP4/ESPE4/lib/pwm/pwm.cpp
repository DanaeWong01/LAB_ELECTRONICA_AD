#include "pwm.h"
#include <Arduino.h>

// definimos el pin donde se genera la PWM
const int PIN_PWM = 25;

// configuracion de la PWM
const int PWM_FREQ = 10000; // frecuencia de 10 kHz
const int BITS = 12; //
const int CANAL_PWM = 0; // canal de PWM de la ESP32

const int PWM_MAX = 4095; // valor maximo con 16 bits

// duty inicial de 50%
int duty = 50;

// inicializamos la PWM
void pwm_init() {

    // configuramos la frecuencia y resolucion del canal
    ledcSetup(CANAL_PWM, PWM_FREQ, BITS);

    // asociamos el canal al pin de salida
    ledcAttachPin(PIN_PWM, CANAL_PWM);

    // iniciamos con duty 50%
    pwm_set_duty(duty);
}

// actualizamos el duty de la PWM
void pwm_set_duty(int porcentaje) {

    // limitamos el duty entre 0 y 100%
    duty = constrain(porcentaje, 0, 100);

    // convertimos el porcentaje a un valor de 10 bits
    int valor = duty * PWM_MAX / 100;

    // escribimos el nuevo duty en el canal PWM
    ledcWrite(CANAL_PWM, valor);

    Serial.print("Duty: ");
    Serial.print(duty);
    Serial.println("%");
}

// aumenta el duty en pasos de 5%
void aumentarDuty() {
    pwm_set_duty(duty + 5);
}

// disminuye el duty en pasos de 5%
void disminuirDuty() {
    pwm_set_duty(duty - 5);
}

// obtenemos el duty actual
int pwm_get_duty() {
    return duty;
}
