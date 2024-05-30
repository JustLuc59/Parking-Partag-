#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <LiquidCrystal_I2C.h>
const char* ssid = "Tél Arthur";
const char* password = "arthur1006";
const char* serverName = "http://192.168.47.19:5000/data";
// set the LCD number of columns and rows
int lcdColumns = 16;
int lcdRows = 2;
  int capteur=1;
  int plaque=1;
  int qrcode=1;
  int i =0;

// set LCD address, number of columns and rows
// if you don't know your display address, run an I2C scanner sketch
LiquidCrystal_I2C lcd(0x27, lcdColumns, lcdRows); 
void setup() {
  Serial.begin(115200);
    // initialize LCD
  lcd.init();
  // turn on LCD backlight                      
  lcd.backlight();
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  
  Serial.println("Connected to WiFi");
}

void loop() {
  if(WiFi.status()== WL_CONNECTED){
    HTTPClient http;

    http.begin(serverName);
    int httpResponseCode = http.GET();

    if (httpResponseCode > 0) {
      Serial.println(httpResponseCode);
      String response = http.getString();
      //Serial.println(httpResponseCode);
      //Serial.println(response);
      // Parse JSON response
      DynamicJsonDocument doc(2048);
      DeserializationError error = deserializeJson(doc, response);

      if (error) {
        Serial.print("deserializeJson() failed: ");
        Serial.println(error.f_str());
        return;
      }

      // Assuming you want to print the username of the first user in the array
      int Barriere = doc[0]["barriere"];
      Serial.print("Barrière: ");
      Serial.println(Barriere);
      int capteur = doc[0]["Nouveau_Colonne"];
      Serial.print("capteur: ");
      Serial.println(capteur);
      int idk = doc[0]["En_Attente"];
      Serial.print("idk: ");
      Serial.println(idk);
      lcd.setCursor(0, 0);
      lcd.clear();
      if (capteur==1){
        lcd.setCursor(3, 0);
        lcd.print("Bienvenue !");
        if (Barriere==1){
          lcd.clear();
          lcd.setCursor(3, 0);
          lcd.print("Ouverture");
        }
      }
    } else {
      Serial.print("Error on sending GET: ");
      Serial.println(httpResponseCode);
    }

    http.end();
  } else {
    Serial.println("Error in WiFi connection");
  }
  delay(5000);  // Send a request every 10 seconds
}