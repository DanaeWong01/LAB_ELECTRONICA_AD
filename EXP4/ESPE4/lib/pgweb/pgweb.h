//ocupamos de referencia el tutorial en R<andom Nerd Tutorials 
//https://randomnerdtutorials.com/esp32-dht11-dht22-temperature-humidity-web-server-arduino-ide/
//https://randomnerdtutorials.com/esp32-client-server-wi-fi/

#ifndef pgweb_H
#define pgweb_H

void web_init(); //inicializamos la wifi y el servidor web de la esp
//envia la informacion a web
void web_mediciones(float temperatura, float potencia);

//web_parametros pide los parametros que estan
// en la memoria, que son del controlador que se modifican desde la web
void web_parametros(float &k_p, float &k_i, float &ref);

#endif