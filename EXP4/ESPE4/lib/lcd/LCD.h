#include <Arduino.h>
#ifndef _LCD_H_
#define _LCD_H_

// esta es la libreria para manejar la pantalla LCD

void lcd_init();
void lcd_cmd(byte comando);
void lcd_dat(byte dato);

// funciones para escribir en la lcd dada las posiciones.
void lcd_set_cursor(int fila, int columna);
void lcd_print(String texto);
void lcd_print_line(int fila, String texto);

//funcion para actualizar los parametros
void lcd_update(float temperatura,
                float referencia,
                float potencia);

#endif