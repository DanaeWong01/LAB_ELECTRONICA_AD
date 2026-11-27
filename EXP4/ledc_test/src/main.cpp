#include <Arduino.h>

const int PIN_PWM = 25;
const int PWM_FREQ = 10000;
const int BITS = 12;
const int PWM_CHANNEL = 0;
const int PWM_MAX = 4096;

void setup() {
    Serial.begin(115200);

    double freq = ledcSetup(PWM_CHANNEL, PWM_FREQ, BITS);

    Serial.printf("Frecuencia configurada: %.2f Hz\n", freq);

    ledcAttachPin(PIN_PWM, PWM_CHANNEL);

    ledcWrite(PWM_CHANNEL, PWM_MAX*0.2);
}

void loop() {
}