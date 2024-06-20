#include <Wire.h>
#include <VL53L1X.h>

VL53L1X sensor;

void setup()
{
  Serial.begin(115200);
  Wire.begin();

  if (!sensor.init())
  {
	Serial.println("Failed to detect and initialize sensor!");
	while (1);
  }

  sensor.setDistanceMode(); // Vous pouvez également utiliser setDistanceModeLong() selon vos besoins
  //sensor.setInterMeasurementInMs(100); // Définir le délai entre les mesures en millisecondes

  Serial.println("Sensor online!");
}

void loop()
{
  if (sensor.newDataReady())
  {
	uint16_t distance = sensor.readRangeContinuousMillimeters();
  
 // illimeters(); // Lecture de la distance en continu en millimètres
	Serial.print("Distance (mm): ");
	Serial.println(distance);
  }

  delay(100); // Attendre un court délai avant la prochaine mesure
}
