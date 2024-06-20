#include <ArduinoHttpClient.h>
#include <WiFi.h>

const char* ssid = "Tél Arthur"; // Remplacez par le SSID de votre réseau WiFi
const char* password = "arthur1006"; // Remplacez par le mot de passe de votre réseau WiFi
const char* serverAddress = "192.168.60.238"; // Adresse IP du serveur intermédiaire
const int serverPort = 8080; // Port du serveur intermédiaire
const int IN1 = 32;
const int IN2 = 33;

WiFiClient wifiClient;
HttpClient httpClient = HttpClient(wifiClient, serverAddress, serverPort);

int previousLedState = -1; // Variable pour stocker l'état précédent de la LED

void setup() {
  // Initialisation des broches
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  Serial.begin(115200);
  

  // Connexion au réseau WiFi
  Serial.println("Connexion au réseau WiFi...");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connexion au WiFi...");
  }
  Serial.println("Connecté au réseau WiFi");
}

void loop() {
  // Effectuer une requête HTTP GET pour récupérer l'état de la LED
  String url = "/led_state";
  Serial.println("Envoi de la requête HTTP GET : " + url);
  
  httpClient.get(url);
  delay(1000); // Attendre un peu pour que le serveur réponde
  
  // Lire la réponse HTTP
  int statusCode = httpClient.responseStatusCode();
  String response = httpClient.responseBody();
  Serial.println("Réponse du serveur intermédiaire (Code " + String(statusCode) + "): " + response);

  // Vérifier l'état de la LED dans la réponse
  if (statusCode == 200) {
    int currentLedState = (response.indexOf("\"led_state\":1") != -1) ? 1 : 0;
    
    if (currentLedState != previousLedState) {
      if (currentLedState == 1) {
        // Ouvrir la barrière pendant 75 ms
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, HIGH);
        Serial.println("Lever la barrière");
        delay(75);
        // Arrêter le moteur
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, LOW);
      } else {
        // Fermer la barrière pendant 75 ms
        digitalWrite(IN1, HIGH);
        digitalWrite(IN2, LOW);
        Serial.println("Rabaisser la barrière");
        delay(75);
        // Arrêter le moteur
        digitalWrite(IN1, LOW);
        digitalWrite(IN2, LOW);
      }
      previousLedState = currentLedState; // Mettre à jour l'état précédent
    }
  } else {
    Serial.println("Erreur lors de la récupération de l'état de la LED");
  }

  // Attendre avant de vérifier à nouveau l'état de la LED
  delay(10000); // Attendre 3 secondes avant de faire une nouvelle requête
}
