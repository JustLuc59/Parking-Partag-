#include <Arduino.h>
#include <HC_SR04.h>
#include <WiFi.h>
#include <ArduinoJson.h> // Bibliothèque pour travailler avec JSON

const int trigPin = 4; // Broche de déclenchement du capteur ultrasonique
const int echoPin = 5; // Broche de réception du capteur ultrasonique
const char* ssid = "Tél Arthur";
const char* password = "arthur1006";
const char* serverAddress = "192.168.60.238"; // Adresse IP du serveur intermédiaire
const int serverPort = 5000; // Port du serveur intermédiaire
const String endpoint = "/measurements"; // Point de terminaison pour l'envoi des mesures

void setup() {
  Serial.begin(115200);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  connectToWiFi();
}

void loop() {
  long duration;
  float distance_cm;

  // Envoie une impulsion de 10µs sur la broche de déclenchement
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Mesure la durée de l'impulsion écho reçue
  duration = pulseIn(echoPin, HIGH);

  // Calcul de la distance en centimètres
  distance_cm = duration * 0.034 / 2;

  // Affichage de la distance sur la console série
  Serial.print("Distance: ");
  Serial.print(distance_cm);
  Serial.println(" cm");

  // Envoi de la mesure au serveur intermédiaire si la distance est inférieure à 30 cm
  if (distance_cm < 3.0) {
    sendMeasurement(distance_cm);
  }

  delay(1000); // Attendre une seconde avant la prochaine mesure
}

void connectToWiFi() {
  Serial.print("Connexion au réseau ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("Connexion WiFi établie");
  Serial.print("Adresse IP: ");
  Serial.println(WiFi.localIP());
}

void sendMeasurement(float distance) {
  WiFiClient client;

  if (!client.connect(serverAddress, serverPort)) {
    Serial.println("Échec de la connexion au serveur");
    return;
  }

  Serial.println("Connexion au serveur établie");

  // Création d'un objet JSON
  StaticJsonDocument<100> doc;
  doc["distance_cm"] = distance;

  // Conversion de l'objet JSON en chaîne JSON
  String jsonString;
  serializeJson(doc, jsonString);

  // Envoi de la requête POST au serveur avec la chaîne JSON
  client.print("POST ");
  client.print(endpoint);
  client.println(" HTTP/1.1");
  client.print("Host: ");
  client.print(serverAddress);
  client.print(":");
  client.println(serverPort);
  client.println("Content-Type: application/json");
  client.print("Content-Length: ");
  client.println(jsonString.length());
  client.println();
  client.println(jsonString);

  // Attendre la réponse du serveur
  while (client.connected()) {
    if (client.available()) {
      Serial.println("Réponse du serveur:");
      Serial.println(client.readStringUntil('\n'));
    }
  }

  client.stop();
}
