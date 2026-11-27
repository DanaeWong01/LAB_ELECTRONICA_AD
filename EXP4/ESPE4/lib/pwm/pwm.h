#ifndef pwm_H
#define pwm_H

void pwm_init(); // inicializamos la PWM

// actualizamos el duty entre 0 y 100%
void pwm_set_duty(int porcentaje);

// aumentamos o disminuimos duty en 5%
void aumentarDuty();
void disminuirDuty();

// recuperamos el porcentaje actual
int pwm_get_duty();

#endif
