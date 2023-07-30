#include <TimedAction.h>
#include <OnFinish.h>

#Howto
#Pulldown Switch with 10Kohm
#Red led for alert
#Yellow led for waiting state
#buzzer when button pressed

const byte ledPin = 8;
const byte ledAzul = 9;
const byte switchPin = 2;
const byte buzzer = 10;

TimedAction alerta = TimedAction(200,blink);
OnFinish endAlert = OnFinish(4000);

int val;
boolean ls = 1;

void setup()                    
{
  Serial.begin(9600);           
  pinMode(switchPin, INPUT);  
  pinMode(ledPin, OUTPUT);
  pinMode(ledAzul, OUTPUT);
  pinMode(buzzer, OUTPUT);
  alerta.disable();
}


void loop()                 
{
  //Serial.print("Read switch input: ");
  val = !digitalRead(switchPin);  //Estou a negar um pull-down
  if (val == HIGH){
    Serial.print ("ALERT: ");
    Serial.println (val);
    endAlert.reset();
    alerta.enable();
    digitalWrite(ledAzul, LOW);
    analogWrite(buzzer,20);
  }else{
    analogWrite(buzzer,0);
  }

  if (alerta.isActive()){
    if (endAlert.isFinished()){
      Serial.println ("End Alert!");
      alerta.disable();  
    }
  }else{
    digitalWrite(ledAzul, HIGH);
    digitalWrite(ledPin, LOW);
  }

  alerta.check();
  delay(100);
}

void blink(){
  digitalWrite(ledPin, ls);
  ls ? ls = LOW : ls = HIGH;
}



