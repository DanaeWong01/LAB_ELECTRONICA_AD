#include <Arduino.h>
#include "LCD.h"   // libreria para la pantalla LCD
#include "pgweb.h" // libreria para el servidor web
#include "adc.h"   // libreria para leer el voltaje y calcular temperatura
#include "pwm.h"   // librería para manejar el pwm

#include <freertos/FreeRTOS.h>  // librería de real time OS
#include <freertos/task.h>      // para tareas
#include <freertos/queue.h>     // para pasar info entre tasks


TaskHandle_t task_controlador;
TaskHandle_t task_interfaz;


// defino una estructura de datos para pasar ingo del sistema de un task al otro
struct DatosSistema {
    float temp;
    float ref;
    float pot;
    float control;
};

struct DatosControl {
    float kp;
    float ki;
    float ref;
};


// Cola para los datos
QueueHandle_t colaDatos;
QueueHandle_t colaContr;


// defino la task para el control, basándome en el 
// tutorial de https://randomnerdtutorials.com/esp32-dual-core-arduino-ide/
void tskControl(void *parameter) {
    Serial.print("tskControl running on core ");
    Serial.println(xPortGetCoreID());
    
    float err_now = 0.0;
    float err_acumul = 0.0;
    float max_acumul = 200.0;
    float u = 0.0;
    const unsigned u_max = 500;

    // parametros del controlador PI
    float kp = 4.0;
    float ki = 1.5;

    float temperatura = 25.0;
    float referencia = 35.0;
    float potencia = 2.4;

    float intervalo = 200.0;

    // La palabra de comunicación entre los núcleos
    DatosSistema datos;
    DatosControl datoscontrol; /*para recibir kp, ki, ref*/

    // Tomamos la cantidad de ticks que ha pasado
    TickType_t tiempo = xTaskGetTickCount();

    while(true) {
        // Si recibimos nuevos params desde la web, cambiamos los locales
        if (xQueueReceive(colaContr, &datoscontrol, 0) == pdTRUE) { /*con delay 0 para no esperar el mensaje*/

            // Reiniciar integral si cambia la referencia
            if (datoscontrol.ref != referencia) {
                err_acumul = 0.0;
            }

            kp = datoscontrol.kp;
            ki = datoscontrol.ki;
            referencia = datoscontrol.ref;
        }

        // 1. Leemos el voltaje desde el ADC
        float voltajeMedido = voltaje();

        // 2. Convertimos el voltaje a temperatura
        temperatura = temperatura_adc(voltajeMedido);

        // 3. Hago el lazo de control
        err_now = referencia-temperatura;
        err_acumul += err_now*(intervalo/1000.0f); // Para que Ki sea menos sensible expresamos el intervalo en segundos
        err_acumul = constrain(err_acumul, -max_acumul, max_acumul);

        u = kp*err_now + ki*err_acumul;
        u = constrain(u, 0, 0.85*u_max); // *** Preguntar a ayudante si esto quería decir el profe (hacer costrain a 25% de duty para que no se quede pegado el ventilador)
        u /= u_max;


        // 4. Actualizo la PWM
        pwm_set_duty((1-u)*100.0);

        // 5. Hago datos para enviar al otro núcleo
        datos.temp = temperatura;
        datos.ref = referencia;
        datos.pot = 12*0.2*(1-u); /*asumiendo V_BE=0V*/
        datos.control = u;

        // 6. Actualizo el Queue
        xQueueOverwrite(colaDatos, &datos);

        // 7. Espero que pase intervalo de tiempo
        vTaskDelayUntil(
            &tiempo,
            pdMS_TO_TICKS(intervalo)
        );
    }
}

void tskGUI(void *parameters) {
    Serial.print("tskGUI running on core ");
    Serial.println(xPortGetCoreID());

    DatosSistema datos;
    DatosControl datoscontrol;

    // Valores iniciales
    datoscontrol.kp = 4.0;
    datoscontrol.ki = 1.5;
    datoscontrol.ref     = 35.0;

    // loop
    while(true) {
        // Tomo los datos que envía la web
        web_parametros(datoscontrol.kp, datoscontrol.ki, datoscontrol.ref);

        // Envío al controlador
        xQueueOverwrite(colaContr, &datoscontrol);


        // Espero si hay info de la cola (del otro núcleo)
        if (xQueueReceive(colaDatos, &datos, pdMS_TO_TICKS(50)) == pdTRUE) { /*si no recibo en 50 ms paso de largo y leo el web denuevo*/
            // 1. Actualizamos la pantalla LCD
            lcd_update(datos.temp, datos.ref, datos.pot);

            // Enviamos los datos del controlador a la interfaz web
            web_mediciones(
                datos.temp,
                datos.pot
            );

            // 2. Mostramos los valores en el monitor serie
            Serial.print("Temperatura: ");
            Serial.print(datos.temp, 1);

            Serial.print(" C | Referencia: ");
            Serial.print(datos.ref);

            Serial.print(" | u: ");
            Serial.println(datos.control);

        }
    vTaskDelay(pdMS_TO_TICKS(10));
    }
}


void setup() {

    Serial.begin(115200);
    delay(500);

    // inicializamos la pantalla LCD
    lcd_init();
    lcd_print_line(0, "Iniciando...");
    lcd_print_line(1, "ESP32");

    // inicializamos el ADC
    adc_init();

    // inicializamos el servidor web
    web_init();

    // inicializamos el controlador PWM
    pwm_init();
    delay(1000);

    // Especifico la cola (tamaño)
    colaDatos = xQueueCreate(1, sizeof(DatosSistema));
    colaContr = xQueueCreate(1, sizeof(DatosControl));

    BaseType_t controlador = xTaskCreatePinnedToCore(
             tskControl,            /* Task function. */
             "Control",             /* name of task. */
             4096,                  /* Stack size of task */
             NULL,                  /* parameter of the task */
             3,                     /* priority of the task */
             &task_controlador,     /* Task handle to keep track of created task */
             1);                    /* pin task to core 0 */
    
    BaseType_t interfaz = xTaskCreatePinnedToCore(
             tskGUI,                /* Task function. */
             "Vision",              /* name of task. */
             4096,                  /* Stack size of task */
             NULL,                  /* parameter of the task */
             1,                     /* priority of the task */
             &task_interfaz,        /* Task handle to keep track of created task */
             0);                    /* pin task to core 0 */

    Serial.println("Sistema inicializado");
}






void loop() {
    // Hola mundo
    vTaskDelay(pdMS_TO_TICKS(1000));
}
