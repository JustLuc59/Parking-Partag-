const int IN1=25;
const int IN2=33;
void setup() {
  // put your setup code here, to run once:
pinMode(IN1,OUTPUT);
pinMode(IN2,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
//sense horaire
  digitalWrite(IN1,HIGH);
  digitalWrite(IN2,LOW);
  delay(75);
  //phase repos
  digitalWrite(IN1,LOW);
  digitalWrite(IN2,LOW);
  delay(2000);
  //sens anti horaire
  digitalWrite(IN1,LOW);
  digitalWrite(IN2,HIGH);
  delay(75);
  //phase repos
  digitalWrite(IN1,LOW);
  digitalWrite(IN2,LOW);
  delay(2000);
}
