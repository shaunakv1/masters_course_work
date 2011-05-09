/*
An open-source LM35DZ Temperature Sensor for Arduino. This project will be enhanced on a regular basis
(cc) by Daniel Spillere Andrade , http://www.danielandrade.net
http://creativecommons.org/license/cc-gpl
*/

int pin = 0; // analog pin
int pin1= 2; //analog pin


int getTemperature()
{
    int samples[8];  
    int tempc = 0;
    int i;
    for(i = 0; i<=7;i++)
    { // gets 8 samples of temperature
    
      samples[i] = ( 3.27 * analogRead(pin) * 100.0) / 1024.0;
      tempc = tempc + samples[i];
      delay(1000);
    }
    
    tempc = tempc/8.0; // better precision
    
    return tempc;
}

int getMoisture()
{
  return analogRead(pin1);
}

void setup()
{
  Serial.begin(57600); // start serial communication
}

void loop()
{
  
  

int tempc = getTemperature();

int moisture = getMoisture();

Serial.print("$");
Serial.print("1");
Serial.print("#");
Serial.print(tempc,DEC);
Serial.print("#");
Serial.print(moisture,DEC);
Serial.print("@");

tempc = 0;

delay(5000); // delay before loop
}
