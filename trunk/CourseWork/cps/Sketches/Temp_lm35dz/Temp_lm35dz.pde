/*
An open-source LM35DZ Temperature Sensor for Arduino. This project will be enhanced on a regular basis
(cc) by Daniel Spillere Andrade , http://www.danielandrade.net
http://creativecommons.org/license/cc-gpl
*/

int pin = 0; // analog pin
int pin1= 2; //analog pin
int tempc = 0,tempf=0; // temperature variables
int samples[8]; // variables to make a better precision
int maxi = -100,mini = 100; // to start max/min temperature
int i;
int moisture;

void setup()
{
  Serial.begin(57600); // start serial communication
}

void loop()
{
  
  
for(i = 0; i<=7;i++){ // gets 8 samples of temperature
  
  samples[i] = ( 3.27 * analogRead(pin) * 100.0) / 1024.0;
  tempc = tempc + samples[i];
  delay(1000);

}

moisture = analogRead(pin1);

tempc = tempc/8.0; // better precision
tempf = (tempc * 9)/ 5 + 32; // converts to fahrenheit

//if(tempc > maxi) {maxi = tempc;} // set max temperature
//if(tempc < mini) {mini = tempc;} // set min temperature

Serial.print("@");
Serial.print("1");
Serial.print("|");
Serial.print(tempc,DEC);
Serial.print("|");
Serial.print(moisture,DEC);

tempc = 0;

delay(5000); // delay before loop
}
