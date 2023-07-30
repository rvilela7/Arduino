/*
 * Switch test program
 */

int switchPin = 2;              
int ledPin = 8;
int ledAzul = 9;
int val;

void setup()                    
{
  Serial.begin(9600);           
  pinMode(switchPin, INPUT);  
  pinMode(ledPin, OUTPUT);
  pinMode(ledAzul, OUTPUT);
}


void loop()                 
{
  //Serial.print("Read switch input: ");
  val = !digitalRead(switchPin);  //Estou a negar um pull-down
  if (val == HIGH){
     Serial.print ("ALERT: ");
     Serial.println (val);
     digitalWrite(ledAzul, LOW);
     for (int x = 0; x<5; x++){
       digitalWrite(ledPin, HIGH);
       delay(200);
       digitalWrite(ledPin, LOW);
       delay(200);
     }
  }else{
     digitalWrite(ledPin, LOW);
     digitalWrite(ledAzul, HIGH);
  }
  delay(100);
}

