#include "pgweb.h"
#include <Arduino.h>
#include <WiFi.h>
#include <AsyncTCP.h>
#include <ESPAsyncWebServer.h>

//ocupamos de referencia el tutorial en R<andom Nerd Tutorials 
//https://randomnerdtutorials.com/esp32-dht11-dht22-temperature-humidity-web-server-arduino-ide/
//https://randomnerdtutorials.com/esp32-client-server-wi-fi/


//crearemos el nombre y la contrasena de la wifi
const char* ssid = "WIFII_espe"; //nombre de la wifi
const char* password = "espe_G16"; //contrasena de la wifi

//se crea el servidor para la pagina en el puerto 80
AsyncWebServer servidor(80);

//la esp crea un servidor wifi al que me conecto desde mi computador, y mediante esa red
//la esp crea una pagina web local por protocolo http (el del buscador de un navegador) 

// Valores iniciales de prueba (el sensor y PI se integraran despues)
float temperaturaWeb = 25.0;
float potenciaWeb = 2.4;
float kpWeb = 4.0;
float kiWeb = 1.5;
float referenciaWeb = 35.0;

// Protege las variables cuando el servidor y el main las usan a la vez
portMUX_TYPE mutexDatos = portMUX_INITIALIZER_UNLOCKED;

// creamos la pag8na web que mostrara la esp
const char paginaHTML[] PROGMEM = R"HTML(
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Control de temperatura</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 430px; margin: 35px auto; padding: 0 16px; }
    h1 { font-size: 24px; }
    .dato { margin: 12px 0; padding: 12px; background: #f0f4f6; border-radius: 8px; }
    label { display: block; margin-top: 12px; }
    input { width: 100%; padding: 9px; box-sizing: border-box; }
    button { margin-top: 16px; padding: 11px 18px; cursor: pointer; }
  </style>
</head>
<body>
  <h1>Control de temperatura</h1>

  <div class="dato">Temperatura: <b id="temperatura">--</b> &deg;C</div>
  <div class="dato">Potencia: <b id="potencia">--</b> W</div>
  <div class="dato">Referencia actual: <b id="referenciaActual">--</b> &deg;C</div>

  <h2>Parametros del controlador PI</h2>
  <form id="formulario">
    <label>Kp</label>
    <input type="number" name="kp" id="kp" min="0" max="100" step="any" required>

    <label>Ki</label>
    <input type="number" name="ki" id="ki" min="0" max="20" step="any" required>

    <label>Referencia (grados C)</label>
    <input type="number" name="referencia" id="referencia" min="0" max="100" step="any" required>

    <button type="submit">Guardar parametros</button>
  </form>
  <p id="mensaje"></p>

  

  <script>
    let primeraCarga = true;

    // Cada segundo le pedimos los valores actuales a la ESP32
    async function actualizarDatos() {
      try {
        const respuesta = await fetch('/api/datos');
        if (!respuesta.ok) throw new Error('Sin respuesta del servidor');
        const datos = await respuesta.json();

        document.getElementById('temperatura').textContent = datos.temperatura;
        document.getElementById('potencia').textContent = datos.potencia;
        document.getElementById('referenciaActual').textContent = datos.referencia;

        // Al abrir la pagina mostramos las ganancias guardadas
        if (primeraCarga) {
          document.getElementById('kp').value = datos.kp;
          document.getElementById('ki').value = datos.ki;
          document.getElementById('referencia').value = datos.referencia;
          primeraCarga = false;
        }
      } catch (error) {
        document.getElementById('mensaje').textContent = 'No se pudo consultar la ESP32';
      }
    }

    // Cuando presionamos Guardar, enviamos Kp, Ki y referencia
    document.getElementById('formulario').addEventListener('submit', async function(evento) {
      evento.preventDefault(); // Evita recargar la pagina
      const valores = new URLSearchParams(new FormData(evento.target));

      try {
        const respuesta = await fetch('/api/parametros', {
          method: 'POST',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: valores.toString()
        });
        const resultado = await respuesta.json();
        document.getElementById('mensaje').textContent =
          resultado.ok ? 'Parametros guardados' : 'Error: ' + resultado.error;
        if (resultado.ok) actualizarDatos();
      } catch (error) {
        document.getElementById('mensaje').textContent = 'No se pudo enviar la solicitud';
      }
    });

    actualizarDatos();
    setInterval(actualizarDatos, 1000);
  </script>
</body>
</html>
)HTML";

// Lee un parametro del formulario y comprueba que sea un numero valido
bool leerNumero(AsyncWebServerRequest* request, const char* nombre, float &numero) {
    if (!request->hasParam(nombre, true)) return false;

    String texto = request->getParam(nombre, true)->value();
    texto.trim();
    if (texto.length() == 0) return false;

    char* fin;
    numero = strtof(texto.c_str(), &fin);

    // Rechaza textos como "abc", "2hola" o numeros infinitos
    return fin != texto.c_str() && *fin == '\0' && isfinite(numero);
}

// Se llama desde main para entregar las mediciones actuales
void web_mediciones(float temperatura, float potencia) {
    portENTER_CRITICAL(&mutexDatos);
    temperaturaWeb = temperatura;
    potenciaWeb = potencia;
    portEXIT_CRITICAL(&mutexDatos);
}

// Se llama desde main/controlador para obtener los parametros vigentes
void web_parametros(float &kp, float &ki, float &referencia) {
    portENTER_CRITICAL(&mutexDatos);
    kp = kpWeb;
    ki = kiWeb;
    referencia = referenciaWeb;
    portEXIT_CRITICAL(&mutexDatos);
}

// crea la red, define las rutas e inicializa el servidor wifi local de la esp
void web_init() {
    WiFi.mode(WIFI_AP);
    //aqui ya inicializamor directamente el wifi de la esp
    if (!WiFi.softAP(ssid, password)) {
        Serial.println("Error al crear la red WiFi");
        return;
    }

    Serial.print("IP de la ESP32: ");
    Serial.println(WiFi.softAPIP());

    // GET / : entrega la pagina HTML
    servidor.on("/", HTTP_GET, [](AsyncWebServerRequest* request) {
        request->send_P(200, "text/html", paginaHTML);
    });

    // GET /api/datos : entrega mediciones y parametros en formato JSON
    servidor.on("/api/datos", HTTP_GET, [](AsyncWebServerRequest* request) {
        float t, p, kp, ki, r;

        // Copiamos todos los valores antes de construir la respuesta
        portENTER_CRITICAL(&mutexDatos);
        t = temperaturaWeb;
        p = potenciaWeb;
        kp = kpWeb;
        ki = kiWeb;
        r = referenciaWeb;
        portEXIT_CRITICAL(&mutexDatos);

        String json = "{";
        json += "\"temperatura\":" + String(t, 1) + ",";
        json += "\"potencia\":" + String(p, 1) + ",";
        json += "\"kp\":" + String(kp, 2) + ",";
        json += "\"ki\":" + String(ki, 2) + ",";
        json += "\"referencia\":" + String(r, 1);
        json += "}";

        request->send(200, "application/json", json);
    });

    // POST /api/parametros : recibe K_p, K_i y referencia desde el HTML
    servidor.on("/api/parametros", HTTP_POST, [](AsyncWebServerRequest* request) {
        float nuevoKp, nuevoKi, nuevaReferencia;

        //primero se verifican los campos, sin modificar nada
        bool valido = leerNumero(request, "kp", nuevoKp) &&
                      leerNumero(request, "ki", nuevoKi) &&
                      leerNumero(request, "referencia", nuevaReferencia);

        if (!valido) {
            request->send(400, "application/json",
                          "{\"ok\":false,\"error\":\"Faltan datos o no son numeros validos\"}");
            return;
        }

        // ajustamos con el controlador definitivo
        if (nuevoKp < 0 || nuevoKp > 100 ||
            nuevoKi < 0 || nuevoKi > 20 ||
            nuevaReferencia < 0 || nuevaReferencia > 100) {
            request->send(400, "application/json",
                          "{\"ok\":false,\"error\":\"Valores fuera de rango\"}");
            return;
        }

        // Guardamos los tres nuevos valores juntos
        portENTER_CRITICAL(&mutexDatos);
        kpWeb = nuevoKp;
        kiWeb = nuevoKi;
        referenciaWeb = nuevaReferencia;
        portEXIT_CRITICAL(&mutexDatos);

        request->send(200, "application/json", "{\"ok\":true}");
    });

    servidor.begin();
    Serial.println("Servidor web iniciado");
}
