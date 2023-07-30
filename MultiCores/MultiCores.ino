
int redPin = 9;
int greenPin = 10;
int bluePin = 11;

//uncomment this line if using a Common Anode LED
#define COMMON_ANODE

void setup()
{
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
}

int b;

void loop()
{
  for (b = 0; b < 255;) //Crescente vermelho
  {
    setColor(b , 0, 0);
    if (b == 0) delay(6000);
    else delay(300);
    b += 10;
  }

  setColor(255, 0, 0);  // red
  delay(35000);

  for (int c = 0; c < 20; c++)
  {
    setColor((c%2)*255,0,((c+1)%2)*255);
    delay(150);
  }

  setColor(0, 0, 255);  // blue
  delay(35000);

  for (int c = 0; c < 20; c++)
  {
    setColor(100,(c%2)*255,((c+1)%2)*255);
    delay(150);
  }

  randomSeed(255); //Random
  for (int a = 0; a < 20; a++)
  {
    setColor(random(255), random(255), random(255));
    delay(250 * (random(4) + 1));
  }

  setColor(0, 255, 0);  // green
  delay(35000);

  
  randomSeed(255);
  for (int a = 0; a < 20; a++)
  {
    setColor(random(255), random(255), random(255)); 
    delay(250 * (random(4) + 1));
  }

  for (b = 255; b > 0;) // decrescente
  {
    setColor(b , 0, 0);
    if (b == 255) delay(6000);
    else delay(300);
    b -= 10;
  }
  delay(10000);

}

void setColor(int red, int green, int blue)
{
#ifdef COMMON_ANODE
  red = 255 - red;
  green = 255 - green;
  blue = 255 - blue;
#endif
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);
}
