#include <Wire.h>
#include <VL53L1X.h>
#include <WiFi.h>
#include <HTTPClient.h>

// Remplacez par vos informations de réseau
const char* ssid = "Tél Arthur";
const char* password = "arthur1006";

const char* serverName = "http://192.168.164.223:5000/measurements"; // Adresse IP et port de votre serveur Flask 

VL53L1X sensor;

void setup() {
    // Configure les broches SDA et SCL pour l'ESP32
    Wire.begin(21, 22); // SDA = GPIO 21, SCL = GPIO 22
    
    Serial.begin(115200);
    if (!sensor.init()) {
        Serial.println("Failed to detect and initialize sensor!");
        while (1);
    }

    sensor.setTimeout(500);
    sensor.startContinuous(50);

    // Connexion au réseau WiFi
    WiFi.begin(ssid, password);
    Serial.print("Connecting to WiFi..");
    while (WiFi.status() != WL_CONNECTED) {
        delay(1000);
        Serial.print(".");
    }
    Serial.println("Connected to the WiFi network");
}

void loop() {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;

        // Démarre la connexion au serveur
        http.begin(serverName);
        http.addHeader("Content-Type", "application/json");

        // Lire la distance du capteur
        int distance = sensor.readRangeContinuousMillimeters();
        Serial.print("Distance: ");
        Serial.println(distance);

        // Vérifier si la distance est inférieure ou égale à 50 millimètres
        if (distance <= 50000) {
            // Créer le JSON pour l'envoi
            String httpRequestData = "{\"distance_mm\":\"" + String(distance) + "\"}";

            // Envoyer la requête POST
            int httpResponseCode = http.POST(httpRequestData);

            if (httpResponseCode > 0) {
                String response = http.getString();
                Serial.println(httpResponseCode);
                Serial.println(response);
            } else {
                Serial.print("Error on sending POST: ");
                Serial.println(httpResponseCode);
            }
        } else {
            Serial.println("Measurement above threshold, not sent.");
        }

        // Ferme la connexion
        http.end();
    } else {
        Serial.println("WiFi Disconnected");
    }
    delay(10000);
}
