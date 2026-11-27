#include "LCD.h"
#include <Arduino.h>

// definimos los pines ocupados de la LCD
const int PIN_RS = 16; // selecciona si es un comando (0) o dato (1)
const int PIN_RW = 26; // defina si es lectura (1) o escritura (0)
const int PIN_EN = 22; // pin Enable: permite que la LCD lea los datos

// pines de datos de la lcd
const int PIN_D4 = 18;
const int PIN_D5 = 19;
const int PIN_D6 = 23;
const int PIN_D7 = 25;

// Generamos un pulso de Enable para que la pantalla
// lea los datos en los pines D4-D7.
void lcd_enable() {
    digitalWrite(PIN_EN, LOW);
    delayMicroseconds(1);

    digitalWrite(PIN_EN, HIGH);
    delayMicroseconds(2);

    digitalWrite(PIN_EN, LOW);
    delayMicroseconds(2);
}

// envia 4 bits por cada uno de los pines D4, D5, D6 y D7.
void lcd_send(byte dato) {

    // Separamos los 4 bits y se escriben en los pines  correspondientes
    digitalWrite(PIN_D4, bitRead(dato, 0));
    digitalWrite(PIN_D5, bitRead(dato, 1));
    digitalWrite(PIN_D6, bitRead(dato, 2));
    digitalWrite(PIN_D7, bitRead(dato, 3));

    // Generamos el pulso para que el LCD lea los bits
    lcd_enable();
}

// enviamos un comando (cmd) a la LCD
void lcd_cmd(byte comando) {

    digitalWrite(PIN_RS, LOW); // RS = 0 es comando
    digitalWrite(PIN_RW, LOW); // RW = 0 es escritura

    // Enviamos primero los 4 bits altos
    lcd_send(comando >> 4);

    // Luego enviamos los 4 bits bajos
    lcd_send(comando & 0x0F);

    delayMicroseconds(60);

    // Clear y Return Home necesitan mas tiempo
    if (comando == 0x01 || comando == 0x02) {
        delay(2);
    }
}

// Envia un caracter a la pantalla LCD
void lcd_dat(byte dato) {
 
    digitalWrite(PIN_RS, HIGH); // RS = 1: dato
    digitalWrite(PIN_RW, LOW);  // RW = 0: escritura

    // Enviamos primero los 4 bits altos
    lcd_send(dato >> 4);

    // Luego enviamos los 4 bits bajos
    lcd_send(dato & 0x0F);

    delayMicroseconds(60);
}

// se inicializa la LCD en moddo de 4 bits
void lcd_init() {
    // se configuran los pines como salidas
    pinMode(PIN_RS, OUTPUT);
    pinMode(PIN_RW, OUTPUT);
    pinMode(PIN_EN, OUTPUT);

    pinMode(PIN_D4, OUTPUT);
    pinMode(PIN_D5, OUTPUT);
    pinMode(PIN_D6, OUTPUT);
    pinMode(PIN_D7, OUTPUT);

    // primero se inicia con las senales en low
    digitalWrite(PIN_RS, LOW);
    digitalWrite(PIN_RW, LOW);
    digitalWrite(PIN_EN, LOW);
    // delay para esperar que la pantalla encienda
    delay(50);

    // Secuencia de inicializacion HD44780
    // Permite pasar del modo inicial al modo de 4 bits
    lcd_send(0x03);
    delay(5);

    lcd_send(0x03);
    delayMicroseconds(100);

    lcd_send(0x03);
    delayMicroseconds(100);

    lcd_send(0x02);
    delayMicroseconds(100);

    // configuracion de la pantalla
    lcd_cmd(0x28); // 4 bits, 2 filas, 5x8
    lcd_cmd(0x08); // display off
    lcd_cmd(0x01); // se limpia la pantalla
    lcd_cmd(0x06); // aumentar cursor
    lcd_cmd(0x0C); // display on, cursor off
}
// para escribir en la pantalla, se posiciona el curso en una fila y columna
// solo hay 2 filas y 16  columnas 
void lcd_set_cursor(int fila, int columna) {
    // vemos que sea una posicion valida
    if (fila > 1 || fila < 0 ||
        columna > 15 || columna < 0) {
        return;
    }
    // 1ra fila comienza en 0x80
    if (fila == 0) {
        lcd_cmd(0x80 + columna);
    }
    // 2da fila comienza en 0xC0
    else {
        lcd_cmd(0xC0 + columna);
    }
}

// se escribe un string
void lcd_print(String texto) {
    // se recorre el texto caracter por caracter
    for (int i = 0; i < texto.length(); i++) {
        lcd_dat(texto[i]);
    }
}

// se escrbie una fila de 16 caracteres 
void lcd_print_line(int fila, String texto) {
    if (fila < 0 || fila > 1) {
        return;
    }
    // se pone el cursor al inicio de la fila
    lcd_set_cursor(fila, 0);

    // escribimos el texto (los 16 caracteres)
    int i = 0;

    while (i < texto.length() && i < 16) {
        lcd_dat(texto[i]);
        i++;
    }
    // se rellenan los espacios como vacios para borrar lo printeado antes
    while (i < 16) {
        lcd_dat(' ');
        i++;
    }
}

// actualizamos los parametros que le damos de T, R y P
void lcd_update(float temperatura,
                float referencia,
                float potencia) {
    //siguiendo la disposicion del enunciado
    // 1ra fila: temperatura y referencia
    String fila1 = "T:" + String(temperatura, 0)
                 + "C R:" + String(referencia, 0) + "C";

    // 2da fila: potencia del ventilador
    String fila2 = "P:" + String(potencia, 1) + "W";

    // se printean los valores en la LCD
    lcd_print_line(0, fila1);
    lcd_print_line(1, fila2);
}