// Electrical Diagram is based on the SerialDisplay example, 
// plus a few extras, mainly leds and a few switches.
#include <LiquidCrystal.h>

LiquidCrystal lcd(12,11,5,4,3,2);

byte charcount;
char temp[127];
char code;
bool codeprint = false;
char up[16];

void setup(){
  lcd.begin(20,4); 
  Serial.begin (9600);
}


void loop()
{
  if (Serial.available()) {
    delay(200);
    lcd.clear();
    charcount = 0;
    while (Serial.available() > 0) {
      temp[charcount++]=Serial.read();
    }
    code = temp[--charcount];
    codeprint = true;
  }
  
  if (code=='B'){
    if (codeprint){
      lcd.cursor();
      for (int x=0; x<charcount; x++){
        if (x==40) {
          lcd.setCursor(0,1);
        }
        lcd.write(temp[x]);
        delay(150);
        if (x>13) lcd.scrollDisplayLeft();
      }
      lcd.noCursor();
      codeprint=false;
      delay(2000);
    }else{
      lcd.scrollDisplayLeft();
      delay(200); 
    }
  }
  
  
  if (codeprint && code=='A'){
    for (int x=0; x<charcount; x++){
      if (temp[x]=='\n') lcd.setCursor(0,1);
      else lcd.write(temp[x]);
    }
    codeprint = false;
  }
  
  if (codeprint && code=='C'){
      lcd.setCursor(0,1);
      lcd.cursor();
      for (int x=0, y=0; x<charcount; x++, y++){
        up[y] = temp[x];
        if (x!=0 && x % 16 == 0) {
          y=0;
          lcd.clear();
          lcd.setCursor(0,0);
          lcd.print(up);
          lcd.setCursor(0,1);
          delay (150);
        }
        lcd.write(temp[x]);
        delay(150);
      }
      lcd.noCursor();
      codeprint=false;
      delay(2000);   
  }
}






