#include <math.h>

//10Kohm Res e TempRes

double Thermister(int RawADC) {
 double Temp;
 Temp = log(((10240000/RawADC) - 10000));
 Temp = 1 / (0.001129148 + (0.000234125 * Temp) + (0.0000000876741 * Temp * Temp * Temp));
 Temp = Temp - 273.15;            // Convert Kelvin to Celcius
 //Temp = (Temp * 9.0)/ 5.0 + 32.0; // Convert Celcius to Fahrenheit
 return Temp;
}


int pinIn = 2;

int pinLed [] = {5, 6, 7, 8, 9, 10};

int r;

void setup(){
  Serial.begin(9600);
  pinMode (pinIn, INPUT);
  for (int a=0; a<6; a++){
     pinMode(pinLed[a],OUTPUT);
   }
}

void loop(){
  r=analogRead(pinIn);
  Serial.println(Thermister(r));
  Serial.println(r);
  if (r > 505) digitalWrite(pinLed[5], HIGH);
  else digitalWrite(pinLed[5], LOW);    
  if (r > 515) digitalWrite(pinLed[4], HIGH);
  else digitalWrite(pinLed[4],LOW);
  if (r > 525) digitalWrite(pinLed[3], HIGH);
  else digitalWrite(pinLed[3],LOW);
  if (r > 535) digitalWrite(pinLed[2], HIGH);
  else digitalWrite(pinLed[2],LOW);
  if (r > 545) digitalWrite(pinLed[1], HIGH);
  else digitalWrite(pinLed[1],LOW);
  if (r > 555) digitalWrite(pinLed[0], HIGH);
  else digitalWrite(pinLed[0],LOW);
  delay(100);
}
