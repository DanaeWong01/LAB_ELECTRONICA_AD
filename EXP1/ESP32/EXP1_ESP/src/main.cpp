#include <Arduino.h>
#define PIN_lec 34 //pin de indicacion de lectura del ADC

float V_adc;  //voltaje medido por el adc 
float V_dgt;  //voltaje digital ya escalado de 0 a 3.3
float V_anlg;  //voltaje analogico original

float V_okd; // volate corregido del muestreo del ADC
//float V_oka; //voltaje corregido de entrada

const float V_ref = 3.3;

const int N = 4095;

int V_bcdd; //voltaje en 0 a 3.3 ya en BCD para enviar
int V_bcda; //voltaje original en 3 a 10 ya en BCD para enviar

int dd; //decena del digital
int du; //unidad de digital
int ddc; //decima del gitial
int dct; //centesima del digital

int ad; //decena original
int au; //unidad original
int adc; // decima original
int act; // centesima original

int Vd1;
int Vd2;
int Va1;
int Va2;

//funcion para convertir a bcd
uint8_t dec2bcd(uint8_t dec)
{
  return (dec/10)*16 + (dec%10);
}

void setup() {
  // put your setup code here, to run once:
  pinMode(PIN_lec, INPUT);
  //inicializar el uart de la terminal del pc al baudrate
  Serial.begin(115200);
  //inicializar la serial para comunicacion de salida
  //Serial2.begin(9600, SERIAL_8N1, -1, 10); //pin GPIO10 es el de salida para darle a la fpga
}

void loop() {
  //Ocupamos analogRead() para leer el input analogo
  V_adc = analogRead(PIN_lec); //lectura del voltaje desd el ADC
  Serial.println(V_adc);
  //Reescalamos los voltajes que miden el ADC como
  V_dgt = V_adc*V_ref/N;
  Serial.println(V_dgt);

  //hacemos la correccion del offset de voltaje que tiene la salida
  //levantada en 1.65v y ademas la correccion de fase
  V_okd = -(V_dgt - 1.65)+1.65; //esto resulta de al V_dgt restarle 1.65 de offset, invertirlo 
  // y luego sumarlo los 1.65 que tiene de offset

  //Como queremos mostrar tambien la entrada original del circuito acondicionador
  // tambien lo recuperamos desde el valor de entrada del adc (de 0 a 3.3V)
  V_anlg = -(V_dgt - 1.65)/(0.427) + 6.5; 

  Serial.println(V_anlg);
  // tambien corregimos lo que seria el valor original analogico de 3 a 10V
  //if (V_anlg > 10.0) V_anlg = 10.0;
  // y que no sea menor a 0
  //if (V_anlg < 3.0) V_anlg = 3.0;
  
  //Separamos el valor de voltaje del adc en unidades
  V_bcdd = (int)(V_okd*100.0);

  dd = (V_bcdd/1000)%10; //decena
  du = (V_bcdd/100)%10; //unidad
  ddc = (V_bcdd/10)%10; //decima
  dct = V_bcdd%10; //centesima

  //Separamos el valor de voltaje de entrada en unidad
  V_bcda = (int)(V_anlg*100.0);
  ad = (V_bcda/1000)%10; //decena
  au = (V_bcda/100)%10; //unidad
  adc = (V_bcda/10)%10; //decima
  act = V_bcda % 10; //centesima

  //conversion a BCD del voltaje del adc
  dd = dec2bcd(dd);
  //Serial.println(dd); //print
  du = dec2bcd(du);
  //Serial.println(du); //print
  ddc = dec2bcd(ddc);
  //Serial.println(ddc); //print
  dct = dec2bcd(dct);
  //Serial.println(dct); //print

  //converision a BCD del voltaje de entrada original
  ad = dec2bcd(ad);
  //Serial.println(ad); //print
  au = dec2bcd(au);
  //Serial.println(au); //print
  adc = dec2bcd(adc);
  //Serial.println(adc); //print
  act = dec2bcd(act);
  //Serial.println(act); //print


  //Concatenamos los correspondientes para hacer los 8 bits por dato
  Vd1 = (dd << 4) | du; // 8bit
  Vd2 = (ddc << 4) | dct; // 

  //Serial.println(Vd1);
  //Serial.println(Vd2);  

  Va1 = (ad << 4) | au;
  Va2 = (adc << 4) | act; 

  //Mandamos un byte de inicio, los datos de voltaje del adc
  //y los datos de voltaje original de entrada

  //Serial2.write(0xEE); //byte de inicio
  //Serial.println(0xEE);

  // enviamos el dato del voltaje del adc
  // Serial2.write(Vd1); //voltaje del adc en formado decena,unidad
  // Serial2.write(Vd2); //voltaje del adc en formato decima,centesima

  //Serial.println(Vd1);
  //Serial.println(Vd2); 

  // enviamos el dato del voltaje original de entrada al circuito
  // Serial2.write(Va1); //voltaje original en formato decena,unidad
  // Serial2.write(Va2); //voltaje original en formato decima,centesima

  //Serial.println(Va1); 
  //Serial.println(Va2); 

  Serial.println(0xFF);
  //Serial2.write(0xFF); //byte de termino
}