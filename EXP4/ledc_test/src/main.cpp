#include <Arduino.h>

const int PIN_PWM = 18;
const int PWM_FREQ = 10000;
const int BITS = 64;
const int PWM_CHANNEL = 0;

void setup() {
    Serial.begin(115200);

    // API de Arduino-ESP32 3.x
    ledcSetup(PWM_CHANNEL, PWM_FREQ, BITS);
    ledcAttachPin(PIN_PWM, PWM_CHANNEL);

    ledcWrite(PWM_CHANNEL, 32768); // 50% duty
}

void loop() {
}

